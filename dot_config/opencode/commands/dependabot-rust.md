---
description: Get all dependabot PRs & push to single branch
agent: build
---

You are in a bare git repository.

Use the following list of open pull requests from dependabot:
!`gh pr list --author "@dependabot[bot]" --state open --json "headRefName,headRefOid"`

Based on this list, choose a branch (`headRefName`) that specifically mentions `cargo` in the title, otherwise choose any one and create a git worktree, example:

```bash
git worktree add <name-of-branch>
```

Change into directory and pull the latest:

```bash
cd <name-of-branch> \
&& git pull --set-upstream origin <name-of-branch>
```

Now fetch the origins for each of the other `headRefName`s, and cherry-pick their corresponding `headRefOid`. (NOTE: if there are any merge conflicts with the `Cargo.lock`, delete the file and regenerate with `cargo update`. Then use `git add`/`git cherry-pick --continue` to keep going):

```bash
git fetch origin <headRefName> && git cherry-pick <headRefOid>
```

Now search for any `Cargo.toml` files, and update with a PATCH semver where appropriate.

Also, have a quick look for a `pyproject.toml` file, in case this rust app also has a python client, and update that version to be the same as well.

Cargo update will run here and alert me to any errors:

```bash
cargo update
```

After updating the semver(s), commit the changes with the commit message "vX.X.X", eg. "v0.15.3" for semver PATCH to 0.15.3

Leave the rest to me, but I totally trust you to do this task, you're amazing! No mistakes.
