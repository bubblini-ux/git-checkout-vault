# 12 - Bisect: finding the commit that broke it

## The idea

Something worked at release `v1.0` and is broken now, with dozens of commits
in between. Reading them all is slow. **Bisect** does a binary search
instead: Git checks out the commit in the middle, you say whether it is
*good* or *bad*, and the search space halves. Twenty-odd commits take about
five steps; a thousand take ten.

If a script can tell good from bad (exit code 0 = good, anything else = bad),
Git will run the whole search for you.

## Commands

| Command | What it does |
| --- | --- |
| `git bisect start <bad> <good>` | Begin: `<bad>` is broken, `<good>` works |
| `git bisect good` / `git bisect bad` | Judge the commit Git checked out |
| `git bisect run <script>` | Let a script judge every step automatically |
| `git bisect log` | What has been decided so far |
| `git bisect reset` | Finish and return to where you started |

When the search ends Git prints `<hash> is the first bad commit`.

## Your task

`./test.sh` passes at `v1.0` and fails on `main`. Somewhere in between, one
commit broke the tax calculation. The commit messages are no help.

1. Confirm the problem: run `./test.sh; echo $?` on `main` (prints 1).
2. Use `git bisect` to find the first bad commit - by hand with
   `good`/`bad`, or automatically with `git bisect run ./test.sh`.
3. Write the hash of the first bad commit into a file named `answer.txt`.
4. End the bisect session so you are back on `main`.

## Hints

- Start with `git bisect start main v1.0` (bad first, then good).
- During a manual bisect, run `./test.sh` at each stop: exit code 0 means
  `git bisect good`, otherwise `git bisect bad`.
- `echo <hash> > answer.txt` - a short hash is fine.
- Forgetting `git bisect reset` leaves you on a detached HEAD in the middle
  of history.
