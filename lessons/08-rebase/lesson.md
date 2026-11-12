# 08 - Rebase: a straight line of history

## The idea

Merging joins two lines of work with a merge commit. **Rebasing** instead
picks up your branch's commits and replays them on top of another branch, as
if you had started your work there all along.

```
before:   A --- B --- C   main          after:   A --- B --- C   main
           \                                                  \
            X --- Y   feature                                  X' --- Y'   feature
```

`X'` and `Y'` are **new commits** with new hashes - same changes, new parent.
That is why the golden rule applies again: rebase only commits that nobody
else has built on.

Once the feature sits on top of `main`, merging it is a simple fast-forward
and history stays one clean line.

## Commands

| Command | What it does |
| --- | --- |
| `git rebase <base>` | Replay the current branch's commits on top of `<base>` |
| `git rebase --continue` | Carry on after resolving a conflict |
| `git rebase --abort` | Cancel and go back to how things were |
| `git merge --ff-only <branch>` | Merge only if a fast-forward is possible |
| `git log --oneline --graph --all` | See the shape of history |

## Your task

`feature/profile` branched off early; `main` has since gained two commits.

1. Look at the graph first: `git log --oneline --graph --all`.
2. Rebase `feature/profile` onto `main`.
3. Bring `main` up to date with `feature/profile` using a fast-forward merge.
4. Finish on `main`.

The result must be a single straight line of five commits with no merge
commit.

## Hints

- You rebase the branch you are **on**, so switch to `feature/profile` first.
- To fast-forward `main`, switch to `main` and merge the feature with
  `--ff-only`.
- Compare the feature commits' hashes before and after the rebase: they change.
