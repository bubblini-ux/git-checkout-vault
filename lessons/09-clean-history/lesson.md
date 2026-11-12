# 09 - Cleaning up history before sharing

## The idea

While working you commit often and messily: `wip`, `fix typo`, `oops`. That
is fine - but before you share the branch, you can reshape those commits
into a tidy story. As long as the commits are still only yours, rewriting
them is safe.

**Interactive rebase** is the tool. `git rebase -i <base>` opens a to-do list
of your commits, oldest first:

```
pick 1a2b3c4 Add intro
pick 5d6e7f8 fix typo
pick 9a8b7c6 wip
```

Change the word in front of a commit to tell Git what to do with it:

| Word | Effect |
| --- | --- |
| `pick` | Keep the commit as is |
| `reword` | Keep it, but edit the message |
| `squash` | Melt it into the commit above, combine the messages |
| `fixup` | Melt it into the commit above, discard its message |
| `drop` | Delete the commit |

You can also reorder the lines. Save and close the editor and Git replays
the list.

A blunter alternative for "squash everything": `git reset --soft <base>`
moves the branch back to `<base>` but leaves all your changes staged, ready
for one fresh commit.

## Your task

You are on `feature/readme`, which has four messy commits on top of `main`.

Turn them into **one** commit with the message `Add project intro`.

The final content of the branch must not change - only the history. `main`
stays untouched.

## Hints

- With `git rebase -i main`: leave the first line as `pick`, change the
  other three to `fixup`, then fix the message with
  `git commit --amend -m "Add project intro"`. (Or mark the first line
  `reword`.)
- If the editor is unfamiliar, set a friendlier one first:
  `git config core.editor nano`.
- The tag `backup/original` marks where the branch started. Compare with
  `git diff backup/original` - it should print nothing when you are done.
