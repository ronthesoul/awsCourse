#!/usr/bin/env bash
set -euo pipefail

# REQUIREMENTS: aws CLI configured with admin perms; openssl; jq (optional)
# USAGE: ./create_soc_users.sh <account-alias> <Number of users>
# Example: ./create_soc_users.sh soc-sandbox
ALIAS="${1:-}"
num="${1:-2}"
if [[ -z "$ALIAS" ]]; then
  echo "Usage: $0 <account-alias> <number-of-users>"; exit 1
fi

if ! aws iam list-account-aliases --query "AccountAliases[]" --output text | grep -qx "$ALIAS"; then
  aws iam create-account-alias --account-alias "$ALIAS" >/dev/null
fi
SIGNIN_URL="https://${ALIAS}.signin.aws.amazon.com/console"

GROUP="SOC-ReadOnly"
if ! aws iam get-group --group-name "$GROUP" >/dev/null 2>&1; then
  aws iam create-group --group-name "$GROUP" >/dev/null
fi
if ! aws iam list-attached-group-policies --group-name "$GROUP" \
  --query 'AttachedPolicies[?PolicyName==`ReadOnlyAccess`]' --output text | grep -q .; then
  aws iam attach-group-policy --group-name "$GROUP" \
    --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess
fi

OUT="soc_users_credentials.csv"
echo "username,temp_password,signin_url" > "$OUT"

make_pwd() { openssl rand -base64 18 | tr -d '\n' | tr '/+' 'Aa' | cut -c1-16; }

for i in $(seq -w 1 2); do
  USER="soc-user-${i}"

  if ! aws iam get-user --user-name "$USER" >/dev/null 2>&1; then
    aws iam create-user --user-name "$USER" \
      --tags Key=Team,Value=SOC Key=Purpose,Value=Training >/dev/null
  fi

  aws iam add-user-to-group --user-name "$USER" --group-name "$GROUP" >/dev/null 2>&1 || true

  PASS="$(make_pwd)Aa1!"
  if aws iam get-login-profile --user-name "$USER" >/dev/null 2>&1; then
    aws iam update-login-profile --user-name "$USER" --password "$PASS" >/dev/null
  else
    aws iam create-login-profile --user-name "$USER" --password "$PASS"  >/dev/null 2>&1 || \
    aws iam create-login-profile --user-name "$USER" --password "$PASS"  >/dev/null
  fi

  echo "${USER},${PASS},${SIGNIN_URL}" >> "$OUT"
  echo "Prepared ${USER}"
done

echo
echo "Created/updated users and saved credentials to: ${OUT}"
echo "Console sign-in URL: ${SIGNIN_URL}"
echo "IMPORTANT: Distribute passwords securely. Require MFA after first login."
