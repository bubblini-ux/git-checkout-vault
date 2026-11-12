# 11 - Remotes: clone, push, fetch, pull

## The idea

A **remote** is another copy of the repository, usually on a server such as
GitHub. Your repo and the remote do not talk unless you tell them to.

- `git clone` copies a remote and names it `origin`.
- `git push` uploads your commits to the remote.
- `git fetch` downloads the remote's new commits **without touching your
  branches**. They show up as *remote-tracking branches* like `origin/main`.
- `git pull` is `fetch` followed by merging (or rebasing) into your branch.

```
your branch:      main            what you last saw on the server:  origin/main
```

A local branch can have an **upstream** - the remote branch it pushes to and
pulls from. `git push -u origin <branch>` sets it the first time; afterwards
plain `git push` and `git pull` are enough.

## Commands

| Command | What it does |
| --- | --- |
| `git clone <url> [dir]` | Copy a remote repository |
| `git remote -v` | List remotes |
| `git push -u origin <branch>` | Publish a branch and set its upstream |
| `git fetch` | Download new commits, change nothing locally |
| `git log --oneline main..origin/main` | What does the server have that I do not? |
| `git pull` | Fetch and integrate into the current branch |
| `git branch -vv` | Show each branch's upstream and ahead/behind state |

## Your task

No server needed: the sandbox contains `origin.git`, a bare repository that
plays the role of GitHub, and `teammate.sh`, a script that plays a colleague.

1. Clone `origin.git` into a folder named `work`, then `cd work`.
2. Create a branch `feature/greeting`, commit a new file on it, and push it
   to `origin` **with upstream tracking**.
3. Run `../teammate.sh`. Your teammate Tess pushes a commit to `main` on the
   server.
4. Run `git fetch` and inspect what arrived with
   `git log --oneline main..origin/main`.
5. Switch to `main` and pull, so your `main` matches the server.

Run the check from anywhere; it looks inside `work`.

## Hints

- If Git refuses to commit in the fresh clone, set your identity as in
  lesson 1.
- After step 3 your local `main` has **not** changed - that is the point.
  Only fetching or pulling updates what you know about the server.
- `git status` on `main` after the fetch says "Your branch is behind
  'origin/main' by 1 commit".
