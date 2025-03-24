
let BRANCH_STYLE = $'(ansi white_bold)'
let AHEAD_STYLE = $'(ansi green)(char branch_ahead)'
let BEHIND_STYLE = $'(ansi yellow_bold)(char branch_behind)'

def fast_git [] {
    let b_info = (do -i { git --no-optional-locks branch -v } | complete | get stdout | str trim)
    if ($b_info | is-empty) {
        ''
    } else {
        let info = ($b_info | parse -r '\* (?<name>(\([\S ]+\))|([\w\/\-\.]+)) +\w+ (\[((?<state>[^\]]+))+\])?')
        let state_list = ($info.state.0 | split row ', ' | each { |it|
            let p = ($it | parse "{s} {n}")
            if ($p | is-empty) {
                if ($it | str starts-with "gone") {
                    $' (ansi light_red)(char failed)'
                } else {
                    ''
                }
            } else if $p.s.0 == 'ahead' {
                $' ($AHEAD_STYLE)($p.n.0)(ansi reset)'
            } else if $p.s.0 == 'behind' {
                $' ($BEHIND_STYLE)($p.n.0)'
            } else {
                $' (ansi red)($p.s.0) ($p.n.0)'
            }
        })
        let state_str = ($state_list | str join)
        $' ($BRANCH_STYLE)[($info.name.0)(ansi reset)($state_str)($BRANCH_STYLE)](ansi reset)'
    }
}

def create_left_prompt [] {
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    let path = ($path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)")
    [$path, (fast_git)] | str join
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date "%Y-%m-%d %H:%M:%S") # try to respect user's locale
    ] | str join | str replace --regex --all "([-:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

use std "path add"
path add /nix/var/nix/profiles/default/bin
path add ~/node_modules/.bin

$env.EDITOR = "hx"

