# Neovim Config

This is my personal Neovim setup. It’s designed to be **fast**, **lightweight**, and **easy to hack on**. The goal is to keep only what I actually use, while still having modern features like autocompletion, treesitter, and a unified UI.

I use **[`nvchad/ui`](https://github.com/NvChad/ui)** for a consistent interface and **[`mini.deps`](https://github.com/nvim-mini/mini.deps)** for plugin management. This combination keeps things simple and avoids the complexity of heavier frameworks, while still giving me full control over my config.

---

## Why This Setup?

* **Fast** – Minimal plugin loader (`mini.deps`) means startup is nearly instant.
* **Modular** – Plugins are split into categories, and configs live in their own files.
* **Unified UI** – `nvchad/ui` provides consistency across statusline, tabline, telescope, and other components.
* **Practical** – Includes all essentials: LSP, completion, autopairs, commenting, git integration, fuzzy finding, etc., without unnecessary extras.

---

## Config Layout

* **`lua/core/`** - Base Neovim setup (options, keymaps, autocmds)
* **`lua/plugins/`** - Plugin specs, organized by purpose, loaded with `mini.deps`
* **`lua/config/`** - Plugin configurations (e.g. `lsp.lua`, `ui.lua`, `file-manager.lua`)

This separation makes the setup easy to maintain: plugin installation remains minimal, while configs are modular.

---

## Features

* Treesitter syntax highlighting & indentation
* File management via Oil.nvim
* LSP with autocompletion (`blink.cmp`)
* Autopairs, commenting, surround editing
* Telescope fuzzy finder with custom mappings
* Git integration (signs, diffs, statusline info)
* Unified UI via `nvchad/ui`
* Fast startup with `mini.deps`

---

## Install
> I recommend forking the repo to make it your own

1. Clone the repo:

```bash
git clone https://github.com/JianZcar/nvim.git ~/.config/nvim
```

2. Open Neovim — plugins will install automatically.
