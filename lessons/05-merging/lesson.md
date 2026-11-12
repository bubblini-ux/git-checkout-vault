# 05 - Merging and conflicts

## The idea

`git merge <branch>` brings another branch's work into the branch you are on.

- If your branch has no commits of its own since the other one split off, Git
  just slides your label forward: a **fast-forward**.
- Otherwise Git combines both sides and records a **merge commit** with two
  parents.
- If both sides changed the **same lines**, Git cannot choose for you. It
  stops and marks the spot in the file:

```
<<<<<<< HEAD
what your branch says
=======
what the other branch says
>>>>>>> feature/pricing
```

A conflict is not an error. Edit the file so it reads the way it should,
delete the three marker lines, `git add` the file, then `git commit`.

## Commands

| Command | What it does |
| --- | --- |
| `git merge <branch>` | Merge that branch into the current one |
| `git status` | During a conflict: lists files that need you |
| `git diff` | During a conflict: shows the conflicting hunks |
| `git add <file>` | Mark a conflicted file as resolved |
| `git commit` | Finish the merge |
| `git merge --abort` | Give up and return to the state before the merge |

## Your task

A coffee shop repo. You are on `main`. Two feature branches are waiting:

1. Merge `feature/hours`. This one is painless. (Git may open an editor for
   the merge message - save and close it.)
2. Merge `feature/pricing`. It conflicts in `prices.txt`: both sides changed
   the coffee price. Resolve it so that:
   - coffee costs **4** (main's price wins),
   - the new `tea: 3` line from the feature branch is kept,
   - no conflict markers remain.
3. Complete the merge.

## Hints

- Open `prices.txt` in any editor; the markers are plain text.
- The final file should be exactly three lines: `coffee: 4`, `bagel: 2`,
  `tea: 3`.
- Messed up the resolution? `git merge --abort` and try again.
