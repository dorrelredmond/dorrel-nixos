{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		fish
	];

  programs.fish = {

    enable = true;

    loginShellInit = ''
      fish_add_path --move --prepend --path $HOME/.nix-profile/bin /run/wrappers/bin /etc/profiles/per-user/$USER/bin /run/current-system/sw/bin /nix/var/nix/profiles/default/bin $HOME/.spicetify
    '';

    shellInit = ''
      # themeing
      set fish_greeting
      export "MICRO_TRUECOLOR=1"
      set -g theme_display_date no
      set -g theme_nerd_fonts yes
      set -g theme_newline_cursor yes
    '';

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";

      "cp" = "cp -v";
      "ddf" = "df -h";
      "etc" = "erd -H";
      "mkdir" = "mkdir -p";
      "mv" = "mv -v";
      "rm" = "rm -v";
      "rr" = "rm -rf";

      "ld" = "eza -ld */ --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "lla" = "eza -lah --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "ll" = "eza -lh --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "llr" = "eza -lhr --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "lls" = "eza -lh -s size --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "llt" = "eza -lh -s time --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";
      "lltr" = "eza -lhr -s time --no-quotes --time-style long-iso --group-directories-first --header --color --git --icons";

      "png" = "feh -Z *.png";
      "jpg" = "feh -Z *.jpg";
      "jpeg" = "feh -Z *.jpeg";

      "avi" = "mpv *.avi";
      "mkv" = "mpv *.mkv";
      "mov" = "mpv *.mov";
      "mp3" = "mpv *.mp3";
      "mp4" = "mpv *.mp4";
      "vmpv" = "mpv *";
      "webm" = "mpv *.webm";

      "avilist" = "ls *.avi | sort -V > playlist.m3u";
      "mkvlist" = "ls *.mkv | sort -V > playlist.m3u";
      "movlist" = "ls *.mov | sort -V > playlist.m3u";
      "mp3list" = "ls *.mp3 | sort -V > playlist.m3u";
      "mp4list" = "ls *.mp4 | sort -V > playlist.m3u";
      "webmlist" = "ls *.webm | sort -V > playlist.m3u";

    };
    
    shellAbbrs = {
      # cargo abbreviations
      cb = "cargo build";
      cc = "cargo check";
      cdo = "cargo doc --open";
      cr = "cargo run";

      # git abbreviations
      gaa  = "git add -A";
      ga   = "git add";
      gbd  = "git branch --delete";
      gb   = "git branch";
      gc   = "git commit";
      gcm  = "git commit -m";
      gcob = "git checkout -b";
      gco  = "git checkout";
      gd   = "git diff";
      gl   = "git log";
      gp   = "git push";
      gpom = "git push origin main";
      gs   = "git status";
      gst  = "git stash";
      gstp =  "git stash pop";

      # nix abbreviations
      ncg = "nix-collect-garbage";
      nrd = "sudo nixos-rebuild switch --flake .#desktop";
      
      # misc abbreviations
      chwall = "swww img --transition-type any --transition-pos top-right"
    };

    functions = {

      extract = '' 
      function extract
        switch $argv[1]
            case "*.tar.bz2"
                tar xjf $argv[1]

            case "*.tar.gz"
                tar xzf $argv[1]

            case "*.bz2"
                bunzip2 $argv[1]

            case "*.rar"
                unrar e $argv[1]

            case "*.gz"
                gunzip $argv[1]

            case "*.tar"
                tar xf $argv[1]

            case "*.tbz2"
                tar xjf $argv[1]

            case "*.tgz"
                tar xzf $argv[1]

            case "*.zip"
                unzip $argv[1]

            case "*.Z"
                uncompress $argv[1]

            case "*.7z"
                7z x $argv[1]

            case "*"
                echo "unknown extension: $argv[1]"
        end
      end
      '';

      extracttodir = '' 
      function extracttodir
          switch $argv[1]
              case "*.tar.bz2"
                  tar -xjf $argv[1] -C "$argv[2]"

              case "*.tar.gz"
                  tar -xzf $argv[1] -C "$argv[2]"

              case "*.rar"
                  unrar x $argv[1] "$argv[2]/"

              case "*.tar"
                  tar -xf $argv[1] -C "$argv[2]"

              case "*.tbz2"
                  tar -xjf $argv[1] -C "$argv[2]"

              case "*.tgz"
                  tar -xzf $argv[1] -C "$argv[2]"

              case "*.zip"
                  unzip $argv[1] -d $argv[2]

              case "*.7z"
                  7za e -y $argv[1] -o"$argv[2]"

              case "*"
                  echo "unknown extension: $argv[1]"
          end
      end
      '';
      
      lsr = ''
      function lsr
        ls | rg -i $argv[1]
      end
      '';

      mkcd = '' 
      function mkcd --argument name
        mkdir -p $name
        cd $name
      end
      '';

      num = '' 
      function num 
        ls -1 $argv | wc -l;
      end
      '';

      wg = '' 
      function wg
        set -l num_args (count $argv)

        if test $num_args -eq 1
            wget -c $argv[1]

        else if test $num_args -eq 2
            # arg1 = name, arg2 = url
            wget -c -O $argv[1] $argv[2]

        else
            echo "Incorrect number of arguments"
        end
      end
      '';

      ytarchive = '' 
      function ytarchive
      yt-dlp -f bestvideo[height<=1440][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
      --sponsorblock-mark "all" \
      --geo-bypass \
      --sub-langs 'all' \
      --embed-subs \
      --embed-metadata \
      --convert-subs 'srt' \
      --download-archive $argv[1].txt https://www.youtube.com/$argv[1]/videos; 
      end
      '';

      ytarchivevideo = '' 
      function ytarchivevideo
        yt-dlp -f bestvideo[height<=1440][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
      --sponsorblock-mark "all" \
      --geo-bypass \
      --sub-langs 'all' \
      --embed-metadata \
      --convert-subs 'srt' \
      --download-archive $argv[1] $argv[2]; 
      end
      '';

      ytd = '' 
      function ytd
      yt-dlp -f bestvideo[height<=1440][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
      --sponsorblock-mark "all" \
      --geo-bypass \
      --sub-langs 'all' \
      --embed-subs \
      --embed-metadata \
      --convert-subs 'srt' \
      $argv
      end
      '';

      ytaudio = ''
        function ytaudio
        yt-dlp -x -o '%(title)s.%(ext)s' \
        --sponsorblock-mark "all" \
        --geo-bypass \
        $argv
        end
      '';
    };
  };
}
