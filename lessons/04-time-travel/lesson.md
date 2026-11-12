# 04 - Checkout: travelling through history

## The idea

Every commit is a complete snapshot, so Git can put **any** past version back
in your working directory. There are two very different things you can bring
back:

- **The whole project** as it was at a commit. `HEAD` then points straight at
  a commit instead of a branch - the famous *detached HEAD*. It is safe to
  look around; just create a branch before you commit anything you want to keep.
- **A single file** from an old commit, while you stay on your branch. The
  old version shows up as a change, ready to commit.

A *tag* (like `v1.0`) is a permanent name for one commit - a label that never
moves, unlike a branch.

## Commands

| Command | What it does |
| --- | --- |
| `git log --oneline` | Find the commit you want |
| `git switch --detach <commit>` | Visit a commit (older: `git checkout <commit>`) |
| `git switch -c <name>` | Start a branch from wherever you are |
| `git switch -` | Jump back to the previous branch |
| `git restore --source <commit> <file>` | Bring one file back from a commit (older: `git checkout <commit> -- <file>`) |
| `git show <commit>:<file>` | Print an old version without changing anything |
| `git diff <commit> -- <file>` | Compare a file with its old version |

## Your task

The sandbox is a bread recipe project. Release `v1.0` worked. Since then
`recipe.txt` got better, but someone ruined `settings.txt` (900 degrees!).

1. Visit `v1.0` and look at the files as they were. Notice the detached HEAD
   message.
2. While there, create a branch named `hotfix` pointing at `v1.0`.
3. Return to `main`.
4. Restore **only** `settings.txt` to its `v1.0` version and commit that.
   The newer `recipe.txt` must be kept.

## Hints

- `git status` tells you when HEAD is detached and what it is detached at.
- After restoring the file, `git diff --staged` or `git diff` shows the
  oven going back from 900 to 220.
- Do not use `git reset --hard v1.0` on main: that would also throw away the
  recipe improvements.
