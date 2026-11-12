# 07 - Stash: parking unfinished work

## The idea

You are halfway through a feature when an urgent fix comes in on another
branch. Your work is too rough to commit, but you cannot switch branches with
it lying around. `git stash` sweeps your uncommitted changes onto a shelf and
gives you a clean working directory. Later you take them back down.

The stash is a stack: the most recent stash is `stash@{0}`.

## Commands

| Command | What it does |
| --- | --- |
| `git stash` | Shelve changes to tracked files |
| `git stash -u` | Same, and include **untracked** files too |
| `git stash list` | See what is on the shelf |
| `git stash show -p` | Show the newest stash as a diff |
| `git stash pop` | Re-apply the newest stash and remove it from the shelf |
| `git stash apply` | Re-apply but keep it on the shelf |
| `git stash drop` | Delete the newest stash |

## Your task

You are on `feature/search` with unfinished work: an edit to `search.txt`
and a brand-new, untracked `ideas.txt`. Meanwhile `main` ships a typo:
`version.txt` says `1.0.0-brokn`.

1. Stash your work, **including the untracked file**.
2. Switch to `main`, change `version.txt` to say exactly `1.0.0`, and commit.
3. Switch back to `feature/search` and bring your work back from the stash.
4. Commit the unfinished work (both files) on `feature/search`.

Finish on `feature/search` with an empty stash.

## Hints

- Plain `git stash` leaves `ideas.txt` behind, and it would follow you to
  `main`. That is what `-u` is for.
- After `git stash pop`, `git status` should look just like it did before
  you stashed.
