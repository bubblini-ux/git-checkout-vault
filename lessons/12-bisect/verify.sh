culprit="$(git log --format=%H -S'rate=80' main -- tax.conf | tail -n 1)"

check "answer.txt exists"                        '[ -s answer.txt ]'
check "answer.txt names the first bad commit"    '[ "$(git rev-parse --verify "$(tr -d "[:space:]" < answer.txt)^{commit}")" = "$culprit" ]'
check "the bisect session is finished"           '[ ! -f .git/BISECT_START ]'
check "you are back on main"                     'on_branch main'
