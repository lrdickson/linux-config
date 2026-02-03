# If you see this output, you probably forgot to pipe it into `source`:
# nix-your-shell nu | save nix-your-shell.nu

def _nix_your_shell (command: string, args: list<string>) {
  if not (which /nix/store/4pwlhxfpla057dayp32h3dxdv51lxd76-nix-your-shell-1.4.6/bin/nix-your-shell | is-empty) {
    let args = ["--"] ++ $args
    run-external /nix/store/4pwlhxfpla057dayp32h3dxdv51lxd76-nix-your-shell-1.4.6/bin/nix-your-shell nu $command ...$args
  } else {
    run-external $command ...$args
  }
}

def --wrapped nix-shell (...args) {
  _nix_your_shell nix-shell $args
}

def --wrapped nix (...args) {
  _nix_your_shell nix $args
}