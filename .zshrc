export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

ZSH_THEME="charlie"

HIST_STAMPS="mm/dd/yyyy"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
fi

alias vim="/opt/homebrew/bin/nvim"
eval "$(zoxide init zsh)"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

fpush() {
    git add -A
    git commit -m $1
    git push
}

mvout() {
    mv ./$1/* ./
    rm -rf $1
}

copy() {
  rsync -avzP --include='*/' --include='*.mp4' --exclude='*' --rsh=ssh hieu1052k3@$1:/home/hieu1052k3/dreamfields/results ./results
}

synctpu() {
  rsync -avzP --rsh=ssh hieu1052k3@$1:/home/hieu1052k3/dreamfields/results ./
}

checkgpu() {
  tmux new -d -s gpu_monitor;
  for i in 1 2 3 4 5 6 7 8
  do
    tmux send "ssh -X charlie@geometry$i.kaist.ac.kr -p 60005 -i ~/.ssh/id_rsa -t \"source ~/.zshrc && gpustat -i; zsh -l\"" ENTER;
    tmux split-window;
    tmux select-layout tiled;
  done
  tmux a;
}

alias python="python3.10"
alias t2="tree -L 2 -a"
alias t1="tree -L 1 -a"

alias ibsGPU="ssh -p 4022 charlie@203.247.189.192"
alias ibsNotebook="ssh -p 4022 charlie@203.247.189.192 -N -L localhost:49696:localhost:49696"

getlabip() {
  ip_list = ('143.248.49.16' '143.248.49.20' '143.248.49.54' '143.248.49.70' '143.248.49.104' '143.248.49.74' '143.248.49.53' '143.248.49.91' '143.248.49.6')
  echo ${ip_list[0]}
}

lab_alias() {
  ssh -X "charlie@geometry$1.kaist.ac.kr" -p 60005 -i ~/.ssh/id_rsa
}

note() {
  ssh -NL 42003:localhost:42003 "charlie@geometry$1.kaist.ac.kr" -p 60005 -i ~/.ssh/id_rsa
}

ip_list=(
  '143.248.49.16'
  '143.248.49.20'
  '143.248.49.54'
  '143.248.49.70'
  '143.248.49.104'
  '143.248.49.74'
  '143.248.49.53'
  '143.248.49.91'
  '143.248.49.6'
)

geo() {
  kitten ssh -XY "hieuristics@${ip_list[$1+1]}" -i ~/.ssh/id_rsa
}

lab() {
  kitten ssh -XY "charlie@${ip_list[$1+1]}" -p 60005 -i ~/.ssh/id_rsa
}

iview() {
  open -a Preview $1
}

alias kintos="ssh charlie@geometry4.kaist.ac.kr -p 10003"
alias pintos="ssh charlie@geometry2.kaist.ac.kr -p 10003"
alias os="ssh charlie@172.10.7.66"

alias cs447="ssh root@172.10.8.151"
alias ee514="ssh 20210722@eelabg1.kaist.ac.kr"

alias ta="tmux attach -t"
alias tn="tmux new -s"

alias v="nvim"
alias p="python"
alias m="make -j32"
alias b="cmake -B ./build"

alias f="find . -iname '*.hpp' -o -iname '*.cpp' | xargs clang-format -style=Mozilla -i"

getlit() {
  rsync -avzP --include "*/" --include="*.npy" --exclude="*" hieu1052k3@$1:"/home/hieu1052k3/lit" ~/Desktop/lit
}

alias att="tmux attach -t"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

alias notebook="ssh -NL 42003:localhost:42003 charlie@geometry4.kaist.ac.kr -p 60005"
alias tev="/opt/homebrew/Caskroom/tev/1.26/tev.app/Contents/MacOS/tev"

showmesh() {
  python -c "import trimesh; trimesh.load('$1').show()"
}
alias icat="kitten icat"

alias openf="open -a Forklift"
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm@16/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@16/include"

alias b="sh build.sh"

alias getcpm="mkdir -p cmake && wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake"

watermark() {
  ls | grep .jpg | while read -r filepath; do
    fname=$filepath:t:r;
    echo watermarking $fname;
    magick $fname.jpg \( copyright.png -resize x%\[fx:u.h/0.3\] -alpha set -channel Alpha -evaluate set 50% \) -gravity SouthEast -geometry +15+15 -composite -resize x%\[fx:u.h/5] $fname.webp
  done
}
