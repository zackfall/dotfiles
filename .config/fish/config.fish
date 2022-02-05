set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -U fish_user_paths ~/.cargo/bin $fish_user_paths
set -U fish_user_paths ~/.yarn/bin $fish_user_paths

set -gx XKB_DEFAULT_LAYOUT "es"
set -gx XKB_DEFAULT_OPTIONS "caps:swapescape"
