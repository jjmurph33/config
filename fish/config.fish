if status is-interactive
    fish_default_key_bindings
    set fish_greeting ''

    abbr -a clip 'xclip -selection clipboard -rmlastnl'
    abbr -a f 'fzf --preview="batcat --color=always {}"'

    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.config/nvm
    fish_add_path ~/.usagi/bin/

    fish_add_path /opt/nvim/bin
    fish_add_path /opt/usagi/
    fish_add_path /opt/butler/
    fish_add_path /opt/helix/
end
