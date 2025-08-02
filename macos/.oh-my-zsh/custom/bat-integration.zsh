gdiff() {
    git diff --name-only --relative --diff-filter=d -z | xargs --null bat --diff
}

export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# fzf
# --walker=[file][,dir][,follow][,hidden]
#               Determines the behavior of the built-in directory walker that is used when $FZF_DEFAULT_COMMAND is not set. The default
#               value is file,follow,hidden.

#               * file: Include files in the search result
#               * dir: Include directories in the search result
#               * hidden: Include and follow hidden directories
#               * follow: Follow symbolic links
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
alias batlook='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --walker=file,follow,hidden,dir'
alias batlook='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --walker=file,follow,hidden,dir --style=full --bind "focus:transform-header:file --brief {}"'

alias man=batman

function search_with_preview() {
  local file
  file=$(rg --line-number --no-heading "$1" . \
    | fzf --ansi --delimiter : \
          --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
          --preview-window=up:70% \
          --bind 'enter:accept' \
          --bind 'ctrl-o:execute(code +{2} {1})+abort' \
          --bind 'ctrl-e:execute(nvim +{2} {1})+abort')

  if [[ -n "$file" ]]; then
    local filepath=$(echo "$file" | cut -d: -f1)
    local lineno=$(echo "$file" | cut -d: -f2)
    echo "Opening $filepath at line $lineno"

    # For clickable iTerm2 links:
    echo "file://$(realpath "$filepath"):$lineno"

    # Optional: open directly in your editor
    # nvim +$lineno "$filepath"
    # code -g "$filepath:$lineno"
  fi
}

alias search_dir='search_with_preview'

function git_diff() {
    git diff --name-only "$@" | fzf "--preview-window=right:70%" --preview "git diff --color=always {} | delta --side-by-side --width=\$FZF_PREVIEW_COLUMNS"
        # git diff --name-only "$@" | fzf \
        # --preview-window=right:70% \
        # --preview 'git diff --color=always {} | delta --side-by-side --width=$FZF_PREVIEW_COLUMNS'
}

function git_log() {
    git log --oneline "$@" | \
    fzf --preview 'git show --color=always {1} | delta --width=$FZF_PREVIEW_COLUMNS'
}

function git_status() {
    git status --short | fzf \
        --preview 'git diff --color=always {1} | delta --width=$FZF_PREVIEW_COLUMNS' \
        --preview-window=up:70% \
        --bind 'enter:execute(git add {1})+reload(git status --short)'
}

function git_stash_list() {
    git stash list | fzf \
        --preview 'git stash show -p {1} | delta'
}

function git_history() {
    git log --oneline --graph --decorate --all | fzf \
        --preview 'git show --color=always {1} | delta --width=$FZF_PREVIEW_COLUMNS' \
        --preview-window=up:70% \
        --bind 'enter:execute(git checkout {1})+reload(git log --oneline --graph --decorate --all)'
}

function git_file_history() {
    local file="$1"
    if [[ -z "$file" ]]; then
        echo "Usage: git_file_history <file>"
        return 1
    fi
    if [[ ! -f "$file" ]]; then
        echo "File not found: $file"
        return 1
    fi
    git log --follow --pretty=oneline -- "$file" | \
        fzf --preview 'git show --color=always {1} | delta'

}
