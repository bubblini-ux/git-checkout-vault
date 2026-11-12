# 02 - The staging area and .gitignore

## The idea

The staging area exists so that **you** decide what goes into each commit.
Good commits are small and about one thing, even when your working directory
contains several unrelated changes.

Some files should never be committed at all: secrets, logs, build output.
List patterns for them in a file named `.gitignore` and Git stops offering
them to you.

## Commands

| Command | What it does |
| --- | --- |
| `git status` | Shows *staged*, *not staged* and *untracked* separately |
| `git diff` | Changes not yet staged |
| `git diff --staged` | Changes that will go into the next commit |
| `git add <file>` | Stage just that file |
| `git add -p` | Stage a file piece by piece, interactively |
| `git restore --staged <file>` | Unstage (the file itself is untouched) |

`.gitignore` takes one pattern per line: `secret.env` matches that file,
`*.log` matches every file ending in `.log`, `build/` matches a directory.

## Your task

The sandbox holds four uncommitted things:

- `notes.md` - a modified tracked file
- `todo.md` - a new file
- `secret.env` - a new file containing an API key
- `debug.log` - a new log file

Sort them out:

1. Commit the change to `notes.md` **on its own**.
2. Commit `todo.md` **on its own**.
3. Create a `.gitignore` that ignores `secret.env` and **all** `.log` files,
   and commit it.

`secret.env` and `debug.log` must stay on disk but never enter history.

## Hints

- `git add .` would stage everything, including the secret. Name files
  explicitly instead.
- Check your work before each commit with `git diff --staged --stat`.
- `git status --ignored` shows which files are being ignored.
