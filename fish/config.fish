if status is-interactive
    fish_default_key_bindings
    set fish_greeting ''

    set -x PATH ~/.local/bin $PATH
    set -x PATH ~/opt/nvim/bin $PATH

    abbr -a clip 'xclip -selection clipboard'

    abbr -a t tmux_attach
    abbr -a f 'fzf --preview="batcat --color=always {}"'
    abbr -a so 'source .venv/bin/activate.fish'
end
