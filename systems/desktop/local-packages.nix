{ pkgs, config, ... }: 
{
  programs.firefox.enable = true;
  
  # General Packages
  environment.systemPackages = with pkgs; [    

  ];

}
