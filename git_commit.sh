#!/usr/bin/env bash

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.


# -------------------------------------------------
# Description:  ...
# Create by:    ...
# Since:        ...
# -------------------------------------------------
# Version:      0.0.1  -- description
#               0.0.2b -- beta-format
# -------------------------------------------------
# Error code    1      -- error
# -------------------------------------------------
# Bug:          ...
# -------------------------------------------------

printf "Add all [T|F]? "
read -rn 1 add
echo ""

[[ "$add" == "T" ]] || [[ "$add" == "t" ]] && git add .

echo "Header?"
echo "    Accept feat: For 'feature'"
echo "           pref: For 'performance'"
echo "           refr: For 'refactor code'"
echo "           fix : For 'fix bug'"
echo "           doc : For 'document or manpage'"
echo "           rele: For 'release or dump version'"

read -r head
echo ""

printf "Short Description? "
read -r sentence
echo ""

echo "Body? exit by <CTRL+D>"
body="$(</dev/stdin)"

[ -n "$body" ] && body="${body}."

printf "Issue? "
read -r issues
if [ -n "$issues" ]; then
    echo "$issues" | grep "#" -q || issues="#${issues}"
fi
echo ""

git commit -m "$head: $sentence

$body $issues
"

echo "Need to validate[T|F]? "
read -rn 1 valid
echo ""

[[ "$valid" == "T" ]] || [[ "$valid" == "t" ]] && git command --amend