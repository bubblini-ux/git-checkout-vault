# Git Checkout Vault

Learn Git by doing. Twelve short lessons, each with a throwaway practice
repository and an automatic check that tells you whether you got it right.

No reading marathon, no risk: every lesson runs in its own sandbox that you
can break and rebuild as often as you like.

## Quick start

You need Git 2.28 or newer and Bash (Linux, macOS, WSL or Git Bash).

```
./learn list        # see the lessons
./learn start 1     # build the sandbox and print lesson 1
cd sandbox/01-first-commit
# ... do the task ...
../../learn check 1
```

## How a lesson works

1. `./learn start <n>` builds a small repository in `sandbox/` with a
   situation to fix, and prints the lesson.
2. You work in that sandbox with ordinary Git commands.
3. `./learn check <n>` inspects the result and lists what passed and what
   did not.

| Command | What it does |
| --- | --- |
| `./learn list` | All lessons and your progress |
| `./learn start <n>` | Build the sandbox, print the lesson |
| `./learn show <n>` | Print the lesson again |
| `./learn check <n>` | Verify your work |
| `./learn reset <n>` | Rebuild the sandbox from scratch |
| `./learn solution <n>` | Show one possible solution |

Stuck? Each lesson ends with hints. Broke something? `reset` it - that is
what sandboxes are for.

## The lessons

| # | Lesson | You will learn |
| --- | --- | --- |
| 1 | Your first commits | `init`, `status`, `add`, `commit`, `log` |
| 2 | The staging area and .gitignore | focused commits, keeping secrets out |
| 3 | Branches | create, switch, rename, delete |
| 4 | Checkout: travelling through history | detached HEAD, tags, restoring old files |
| 5 | Merging and conflicts | fast-forward, merge commits, resolving conflicts |
| 6 | Undoing things | `restore`, `amend`, `revert`, `reset` |
| 7 | Stash | parking unfinished work |
| 8 | Rebase | linear history, fast-forward merges |
| 9 | Cleaning up history | interactive rebase, squashing |
| 10 | Reflog | recovering "lost" commits and branches |
| 11 | Remotes | `clone`, `push`, `fetch`, `pull`, upstreams |
| 12 | Bisect | binary-searching for the commit that broke it |

Do them in order; later lessons assume the earlier ones.
[CHEATSHEET.md](CHEATSHEET.md) collects every command on one page.

## Layout

```
learn               the lesson runner
lessons/NN-name/
  lesson.md         explanation, task, hints
  setup.sh          builds the sandbox
  verify.sh         the checks behind ./learn check
  solution.sh       a reference solution
lib/                helpers shared by setup and verify scripts
tests/run-all.sh    proves every lesson is solvable
sandbox/            your practice repos and progress (git-ignored)
```

## Adding a lesson

Create `lessons/13-topic/` with the four files above. `setup.sh` runs inside
an empty sandbox folder and can use `new_repo` and `commit "msg"` from
`lib/setup.sh`. `verify.sh` is a list of
`check "description" 'shell test'` lines. Then run:

```
tests/run-all.sh
```

It confirms for every lesson that the check fails on a fresh sandbox and
passes once `solution.sh` has run. The same test runs in CI on every push.
