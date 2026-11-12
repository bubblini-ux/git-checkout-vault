# 01 - Your first commits

## The idea

Git records **snapshots** of a folder. A snapshot is called a *commit*.
Making one is always the same three-step rhythm:

1. **Edit** files in your working directory.
2. **Stage** the changes you want in the next snapshot (`git add`).
3. **Commit** the staged changes with a message (`git commit`).

```
working directory --git add--> staging area --git commit--> history
```

## Commands

| Command | What it does |
| --- | --- |
| `git init` | Turn the current folder into a repository |
| `git status` | What changed, what is staged? Run it constantly. |
| `git add <file>` | Stage a file |
| `git commit -m "message"` | Snapshot whatever is staged |
| `git log --oneline` | Show history, one line per commit |

Git needs to know who you are before it lets you commit. If it complains, run:

```
git config user.name "Your Name"
git config user.email "you@example.com"
```

## Your task

Your sandbox is an empty folder.

1. Turn it into a Git repository.
2. Create `hello.txt` with any text and commit it.
3. Add a second line to `hello.txt` and commit again.

You are done when the history has at least two commits and `git status`
says there is nothing to commit.

## Hints

- Run `git status` after every step and read what it says. It usually tells
  you the exact command to run next.
- A file changed after a commit must be `git add`-ed again before it can be
  committed. `git commit -am "msg"` does both for already-tracked files.
