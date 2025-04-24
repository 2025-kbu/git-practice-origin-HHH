#!/bin/bash

# 파일 탐색 스크립트
if [ $# -ne 1 ]; then
  echo "Usage: $0 <extension>"
  exit 1
fi

find . -type f -name "*.$1"
