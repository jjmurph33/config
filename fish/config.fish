if status is-interactive
    fish_default_key_bindings
    set fish_greeting ''

    set -x PATH ~/.local/bin $PATH
    set -x PATH /opt/nvim/bin $PATH
    #set -x PATH ~/node/bin $PATH
    #set -x PATH $FLYCTL_INSTALL/bin $PATH

    abbr -a clip 'xclip -selection clipboard -rmlastnl'

    abbr -a f 'fzf --preview="batcat --color=always {}"'

    # opencode
    fish_add_path ~/.opencode/bin
end

