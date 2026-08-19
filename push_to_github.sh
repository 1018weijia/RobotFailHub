#!/usr/bin/env bash
# Run on a machine with GitHub access (e.g. Windows PC with gh auth login)
set -euo pipefail
cd "$(dirname "$0")"

echo "==> Fetch remote README baseline"
git fetch origin main
git rebase origin/main || {
  echo "Rebase conflict: resolve, then run: git rebase --continue && git push"
  exit 1
}

echo "==> Push to https://github.com/1018weijia/RobotFailHub"
git push -u origin main
echo "Done."
