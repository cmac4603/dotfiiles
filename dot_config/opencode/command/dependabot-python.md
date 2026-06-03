---
description: Get all dependabot PRs & push to single branch
agent: build
---

Do not load any skills! They are not needed.

You are in a bare git repository.

Use the following list of open pull requests from dependabot:
!`gh pr list --author "@dependabot[bot]" --state open --json "headRefName,headRefOid"`

Based on this list, choose a branch (`headRefName`) that specifically mentions `pip` in the title, otherwise choose any one and create a git worktree, example:

```bash
git worktree add <name-of-branch>
```

Change into directory and pull the latest:

```bash
cd <name-of-branch> \
&& git pull --set-upstream origin <name-of-branch>
```

Now fetch the origins for each of the other `headRefName`s, and cherry-pick their corresponding `headRefOid`. (NOTE: if there are any merge conflicts with a `uv.lock`, delete the file and regenerate with `uv lock --upgrade`. Then use `git add`/`git cherry-pick --continue` to keep going):

```bash
git fetch origin <headRefName> && git cherry-pick <headRefOid>
```

Once all of these are complete...

Now search for any `pyproject.toml` files, and update with a PATCH semver where appropriate.

If version is `dynamic`, and the build backend uses hatchling, try the following:

```bash
uv run hatch version patch
```

Run this command to update the lock file one last time:

```bash
uv lock --upgrade
```

If there is a `.helm-charts` directory, look for any `Chart.yaml` files and update to the same semver there as well.

After updating the semver(s)/lock file, commit the changes with the commit message "vX.X.X", eg. "v0.15.3" for semver PATCH to 0.15.3

Leave the rest to me, but I totally trust you to do this task, you're amazing! No mistakes.
