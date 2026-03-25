#!/usr/bin/env bash
set -euo pipefail

# Usage: ./release.sh v1.2.0
# Creates a git tag and pushes it, triggering the GitHub release workflow.

if [ $# -eq 0 ]; then
  echo "Usage: ./release.sh <version>"
  echo "Example: ./release.sh v1.2.0"
  echo ""
  echo "Recent tags:"
  git tag --sort=-v:refname | head -5
  exit 1
fi

VERSION="$1"

# Validate format
if [[ ! "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: Version must match vX.Y.Z (e.g., v1.2.0)"
  exit 1
fi

# Check if tag already exists
if git rev-parse "$VERSION" >/dev/null 2>&1; then
  echo "Error: Tag $VERSION already exists"
  exit 1
fi

# Show what's going in
PREV_TAG=$(git tag --sort=-v:refname | head -1)
echo "Changes since ${PREV_TAG:-the beginning}:"
echo ""
if [ -n "$PREV_TAG" ]; then
  git log "${PREV_TAG}..HEAD" --oneline
else
  git log --oneline
fi
echo ""

read -rp "Tag and release as $VERSION? [y/N] " confirm
if [[ "$confirm" != [yY] ]]; then
  echo "Aborted."
  exit 0
fi

git tag -a "$VERSION" -m "Release $VERSION"
git push origin "$VERSION"

echo ""
echo "Tagged $VERSION and pushed. GitHub Actions will create the release."
echo "Watch it at: https://github.com/$(git remote get-url origin | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
