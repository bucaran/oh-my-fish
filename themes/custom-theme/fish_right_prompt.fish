
set -l oh_my_fish_path (status -f|sed 's-/custom.*\?$--')

set -l theme_path $oh_my_fish_path/themes/$fish_custom_theme/fish_right_prompt.fish
set -l custom_path $oh_my_fish_path/custom/themes/$fish_custom_theme/fish_right_prompt.fish

# Assuming that if COLORTERM isn't set we are in a tty
# In a tty fallback to system fish_prompt
if not set -q COLORTERM
  __load_system_fish_right_prompt
else if test -f "$custom_path"
  source $custom_path
else if test -f "$theme_path"
  source $theme_path
else
  __load_system_fish_right_prompt
end