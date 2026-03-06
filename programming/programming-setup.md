# Programming Setup

## Install WSL

Type in `Turn windows features on or of` -> Enable `Virtual Machine Platform` and `Windows Hypervisor Platform` -> Open Powershell as an adminitrator -> Type in wsl installation command with ubuntu as distribution

```
wsl --install -d ubuntu
```

There might be the following error: `WslRegisterDistribution failed with error: 0x800701bc` Following the instruction here https://learn.microsoft.com/de-de/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package solved the problem

1. Update wsl

```
wsl.exe --install
```

2. Download ARM64 Package https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_arm64.msi
3. Set WSL2 as standard version

```
wsl --set-default-version 2
```

## Set Ubuntu as default

- Open Windows Terminal
- Click on the down arrow in the tab and open **settings**
- Select **Ubuntu** as default profile

## Terminal

- Open Windows Terminal
- Click on the down arrow in the tab and open **settings**
- Open **json file** and type in

```
"defaults": {
  "useAcrylic": true,
  "acrylicOpacity": 0.1,
},
```

### ZSH

Install ZSH and follow the instructions https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default

```
sudo apt install zsh
```

Check version

```
zsh --version
```

Change to default shell

```
chsh -s $(which zsh)
```

### Oh my Zsh

Install Oh my Zsh and follow the instructions in https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Powerlevel10k

Install Powerlevel10k by following the instructions in https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Open the .zshrc config file

```
vim ~/.zshrc
```

Exchange the ZSH theme with Powerlevel10k

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Restart the terminal and configure the terminal. If the prompt does not open up automatically type in

```
p10k configure
```

If not icons are shown, set the font (whatever NerdFont is installed) inside the settings.json. It should look something like the following

```
{
  "guid": "{...}",
  "hidden": true,
  "name": "Ubuntu",
  "source": "Windows.Terminal.Wsl",
  "fontFace": "FiraCode Nerd Font"
}
```

### Auto-Suggestions

Install ZSH auto-suggestions by following the instructions in https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add zsh-autosuggestions to the plugins (without comma)

```
plugins=(
    git
    zsh-autosuggestions
    # other plugins...
)
```

Restart the terminal

### Nerdfonts

https://www.nerdfonts.com/
To come ...

## Git

Create a personal token in `Settings` -> `Developer settings` -> `Personal access token` -> `Tokens (classic)` -> `Generate new token` -> `Generate new token(classic)` -> `Select permissions`

Set remote origin URL

```
git remote set-url origin https://<token>@github.com/<username>/<repo_name>
```

Clone the repository

```
git clone https://<token>@github.com/<username>/<repo_name>
```

## Linux setup

Install curl

```
sudo apt-get install curl
```

Install wget

```
sudo apt-get install wget
```

## NVM

Install NVM by selecting the command on the official NVM github page https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script. It should look something like

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Restart the terminal and check wether nvm is installed sucessfully by typing

```
nvm
```

Make sure that the following lines are included inside the ./zshrc file

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

## Node

Install node with nvm

```
nvm install 22.1.0
```

Check the current node version

```
node --version
```

Switch between node version by using

```
nvm use <node_version>
```

## Miniforge


## Terraform

Follow the instruction in https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.

Enable tab completion

```
terraform -install-autocomplete
```
