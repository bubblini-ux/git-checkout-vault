# Git cheat sheet

Everything the lessons teach, on one page.

## Everyday loop

```
git status                      # where am I, what changed?
git diff                        # unstaged changes
git diff --staged               # what the next commit will contain
git add <file>                  # stage a file      (git add -p: piece by piece)
git commit -m "message"         # snapshot staged changes
git log --oneline --graph --all # the whole picture
```

## Branches

```
git switch <branch>             # move to a branch        (old: git checkout <branch>)
git switch -c <branch>          # create + move           (old: git checkout -b <branch>)
git switch -                    # back to the previous branch
git branch -m <old> <new>       # rename
git branch -d <branch>          # delete (merged only; -D forces)
```

## Looking at the past

```
git switch --detach <commit>            # visit a commit   (old: git checkout <commit>)
git restore --source <commit> <file>    # bring one file back
git show <commit>:<file>                # print an old version
git tag <name>                          # permanent name for the current commit
```

## Combining work

```
git merge <branch>              # merge into the current branch
git merge --ff-only <branch>    # only if no merge commit is needed
git merge --abort               # back out of a conflicted merge
git rebase <base>               # replay my commits on top of <base>
git rebase -i <base>            # reorder / squash / reword my commits
git rebase --continue | --abort
```

Resolving a conflict: edit the file, remove `<<<<<<<` `=======` `>>>>>>>`,
`git add` it, then `git commit` (merge) or `git rebase --continue` (rebase).

## Undoing

| Situation | Command |
| --- | --- |
| Discard an uncommitted edit | `git restore <file>` |
| Unstage, keep the edit | `git restore --staged <file>` |
| Fix the last commit | `git commit --amend` |
| Undo a shared commit safely | `git revert <commit>` |
| Drop local commits, keep changes staged | `git reset --soft <commit>` |
| Drop local commits and changes | `git reset --hard <commit>` |
| Find "lost" commits | `git reflog` |

Never rewrite (amend, rebase, reset) commits that others already have.

## Parking work

```
git stash -u                    # shelve changes, including untracked files
git stash list
git stash pop                   # take them back
```

## Remotes

```
git clone <url>
git push -u origin <branch>     # first push of a branch
git fetch                       # download, change nothing
git log --oneline main..origin/main   # what is new on the server?
git pull                        # fetch + integrate
git branch -vv                  # upstreams and ahead/behind
```

## Hunting bugs

```
git bisect start <bad> <good>
git bisect good | bad
git bisect run <script>         # exit 0 = good
git bisect reset
```
