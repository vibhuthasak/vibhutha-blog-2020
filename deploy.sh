#!/usr/bin/bash
set -e

echo -e "\033[0;32mCompling...\033[0m"
hugo

cd public

git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Run below command if /bin/bash^M: bad interpreter: No such file or directory error occured
# sed -i -e 's/\r$//' scriptname.sh