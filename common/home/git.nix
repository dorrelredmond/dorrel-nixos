{
  programs.git = {
    enable = true;
    userName = "dorrelredmond";
    userEmail = "dorrelredmond@gmail.com";

    config.init.defaultBranch = "main";
  };

  environment.systemPackages = with pkgs; [
    sourcegit # GUI git client (FOSS)
    gh
    lazygit
  ];
}