set fish_greeting ""

set -gx PICO_SDK_PATH /usr/share/pico-sdk
set -gx EDITOR "nvim"
set -gx BROWSER chromium

set -gx PATH /bin ~/.local/bin /usr/local/sbin /usr/local/bin /usr/bin \
    ~/.npm-global/bin ~/.cargo/bin ~/.go/bin ~/.dotnet/tools /opt/cuda/bin

set -gx GOPATH "$HOME/.go"

set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx MESA_LOADER_DRIVER_OVERRIDE "iris"
set -gx LIBVA_DRIVER_NAME "iHD"

abbr duh "du -hs * | sort -h"
abbr webcam "mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
abbr mci "doas make clean install"

abbr gp "git push"
abbr gc "git commit -m"
abbr gs "git status"
abbr gl "git log --pretty=oneline"
abbr ga "git add"
abbr gd "git diff"

alias scc "scc --no-cocomo -c"
alias cdf 'cd $(fd -td . | fzy)'
