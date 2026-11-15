#!/usr/bin/env bash
set -euo pipefail

GH_USER="pr4j3sh"

usage() {
  cat <<EOF
usage:
  gt x <repo_name>   clone git@github.com:${GH_USER}/<repo_name>.git into current directory
  gt c <commit_msg>  git add -A, commit -m, push to origin HEAD
  gt i               git init, commit, add origin (SSH, repo named after cwd), push to master
EOF
}

cmd="${1:-}"

case "$cmd" in
  x)
    repo="${2:-}"
    if [[ -z "$repo" ]]; then
      echo "error: missing repo name" >&2
      usage >&2
      exit 1
    fi
    git clone "git@github.com:${GH_USER}/${repo}.git"
    ;;

  c)
    msg="${2:-}"
    if [[ -z "$msg" ]]; then
      echo "error: missing commit message" >&2
      usage >&2
      exit 1
    fi
    git add -A
    if git diff --cached --quiet; then
      echo "nothing to commit" >&2
      exit 1
    fi
    git commit -m "$msg"
    git push -u origin HEAD
    ;;

  i)
    dir_name="$(basename "$PWD")"
    git init
    git add -A
    git commit -m "initial commit"
    git branch -M master
    git remote add origin "git@github.com:${GH_USER}/${dir_name}.git"
    git push -u origin master
    ;;

  *)
    usage >&2
    exit 1
    ;;
esac
