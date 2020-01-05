#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
    export PS2="| => "

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Make bash check its window size after a process completes
#   ------------------------------------------------------------
    shopt -s checkwinsize

#   -----------------------------------------------
#   2. SOURCE TERMINAL APP SPECIFIC CONFIGURATION
#   -----------------------------------------------

    if [ -r /etc/bashrc_$TERM_PROGRAM ]; then
        source /etc/bashrc_$TERM_PROGRAM
    fi

#   -------------------------------
#   3. HOST SYSTEM SPECIFIC SETUP
#   -------------------------------

#   Start the screensaver from the command line
#   ------------------------------------------------------------
    alias saver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

#   Quick command for managing Virtualbox
#   ------------------------------------------------------------
    alias vbm='VBoxManage'

#   Load homebrew installed bash completions
#   ------------------------------------------------------------
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi

#   -------------------------------
#   4. SEARCHING
#   -------------------------------

    ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
    ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

    goog () {
        open "https://www.google.com/search?q=$*"
    }

#   -------------------------------
#   5. DUO SPECIFIC UTILITIES
#   -------------------------------

    alias arc='duoconnect -arc -relay phab.duosec.org arc'
    alias duo-ssh-add='duo-ssh-add --no-update-ssh-config'

    # For ykpiv-ssh-agent
    export SSH_AUTH_SOCK=${HOME}/.ssh/ykpiv-sock

    jump () {
        local mgr=$1
        local passcode=$2
        echo " ---- Jumping to mgr$mgr, activate Yubikey now ----"
        DUO_PASSCODE=$passcode ssh mgr$mgr
    }

    alias jump2='jump 2'
    alias jump3='jump 3'

    jget () {
        local mgr=$1
        echo " ---- Jumping to mgr$mgr, activate Yubikey now ----"
        what=$2
        where=${3:-.}
        scp mgr${mgr}:${what} ${where}
    }

    alias jget2='jget 2'
    alias jget3='jget 3'

    # DDI
    export PATH=$PATH:~/code/trustedpath/ddi

    # Google Cloud SDK
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/pdombkowski/code/google-cloud-sdk/path.bash.inc' ]; then . '/Users/pdombkowski/code/google-cloud-sdk/path.bash.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/pdombkowski/code/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/pdombkowski/code/google-cloud-sdk/completion.bash.inc'; fi

    # export CLOUDSDK_PYTHON=${HOME}/code/google-cloud-sdk/gcloud/bin/python

#   ----------------------
#   6. SOURCE ITERM UTILITIES
#   ----------------------

    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#   ----------------------
#   7. SET UP PYENV
#   ----------------------
    eval "$(pyenv init -)"

#   ----------------------
#   8. SOURCE OUR BASHRC
#   ----------------------

    if [ -r $HOME/.bashrc ]; then
        source $HOME/.bashrc
    fi

    # DUO_PASSCODE=XXXXXX rsync -chazPve 'ssh' --exclude '.git' --exclude '.idea' ~/code/ansible-trustedpath/ mgr3:ansible
