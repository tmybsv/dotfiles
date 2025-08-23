set fish_greeting ""

set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx EDITOR "nvim"
set -gx BROWSER chromium
set -gx PAGER less
set -gx EDITOR nvim
set -gx PATH /bin ~/.local/bin /usr/local/sbin /usr/local/bin /usr/bin \
    ~/.npm-global/bin ~/.cargo/bin ~/.go/bin ~/.dotnet/tools /opt/cuda/bin ~/yandex-cloud/bin/
set -gx GOPATH "$HOME/.go"
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

abbr duh "du -hs * | sort -h"
abbr webcam "mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
abbr mci "doas make clean install"
abbr gp "git push"
abbr gc "git commit -m"
abbr gs "git status"
abbr gl "git log --graph --oneline --all --decorate"
abbr ga "git add"
abbr gd "git diff"

alias scc "scc --no-cocomo -c"
alias cdf 'cd $(fd -td . | fzy)'
