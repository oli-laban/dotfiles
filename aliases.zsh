# Laravel
alias a="php artisan"
alias stan="./vendor/bin/phpstan analyse"
alias sail="alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'"
alias sa="sail artisan"
alias sc="sail composer"
alias sdev="sail npm run dev"
alias sstan="sail bin phpstan analyse"

# General Dev
alias c="composer"
alias cfresh="rm -rf vendor/ composer.lock && composer install"
alias scfresh="rm -rf vendor/ composer.lock && sail composer install"
alias npmfresh="rm -rf node_modules/ package-lock.json && npm install"

# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/projects"

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload" 

# Utils
alias cat="bat"
