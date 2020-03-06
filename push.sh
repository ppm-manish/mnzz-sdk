#!/bin/sh
VERSION=1.0.1

setup_git() {
  git config --global user.email "manish.kumar@paypermint.in"
  git config --global user.name "ppm-manish"
}

commit_website_files() {
  git checkout master
  git add -f releases/Mnzz-iOS-$VERSION.tar.gz
  git commit --message "Upload framework $VERSION"
  
}

upload_files() {
  git remote add origin https://${TOKEN}@github.com/ppm-manish/mnzz-ios.git > /dev/null 2>&1
  git push --quiet --set-upstream origin master 
}

setup_git
commit_website_files
upload_files