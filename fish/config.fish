if status is-interactive
    fish_default_key_bindings
    set fish_greeting ''

    set -x PATH ~/.local/bin $PATH

    set -x TERM tmux-256color

    abbr -a clip 'xclip -selection clipboard -rmlastnl'

    abbr -a f 'fzf --preview="batcat --color=always {}"'
end
