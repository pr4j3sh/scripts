# scripts

Personal bash scripts, installed to `~/.local/bin`.

## Install

```sh
curl -ssL https://raw.githubusercontent.com/pr4j3sh/scripts/master/install.sh | bash
```

Installs each script from `bin/` into `~/.local/bin` (make sure it's on your `PATH`; the installer will warn you if it isn't).

## Scripts

### gt

```sh
gt x <repo_name>   # clone git@github.com:pr4j3sh/<repo_name>.git into current directory
gt c <commit_msg>  # git add -A, commit -m <msg>, push to origin HEAD
gt i               # git init, initial commit, branch -M master,
                   # add origin git@github.com:pr4j3sh/<current-dir-name>.git, push -u origin master
```

Notes:
- `gt i` expects a repo named after the current directory to already exist on GitHub (create it manually first).
- `gt c` exits non-zero with "nothing to commit" if there are no changes.

## Adding a new script

1. Add `bin/<name>.sh`.
2. Add `<name>` to the `SCRIPTS` array in `install.sh`.
3. Commit and push.
