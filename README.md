# My Nvim Config

## Prerequisites

- Neovim 0.12 or newer
- Git
- `make` for `telescope-fzf-native.nvim`
- `rg` for Telescope and workspace search
- A patched Nerd Font, such as [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
- `tree-sitter`, `tar`, and `curl` for Treesitter parser installation

Mason installs configured language servers, including `lua_ls` and `rust_analyzer`.
Formatters configured through none-ls must be available on `PATH`: Prettier,
Stylua, shfmt, Terraform, Black, Buildifier, and npm-groovy-lint.

## Plugins

Plugins are managed by Neovim's built-in `vim.pack`. Keep
`nvim-pack-lock.json` under version control so installations use reproducible
plugin revisions.

The clipboard configuration uses OSC 52 for an SSH/Zellij/WezTerm workflow.
Paste from the host clipboard with the terminal's paste shortcut.
