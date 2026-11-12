# 10 - Reflog: the safety net

## The idea

Commits are very hard to truly lose. Deleting a branch or running
`git reset --hard` only removes a **label**; the commits themselves stay in
the repository for weeks. What you lose is the way to find them.

The **reflog** is Git's private diary of every position `HEAD` (and each
branch) has ever been at. If a commit existed and you were on it, the reflog
remembers its hash.

```
$ git reflog
a1b2c3d HEAD@{0}: reset: moving to HEAD~2
9f8e7d6 HEAD@{1}: commit: Add shipping options
...
```

`HEAD@{1}` means "where HEAD was one move ago". Any reflog entry can be used
wherever Git expects a commit.

## Commands

| Command | What it does |
| --- | --- |
| `git reflog` | Diary of HEAD's movements |
| `git reflog show <branch>` | Diary of one branch |
| `git branch <name> <commit>` | Create a branch at any commit |
| `git reset --hard <commit>` | Move the current branch (and files) to a commit |
| `git show <commit>` | Inspect a commit before you trust it |

## Your task

Two disasters struck this shop repo:

- The unmerged branch `feature/payment` (three commits, ending in
  `Add refund flow`) was deleted with `git branch -D`.
- `main` was hard-reset two commits back, losing `Add checkout page` and
  `Add shipping options`.

`git log` shows none of it any more. Recover both:

1. Re-create `feature/payment` pointing at its old tip, `Add refund flow`.
2. Put `main` back on `Add shipping options`.
3. Finish on `main`.

## Hints

- Read `git reflog` from top (newest) to bottom and look for the commit
  messages named above.
- For step 1 you do not need to move at all:
  `git branch feature/payment <hash>`.
- For step 2 you must be on `main`; the reset happened one move ago.
