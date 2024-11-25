if status is-interactive
    fish_default_key_bindings
    abbr -a t tmux_attach
    abbr -a f 'fzf --preview="batcat --color=always {}"'
    abbr -a clip 'xclip -selection clipboard'
    set -x PATH ~/.local/bin $PATH
    set -x PATH ~/opt/nvim/bin $PATH
end
