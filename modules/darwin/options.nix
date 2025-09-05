{
  security.pam.services.sudo_local.touchIdAuth = true; # Unlock sudo commands via Touch ID

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false; # don't rearrange spaces based on the most recent use
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv"; # default to column view in finder
    loginwindow.LoginwindowText = "Welcome Back";
    screencapture.location = "~/Pictures/screenshots";
    screensaver.askForPasswordDelay = 10;
  };
}