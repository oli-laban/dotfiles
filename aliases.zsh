# Laravel
alias a="php artisan"
alias stan="./vendor/bin/phpstan analyse"
alias sail="alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'"
alias sa="sail artisan"
alias sc="sail composer"
alias sdev="sail npm run dev"
alias sstan="sail bin phpstan analyse"
alias sci='docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php84-composer:latest \
    composer install --ignore-platform-reqs'

# Docker
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcs="docker-compose stop"

# General Dev
alias c="composer"
alias cfresh="rm -rf vendor/ composer.lock && composer install"
alias scfresh="rm -rf vendor/ composer.lock && sail composer install"
alias npmfresh="rm -rf node_modules/ package-lock.json && npm install"

# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/projects"

# Shortcuts
alias copyssh="op read 'op://Personal/SSH Key/public key' | tee >(pbcopy)"
alias reloadshell="omz reload" 

# Utils
alias cat="bat"
