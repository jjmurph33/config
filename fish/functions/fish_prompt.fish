function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -x fish_prompt_pwd_dir_length 0 # don't truncate path

    prompt_login

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
