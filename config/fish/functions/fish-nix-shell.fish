if type -q nix-shell
    function fish-nix-shell
        command nix-shell --command fish $argv
    end
end
