#!/bin/bash

gh_latest() {
  echo $(curl -Ls https://api.github.com/repos/$1/releases/latest | jq -r ".tag_name" | sed "s/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/")
  return
}

main() {
  # bat
  repo="sharkdp/bat" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/bat-v${version}-x86_64-unknown-linux-gnu.tar.gz -O bat.tar.gz &&
    tar -xf bat.tar.gz bat-v${version}-x86_64-unknown-linux-gnu/bat --strip-components 1 &&
    mv bat ~/.local/bin/bat &&
    rm bat.tar.gz

  # exa
  repo="ogham/exa" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/exa-linux-x86_64-${version}.zip -O exa.zip &&
    unzip -q exa.zip &&
    mv exa-linux-x86_64 ~/.local/bin/exa &&
    rm exa.zip

  # fd
  repo="sharkdp/fd" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/fd-v${version}-x86_64-unknown-linux-gnu.tar.gz -O fd.tar.gz &&
    tar -xf fd.tar.gz fd-v${version}-x86_64-unknown-linux-gnu/fd --strip-components 1 &&
    mv fd ~/.local/bin/fd &&
    rm fd.tar.gz

  # gh
  repo="cli/cli" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/gh_${version}_linux_amd64.tar.gz -O gh.tar.gz &&
    tar -xf gh.tar.gz gh_${version}_linux_amd64/bin/gh --strip-components 2 &&
    mv gh ~/.local/bin/gh &&
    rm gh.tar.gz

  # ghq
  repo="x-motemen/ghq" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/ghq_linux_amd64.zip -O ghq.zip &&
    unzip -q ghq.zip &&
    mv ghq_linux_amd64/ghq ~/.local/bin/ghq &&
    rm -r ghq_linux_amd64 ghq.zip

  # gitui
  repo="extrawurst/gitui" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/gitui-linux-musl.tar.gz -O gitui.tar.gz &&
    tar -xf gitui.tar.gz &&
    mv gitui ~/.local/bin/gitui &&
    rm gitui.tar.gz

  # mmv
  repo="itchyny/mmv" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/mmv_v${version}_linux_amd64.tar.gz -O mmv.tar.gz &&
    tar xf mmv.tar.gz mmv_v${version}_linux_amd64/mmv --strip-components 1 &&
    mv mmv ~/.local/bin/mmv &&
    rm mmv.tar.gz

  # spt
  repo="Rigellute/spotify-tui" &&
    echo ${repo} &&
    version=$(gh_latest ${repo}) &&
    wget -q https://github.com/${repo}/releases/download/v${version}/spotify-tui-linux.tar.gz -O spt.tar.gz &&
    tar xf spt.tar.gz spt &&
    mv spt ~/.local/bin/spt &&
    rm spt.tar.gz
}

main
