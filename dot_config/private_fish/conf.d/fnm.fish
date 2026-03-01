if type fnm -q && status is-interactive
  fnm env --use-on-cd --shell fish | source
  fnm completions --shell fish | source
end
