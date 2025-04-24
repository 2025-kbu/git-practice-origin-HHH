#!/bin/bash

# 날짜 계산 스크립트
if [ $# -eq 0 ]; then
  echo "Usage: $0 [+N | -N]"
  exit 1
fi

date --date="$1" +"%Y-%m-%d"
