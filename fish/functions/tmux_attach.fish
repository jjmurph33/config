#!/usr/bin/env fish

function tmux_attach
    set -l session_name $argv[1]
    if test -z "$session_name"
        set session_name "tmux"  # Default session name if none provided
    end

    # Check if tmux is installed
    if not command -v tmux >/dev/null
        echo "Error: tmux is not installed"
        return 1
    end

    # Check if we're already in a tmux session
    if set -q TMUX
        echo "Error: Already in a tmux session"
        return 1
    end

    # Check if the session exists
    if tmux has-session -t "$session_name" 2>/dev/null
        echo "Attaching to existing session: $session_name"
        tmux attach-session -t "$session_name"
    else
        echo "Creating new session: $session_name"
        tmux new-session -s "$session_name"
    end
end

