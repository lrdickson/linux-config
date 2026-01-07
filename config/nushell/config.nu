
let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
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

def fzf-find-dir [search_dir: path]: nothing -> path {
  ^find $"($search_dir)" -type d | fzf
}

# alias nvimdiff = nvim -d
