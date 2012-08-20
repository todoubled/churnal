cd $REPO_PATH
git checkout master
git pull --rebase
git log --since="$TIME_AGO" --no-merges --pretty=oneline -- $GIT_FILE_PATHS \
| awk '{print $1}' \
| xargs -I SHAs \
git --no-pager show SHAs -- $GIT_FILE_PATHS
cd -
