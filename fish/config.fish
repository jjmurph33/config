if status is-interactive
    fish_vi_key_bindings
    abbr t tmux_attach
    abbr f fzf --preview="batcat --color=always {}"
    set -x PATH ~/.local/bin $PATH
end
