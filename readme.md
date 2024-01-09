To deploy Neovim config:
-Run the deploy_nvim.sh script.  
after unpacking and installing dependencys it will open the script below  
-use :so command in /lua/smoq/packer.lua  
-use :PackerSync in /lua/smoq/packer.lua  
if plugins are installed then check :Mason if lsp's are installed  


after/plugin contains plugins configuration files.
[Packer](https://github.com/wbthomason/packer.nvim) is used to manage and install plugins.
Currently installed plugins and their configuration:  
-[harpoon](https://github.com/ThePrimeagen/harpoon) -  this plugin creates quick access list of files.  
-[lsp](https://github.com/VonHeikemen/lsp-zero.nvim) -  its a language server protocol to add autocomplition [mason](https://github.com/nvim-telescope/williamboman/mason.nvim) is used to manage lsp's.  
-[telescpe](https://github.com/nvim-telescope/telescope.nvim) - is a highly extendable fuzzy finder.   
-[toggleterm](https://github.com/akinsho/toggleterm.nvim) - a neovim plugin to persist and toggle multiple terminals during an editing session.  
-[treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides code highlighting  
-[color](https://github.com/bluz71/vim-nightfly-colors) - nightfly is a dark midnight theme for modern Neovim  
-[ripgrep](https://github.com/BurntSushi/ripgrep) - ripgrep is used for quicker search withing working file tree  
-[vim-visual-multi](https://github.com/mg979/vim-visual-multi) - vim-visual-multi is used for multiline coursor

   
lua/smoq contains:
-init.lua - initializer for a remap.lua
-pacekr.lua - which is a file where you specifie what packer will install
-remap.lua - contains remaps for the editor
  
  
plugin/ contains:
-packer_compiled.lua - Automatically generated packer.nvim plugin loader code
  
init.lua contains Neovim configuration.
  
if the is a problem with libc6:amd64 try:  

sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old  
sudo mkdir /var/lib/dpkg/info  
sudo apt-get update && sudo apt-get -f install  
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old  
sudo rm -rf /var/lib/dpkg/info  
sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info  
