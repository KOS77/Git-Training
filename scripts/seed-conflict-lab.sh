#!/usr/bin/env bash
# Facilitator tool: prepare the Module 4 conflict lab.
#
# Run AFTER the reset PR (reset-workshop.sh) has been merged, while team-tips.md
# is still in its baseline state. It:
#   1. tags main as 'conflict-lab-start' (the commit attendees branch from), then
#   2. opens a PR replacing the TODO line with a facilitator tip, so every
#      attendee's edit to that line conflicts with main.
#
# Run from the root of a clone of the ORG repo (not a fork). Needs: git, gh (logged in).
set -euo pipefail

git switch main
git pull --ff-only

if ! grep -q '^- TODO: replace this line with your tip' team-tips.md; then
  echo "team-tips.md is not in its baseline state (the TODO tip line is missing)."
  echo "Run scripts/reset-workshop.sh and merge that PR first."
  exit 1
fi

# 1. Tag the baseline. -f moves the tag if it exists from a previous cohort.
git tag -f conflict-lab-start
git push -f origin conflict-lab-start

# 2. PR that changes the same line the attendees will change.
branch="seed/conflict-lab-$(date +%Y-%m-%d-%H%M)"
git switch -c "$branch"
sed 's/^- TODO: replace this line with your tip.*/- Facilitator tip: pull from upstream before you start any new piece of work./' \
  team-tips.md > team-tips.md.tmp
mv team-tips.md.tmp team-tips.md

git add team-tips.md
git commit -m "Add facilitator tip for conflict lab"
git push -u origin "$branch"
gh pr create --fill --base main --head "$branch"

echo
echo "Next: merge that PR (a second facilitator can comment on it to trigger the bot,"
echo "or an admin can merge directly). The tag already points BEFORE it, so attendees"
echo "who branch from conflict-lab-start will conflict with it."
