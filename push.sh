#!/bin/sh
VERSION=1.0.3

setup_git() {
  git config --global user.email "manish.kumar@paypermint.in"
  git config --global user.name "ppm-manish"
}

commit_files() {
    pwd
    git clone https://${TOKEN}:x-oauth-basic@github.com/ppm-manish/mnzz-ios.git
    ls -a
    mkdir -p mnzz-ios/Framework
    rm mnzz-ios/Framework/*
    cp -rf universal/Mnzz.framework mnzz-ios/Framework/Mnzz.framework
    ls mnzz-ios
    ls mnzz-ios/Framework
    
    cd mnzz-ios
    pwd
    ls -a
    git checkout master
    git add Framework/Mnzz.framework
    git status
    
    git commit --message "Upload framework $VERSION"
    git status
    
    git push -u origin master 
}

setup_git
commit_files
