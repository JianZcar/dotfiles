if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    # Capture the output of the Bash script
    echo -e (~/.prompt $PWD 'fish')
end
