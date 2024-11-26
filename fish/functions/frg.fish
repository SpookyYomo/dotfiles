function frg
  # We replace the use of `--argument search` in the function definition (line 1)
  # to allow for passing more things into rg as necessary
  # -n 2..: This means fzf is filtering only on everything after the 2nd ":"
  rg --line-number --color=always --smart-case $argv | fzf \
    --delimiter : \
    -n 2.. \
    --ansi --no-sort \
    --preview-window '~6,+{2}-5' --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
    --cycle \
    --bind alt-k:preview-up,alt-j:preview-down
end
