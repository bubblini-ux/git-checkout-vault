#!/usr/bin/env bash
set -euo pipefail
git init
git config user.name "Your Name"
git config user.email "you@example.com"

echo "Hello, Git!" > hello.txt
git add hello.txt
git commit -m "Add hello.txt"

echo "A second line." >> hello.txt
git add hello.txt
git commit -m "Add a second line"
