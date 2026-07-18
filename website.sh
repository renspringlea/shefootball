#!/usr/bin/env bash
cd ~/Documents/Websites/shefootball
#bundle lock --add-platform x86_64-linux
#bundle exec jekyll build --verbose
#bundle exec jekyll serve
#git config pull.rebase false
Rscript analysis_files/acl.R
# git pull
git add .
git commit -m "Update"
git push
