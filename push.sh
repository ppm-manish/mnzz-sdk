#!/bin/sh
VERSION=1.0.3

setup_git() {
  git config --global user.email "manish.kumar@paypermint.in"
  git config --global user.name "ppm-manish"
}

commit_files() {
    git clone https://${TOKEN}:x-oauth-basic@github.com/ppm-manish/mnzz-ios.git
    mkdir -p mnzz-ios/Framework
    rm mnzz-ios/Framework/*
    cp -rf universal/Mnzz.framework mnzz-ios/Framework/Mnzz.framework
    cd mnzz-ios
    
    git checkout master
    git add Framework/Mnzz.framework
    
    git commit --message "Upload framework $VERSION"
    
    git push -u origin master 
}

setup_git
commit_files