{ user, config, pkgs, ... }:

let
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome   = "${config.users.users.${user}.home}/.local/share";
  xdg_stateHome  = "${config.users.users.${user}.home}/.local/state"; in
{
  # Symlink the Tokyo Night theme for Yazi into the correct directory
    "${xdg_configHome}/yazi/flavors/tokyo-night.yazi" = {
      source = pkgs.fetchFromGitHub {
        owner = "BennyOe";
        repo = "tokyo-night.yazi";
        rev = "main"; # Consider using a specific commit hash for stability
        sha256 = "112r9b7gan3y4shm0dfgbbgnxasi7ywlbk1pksdbpaglkczv0412";
      };
      recursive = true;
    };


  # Raycast script so that "Run Emacs" is available and uses Emacs daemon
  # "${xdg_dataHome}/bin/emacsclient" = {
  #   executable = true;
  #   text = ''
  #     #!/bin/zsh
  #     #
  #     # Required parameters:
  #     # @raycast.schemaVersion 1
  #     # @raycast.title Run Emacs
  #     # @raycast.mode silent
  #     #
  #     # Optional parameters:
  #     # @raycast.packageName Emacs
  #     # @raycast.icon ${xdg_dataHome}/img/icons/Emacs.icns
  #     # @raycast.iconDark ${xdg_dataHome}/img/icons/Emacs.icns

  #     if [[ $1 = "-t" ]]; then
  #       # Terminal mode
  #       ${pkgs.emacs}/bin/emacsclient -t $@
  #     else
  #       # GUI mode
  #       ${pkgs.emacs}/bin/emacsclient -c -n $@
  #     fi
  #   '';
  # };
}
