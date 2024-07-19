## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
##
## rxyhn's Z-Shell configuration
## https://github.com/rxyhn

source /home/sweetspot/.config/plugins_zsh/sudo.plugin.zsh

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
theme
env
aliases
utility
options
plugins
keybinds
prompt
EOF

#export AMD_VULKAN_ICD=RADV
#export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json


# vim:ft=zsh:nowrap
