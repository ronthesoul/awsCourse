#!/usr/bin/env bash

num="${1:-2}"   # default to 2 if no arg 1
len="${2:-10}"  # default to 10 if no arg 2

i=1
while [[ $i -le $num ]]; do
    go run ./main.go "$len"
    ((i++))
done
