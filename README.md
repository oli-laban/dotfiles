# Personal Dotfiles

Based on Dries Vints' [dotfiles](https://github.com/driesvints/dotfiles) and Roger Oba's [macOS defaults](https://github.com/rogerluan/dotfiles/blob/master/set_up_user_defaults.sh).

## Setup

1. Sync SSH key from 1Password or generate a new one:
    ```shell
   curl https://raw.githubusercontent.com/oli-laban/dotfiles/HEAD/ssh.sh | sh -s "<email-address>"
   ```
2. Clone the repo to `~/.dotfiles`:
    ```shell
   git clone --recursive git@github.com:oli-laban/dotfiles.git ~/.dotfiles
   ```
3. Run the setup:
   ```shell
   cd ~/.dotfiles && ./setup.sh
   ```
4. Open `Herd.app` to install PHP, Composer etc. (disable NVM in Herd so it doesn't interfere with Volta)
5. Restart computer to apply macOS defaults
