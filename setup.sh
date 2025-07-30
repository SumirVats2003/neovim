# setup language servers

# angular and typescript langugage servers
npm install -g typescript typescript-language-server
npm install -g @angular/language-server

# gopls
go install golang.org/x/tools/gopls@latest

# For lua language server, download a binary from the releases page
# https://github.com/LuaLS/lua-language-server/releases
# we can then use the following to install it
cd ~
tar xzvf <lua-language-server-binary-zip> lua/
sudo mv -r lua /etc/

# then use the zshrc from my dotfiles to include
# these language servers into the PATH variable
