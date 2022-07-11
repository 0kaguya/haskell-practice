{
  description = "Some Haskell code";
  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
        (ghc.withPackages (pkgs: with pkgs; [
          HUnit
          containers
        ]))
      ];
      shellHook = let
        title = ''\[\e]2;Practical Haskell\a\]'';
        green = ''\[$(tput setaf 10)\]'';
        reset = ''\[$(tput sgr0)\]'';
      in
        ''
        PS1="${title}${green}\u@\w % ${reset}"
        '';
    };
  };
}
