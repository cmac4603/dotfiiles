status is-interactive && fnm env --use-on-cd --shell fish | source

# fnm
set FNM_PATH "/home/cmac4603/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env | source
end
