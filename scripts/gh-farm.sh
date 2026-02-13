#!/bin/bash

cd "$HOME/lnu-courses/obsidian-vault" || exit 1

git diff-index --quiet HEAD -- && exit 0

git add .
git commit -m "Auto backup: $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1
git push >/dev/null 2>&1

