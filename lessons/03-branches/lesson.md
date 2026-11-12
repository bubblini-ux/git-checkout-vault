# 03 - Branches

## The idea

A branch is nothing more than a **movable label pointing at a commit**.
Creating one is instant and costs nothing. When you commit, the label of the
branch you are on moves forward to the new commit; every other label stays put.

`HEAD` is Git's "you are here" marker. Normally it points at a branch.

```
            main
             |
A --- B --- C
             \
              D   <- feature/login  <- HEAD
```

## Commands

| Command | What it does |
| --- | --- |
| `git branch` | List branches (`*` marks the current one) |
| `git switch <name>` | Move to an existing branch |
| `git switch -c <name>` | Create a branch here and move to it |
| `git branch -m <old> <new>` | Rename a branch |
| `git branch -d <name>` | Delete a branch that is already merged |
| `git log --oneline --graph --all` | Draw the whole commit graph |

`git checkout <name>` and `git checkout -b <name>` are the older spellings of
`switch` and `switch -c`. You will see both in the wild.

## Your task

The sandbox has a `main` branch plus two leftovers, `tmp` and `old-idea`.

1. From `main`, create `feature/login` and commit a new file `login.txt` on it.
2. Go back to `main`, create `feature/signup` and commit a new file
   `signup.txt` on it.
3. Rename the branch `tmp` to `experiment`.
4. Delete the branch `old-idea`.
5. Finish on `main`.

`main` itself must not gain any commits.

## Hints

- A new branch starts wherever you are standing. Switch to `main` *before*
  creating `feature/signup`, or it will contain `login.txt` too.
- Run `git log --oneline --graph --all` after each step and watch the labels.
