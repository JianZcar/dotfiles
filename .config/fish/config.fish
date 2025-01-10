function parse_git_branch
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set branch (git symbolic-ref --short HEAD)
    if test -n "$branch"
      set ahead (git rev-list --count @{u}..HEAD)
      set behind (git rev-list --count HEAD..@{u})
      if test -n "$ahead" -a "$ahead" -gt 0
        set -a git_status (string join '' "$git_status" \ueb71)
      end
      if test -n "$behind" -a "$behind" -gt 0
        set -a git_status (string join '' "$git_status" \ueb6e)
      end
      echo "[$branch$git_status]"
    end
  end
end

function abbreviate_path
  set -l full_path $argv[1]
  set -l abbreviated_path ""
  set -l real_home (realpath $HOME)
  
  # Check if the path is within the home directory
  if string match -q "$real_home*" "$full_path"
    set full_path "~/"(string replace -r "^$real_home" "" $full_path)
  end
  
  if string match -q "$HOME*" "$full_path"
    set full_path "~/"(string replace -r "^$HOME" "" $full_path)
  end
  
  # Split the path into parts
  set -l path_parts (string split / $full_path)
  
  # Abbreviate each part of the path
  for part in $path_parts
    if test "$part" = $path_parts[-1] -o "$part" = "~"
      set abbreviated_path "$abbreviated_path$part"
    else
      set abbreviated_path "$abbreviated_path"(echo $part | cut -c1)"/"
    end
  end
  echo $abbreviated_path
  function fish_title
    echo $abbreviated_path
	end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
  set_color green
  echo -n "["
  set_color blue
  echo -n (whoami)"@"(hostname)" "
  set_color magenta
  echo -n "fish " 
  set_color yellow
  echo -n (abbreviate_path $PWD)
  set_color green
  echo -n (parse_git_branch)
  echo -n "]> "
  set_color normal
end
