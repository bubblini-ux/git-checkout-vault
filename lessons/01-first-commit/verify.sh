check "the sandbox is a Git repository"        '[ -d .git ]'
check "hello.txt is tracked"                   'git ls-files --error-unmatch hello.txt'
check "history has at least two commits"       '[ "$(git rev-list --count HEAD)" -ge 2 ]'
check "nothing left to commit"                 'clean_tree'
