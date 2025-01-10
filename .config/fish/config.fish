if status is-interactive
    # Commands to run in interactive sessions can go here
end

function parse_git_branch
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set branch (git symbolic-ref --short HEAD)
    if test -n "$branch"
      set ahead (git rev-list --count @{u}..HEAD >/dev/null)
      set behind (git rev-list --count HEAD..@{u} >/dev/null)
      if test -n "$ahead" -a "$ahead" -gt 0
        set git_status "\ueb71" 
      end
      if test -n "$behind" -a "$behind" -gt 0
        set git_status "\ueb6e" 
      end
      echo "[$branch$git_status]"
    end
  end
end

function fish_prompt
  set_color green
  echo -n "["
  set_color blue
  echo -n (whoami)"@"(hostname)" "
  set_color magenta
  echo -n "fish " 
  set_color yellow
  echo -n (prompt_pwd)
  set_color green
  echo -n (parse_git_branch)
  echo -n "]> "
  set_color normal
end
