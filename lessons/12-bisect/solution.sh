#!/usr/bin/env bash
set -euo pipefail
git bisect start main v1.0
git bisect run ./test.sh
git rev-parse refs/bisect/bad > answer.txt
git bisect reset
