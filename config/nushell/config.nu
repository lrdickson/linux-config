
let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

$env.config.completions = {
  external: {
    enable: true
    completer: $fish_completer
  }
}

$env.config.edit_mode = "vi"

source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/extra.nu

def get-coredump [dump_path: path] {
    coredumpctl | detect columns | coredumpctl dump ($in | last | get PID) | save -f $dump_path
}

def fzf-find-file [search_dir: path]: nothing -> path {
  ^find $"($search_dir)" -type f | fzf
}

alias nvimdiff = nvim -d
