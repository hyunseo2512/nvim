# Neovim Configuration Guide

This is a Neovim setup optimized for **C** and **Python** development. It is designed to be easy for beginners, with clear comments and simple shortcuts.

---

## Key Features

* **Plugin Management**: Uses `lazy.nvim` for fast and easy plugin installs.
* **Smart Auto-completion**: Uses `nvim-cmp` and LSP to provide suggestions like VSCode.
* **Language Support**:
    * **C**: `clangd` (analysis) and `clang-format` (formatting).
    * **Python**: `pyright` (analysis) and `black` (formatting).
* **User Friendly**:
    * Visual file explorer (`neo-tree`).
    * Fast file and text searching (`telescope`).
    * Shortcut guides (`which-key`).

---

## Keymaps Guide

Most custom shortcuts start with the **Leader Key**, which is the **Spacebar**.

### Basic Controls

| Key | Action | Description |
| :--- | :--- | :--- |
| `jk` | **ESC** | Switch to Normal mode from Insert mode. |
| `<Space>w` | **Save** | Save the current file (`:w`). |
| `<Space>q` | **Quit** | Close Neovim (`:q`). |
| `<Space>bd` | **Close Buffer** | Close the current tab. |

### File Management

| Key | Action | Description |
| :--- | :--- | :--- |
| `<Space>e` | **Explorer** | Open/close the file tree. |
| `<Space>ff` | **Find Files** | Search for a file by name. |
| `<Space>fs` | **Search Text** | Find a word inside files. |
| `<Space>fr` | **Recent Files** | Show recently opened files. |

### Code Analysis (LSP)

| Key | Action | Description |
| :--- | :--- | :--- |
| `gd` | **Definition** | Jump to where the code is defined. |
| `gr` | **References** | See all places where code is used. |
| `K` | **Hover** | Show documentation/help popup. |
| `<Space>rn` | **Rename** | Change variable name everywhere. |
| `<Space>mp` | **Format** | Fix code alignment and style. |

---

## Troubleshooting

1. **Broken Icons**: If you see `□`, please install a **Nerd Font** (e.g., Hack Nerd Font).
2. **LSP Issues**: Run `:Mason` to check if `clangd` or `pyright` are installed.
3. **Check Health**: Run `:checkhealth` to find and fix configuration errors.
