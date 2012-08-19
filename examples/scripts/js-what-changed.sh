TIMEAGO='1 week ago'
DIRS='config/assets.yml -- public/coffeescripts'
REPO='/Users/tlarsen/code/groupon'

cd $REPO
git checkout master
git pull --rebase
git log --since="$TIMEAGO" --no-merges --pretty=oneline -- $DIRS \
| awk '{print $1}' \
| xargs -I SHAs \
git --no-pager show SHAs -- $DIRS
cd -
