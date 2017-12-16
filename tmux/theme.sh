# tmux theme config

#border colors
set -g pane-active-border-fg cyan
set -g pane-border-fg colour235        # dark gray
set -g pane-border-bg default        # super dark gray

set -g status-bg colour234

# add powerline functionality

set -g status-left-length 100
set -g status-right-length 200
set -g status-interval 5
# Trying Window Title Colors
tm_color_active=colour045
tm_color_inactive=colour241
tm_color_inactive_2=colour248
tm_color_feature=colour10
tm_color_music=colour10
tm_active_border_color=colour10
tm_color_branch=colour3
tm_color_running=colour73

# default window title colors
 set-window-option -g window-status-fg $tm_color_inactive
 set-window-option -g window-status-bg default
 set -g window-status-format "#I #W"


# active window title colors
 set-window-option -g window-status-current-fg $tm_color_active
 set-window-option -g window-status-current-bg default
 set-window-option -g  window-status-current-format "#[bold]#I #W"

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

tm_session_name="#[fg=$tm_color_feature,bold] #S"
#tm_git_branch="#[fg=$tm_color_branch,bold] #(uptime -p)"
tm_active_uptime="#[fg=$tm_color_branch,bold] ⇡#(/home/jfouk/Development/Setup/dotfiles/tmux/uptime.sh)"
tm_running_uptime="#[fg=$tm_color_running,bold] ▲#(/home/jfouk/Development/Setup/dotfiles/tmux/active_uptime.sh)"
tm_idle_uptime="#[fg=$tm_color_inactive_2,bold] ⇣#(/home/jfouk/Development/Setup/dotfiles/tmux/idleuptime.sh)"
#tm_pwd="#[fg=$tm_color_music,bold] #(~/Development/Setup/dotfiles/tmux/tmux-pwd.sh)"
tm_date="#[fg=$tm_color_inactive] %R %b %d"

set -g status-left $tm_session_name' '
set -g status-right $tm_running_uptime' '$tm_active_uptime' '$tm_idle_uptime' '$tm_date
