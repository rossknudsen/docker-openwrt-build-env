#!/bin/bash

repo_url="https://github.com/openwrt/openwrt.git"
repo_name="openwrt"

mkdir -p /tmp/build
pushd /tmp/build

if [ ! -d "$repo_name" ]; then
  git clone "$repo_url" "$repo_name"
  echo "Repository '$repo_name' cloned successfully."
else
  echo "Repository '$repo_name' already exists."
fi

pushd "$repo_name"

./scripts/feeds update -a
./scripts/feeds install -a
