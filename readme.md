# Neovim Configuration by SmoQx

This repository contains the Neovim configuration files of SmoQx.

## To deploy Neovim config:

- Run the `deploy_nvim.sh` script. After unpacking and installing dependencies, it will open the script below.
- Use `:so` command in `/lua/smoq/packer.lua`.
- Use `:PackerSync` in `/lua/smoq/packer.lua`. If plugins are installed, then check `:Mason` if LSPs are installed.

## Configuration Details

### /after/plugin

Contains plugins configuration files. Packer is used to manage and install plugins. Currently installed plugins and their configuration:

- **harpoon**: This plugin creates a quick access list of files.
- **lsp**: It's a Language Server Protocol to add autocompletion. Mason is used to manage LSPs.
- **telescope**: It is a highly extendable fuzzy finder.
- **toggleterm**: A Neovim plugin to persist and toggle multiple terminals during an editing session.
- **treesitter**: Provides code highlighting.
- **color**: Nightfly is a dark midnight theme for modern Neovim.
- **ripgrep**: Ripgrep is used for quicker search within the working file tree.
- **vim-visual-multi**: Vim-visual-multi is used for multiline cursor.
- **comment_and_format**: It's a plugin written to change remap for commenting selected text and remap for formatters.

### /lua/smoq

Contains:

- **init.lua**: Initializer for a remap.
- **packer.lua**: Specifies what Packer will install.
- **remap.lua**: Contains remaps for the editor.

### /plugin

Contains:

- **packer_compiled.lua**: Automatically generated Packer.nvim plugin loader code.

### init.lua

Contains Neovim configuration.

### Troubleshooting

If there is a problem with `libc6:amd64`, try:

```bash
sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old
sudo mkdir /var/lib/dpkg/info
sudo apt-get update && sudo apt-get -f install
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old
sudo rm -rf /var/lib/dpkg/info
sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info
