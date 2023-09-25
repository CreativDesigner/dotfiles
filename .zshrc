# -------------
# Path Configuration | Pfadkonfiguration
# -------------

# Add Homebrew bin to PATH | Füge Homebrew bin zum PATH hinzu
export PATH=/opt/homebrew/bin:$PATH

# Add Ruby and RVM to PATH | Füge Ruby und RVM zum PATH hinzu
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

# -------------
# Oh My Zsh Configuration | Oh My Zsh Konfiguration
# -------------

# Path to the Oh My Zsh installation | Pfad zur Oh My Zsh-Installation
export ZSH="$HOME/.oh-my-zsh"

# Set default user to the current username | Setze Standardbenutzer auf den aktuellen Benutzernamen
export DEFAULT_USER="$(whoami)"

# Theme for Oh My Zsh | Theme für Oh My Zsh
# More themes at: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes | Mehr Themes unter: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Oh My Zsh Plugins | Oh My Zsh Plugins
plugins=(git macos)

# Initialize Oh My Zsh | Oh My Zsh initialisieren
source $ZSH/oh-my-zsh.sh

# -------------
# Aliases
# -------------

# Navigation aliases | Navigations-Aliases
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

# Open current folder | Öffnen des aktuellen Ordners
alias o="open ."

# Ls alias for detailed output | Ls-Alias für detaillierte Ausgabe
alias ll="ls -la -G"

# Git aliases | Git-Aliases
alias g="git"
alias gp="git pull"
alias gundo="git reset --soft HEAD~"
alias gamend="git commit -av --amend --no-edit"

# Open zsh configuration with VS Code | Öffnen der zsh-Konfiguration mit VS Code
alias zshconfig="code ~/.zshrc"

# Homebrew aliases | Homebrew-Aliases
alias install="brew install"
alias uninstall="brew uninstall"

# Syntax highlighting for code output | Syntaxhervorhebung für Code-Ausgabe
alias c='pygmentize -O style=monokai -f console256 -g'

# -------------
# Functions | Funktionen
# -------------

# Highlight and copy code to clipboard | Highlight und Kopieren von Code in die Zwischenablage
function hl() {
    highlight -O rtf "$1" | pbcopy
    echo "code is copied to clipboard"
}

# Create a new directory and navigate into it | Neues Verzeichnis erstellen und hinein navigieren
function md() {
	mkdir -p "$@" && cd "$@"
}

# Open files with Visual Studio Code | Öffnen von Dateien mit Visual Studio Code
function code() {
    open -a '/Applications/Visual Studio Code.app' "$1"
}

# Open files with PhpStorm | Öffnen von Dateien mit PhpStorm
function storm() {
    open -a '/Applications/PhpStorm.app' "$1"
}

# Navigate to the root of the current Git project or one folder up | Zum Root des aktuellen Git-Projekts oder einen Ordner nach oben navigieren
function up() {
    export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
    if [ -z $git_dir ]
    then
        cd ..
    else
        cd $git_dir
    fi
}

# -------------
# RVM Initialization | RVM Initialisierung
# -------------

eval "$(rbenv init - zsh)"
