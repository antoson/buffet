#!/usr/bin/env bash

# count how many commit messages mention typos
# and divide by total num of commits
# result is the ratio of dyslectic commtis

typos="$(git log -i --grep=typo --grep=spelling --pretty=%h | wc -l)"
total="$(git rev-list --count HEAD)"

# lmao bash cannot even into float math
ratio=$(lua -e "print(string.format('%.2f', $typos/$total))")
echo "$typos out of $total commits ($ratio%) are dyslectic."

