# 06 - Undoing things

## The idea

Which undo you need depends on **where the mistake lives**:

| The mistake is... | Fix | Rewrites history? |
| --- | --- | --- |
| an edit in the working directory | `git restore <file>` | no |
| staged by accident | `git restore --staged <file>` | no |
| in the **last** commit (message or content) | `git commit --amend` | yes |
| in an older commit that others already have | `git revert <commit>` | no - adds a new commit |
| several recent local commits | `git reset <commit>` | yes |

The golden rule: **never rewrite commits other people already have.** For
shared history, add a *revert* commit that undoes the change instead.

`git reset` comes in three strengths: `--soft` (keep changes staged),
`--mixed` (default; keep changes unstaged) and `--hard` (throw changes away).

Careful: `git restore <file>` and `git reset --hard` discard uncommitted work
for good. Nothing else in Git is this unforgiving.

## Your task

The sandbox is a novel in progress with four separate messes. Clean them up
**in this order**:

1. `story.txt` has garbage in it that was never committed. Discard the edit.
2. `passwords.txt` was staged by accident. Unstage it, but keep the file on
   disk.
3. The last commit message has a typo: `Add chpater two`. Change it to
   `Add chapter two`.
4. The older commit `Add spoilers` should never have happened, but pretend
   it is already shared with the team. Undo its effect **without** removing
   it from history.

## Hints

- Order matters: if `passwords.txt` is still staged when you amend, it gets
  swept into the amended commit.
- `git commit --amend -m "new message"` replaces the last commit's message.
- Find the spoilers commit with `git log --oneline`, then `git revert <hash>`.
  Git opens an editor for the revert message - save and close.
