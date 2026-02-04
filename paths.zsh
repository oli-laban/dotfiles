export PATH=$PATH:$HOME/.volta/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

# Homebrew won't symlink libpq since it conflicts with pre-installed Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
