# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for cross-machine configuration management. The design philosophy separates machine-specific configs (stay local) from portable configs (tracked in git).

## ⚠️ SECURITY WARNING

**This repository is PUBLIC on GitHub.**

NEVER commit:
- API keys, tokens, or credentials
- SSH private keys or sensitive SSH host configurations
- Work-specific certificates or internal domain names
- Database connection strings
- Any passwords or secrets

Personal information like first name (aros) or GitHub username is acceptable since this is a public personal dotfiles repo.

**Security considerations when adding dependencies:**
- Be cautious about pinning exact versions in lock files (e.g., `nvim/lazy-lock.json`) as this publicly advertises specific versions you're running
- Consider security implications of publishing your exact dependency versions, which could expose known vulnerabilities
- When in doubt, ask before committing sensitive paths, hostnames, or version locks

## Architecture

**Two-tier configuration system:**

1. **Local configs** (never committed):
   - `~/.zshrc` - machine-specific shell config
   - `~/.gitconfig` - personal git identity

2. **Shared configs** (git-tracked in `.dotfiles/`):
   - `zshrc_include` - portable shell config sourced by .zshrc
   - `gitconfig_include` - portable git config included by .gitconfig
   - `nvim/` - LazyVim configuration
   - `oh-my-zsh-custom/` - custom zsh plugins and themes

**Key files:**
- `setup_macos.sh` - Creates symlinks from home directory to dotfiles (idempotent)
- `nvim/lua/config/lazy.lua` - LazyVim plugin configuration with language extras
- `nvim/lua/plugins/` - Custom plugin overrides (treesitter, copilot, lsp, etc.)

## Setup and Installation

Apply dotfiles to a new machine:
```bash
cd ~/.dotfiles
sh setup_macos.sh
```

The script is idempotent and creates symlinks for:
- Vim/Neovim configs → `~/.config/nvim`, `~/.vimrc`
- Git config include → `~/.gitconfig` (appends include directive)
- Zsh custom plugins → `~/.oh-my-zsh/custom`
- Ignore files → `~/.config/fd/ignore`, `~/.ignore`, `~/.fdignore`

## Neovim Configuration

Using LazyVim with these language extras:
- TypeScript, Go, Rust, JSON (configured in `lazy.lua`)
- Treesitter parsers auto-install via `lua/plugins/treesitter.lua`

Update plugins:
```vim
:Lazy sync
```

Check health:
```vim
:checkhealth
```

## Shell Configuration Guidelines

**When modifying zsh configs:**

- Machine-specific items go in `~/.zshrc` (local only):
  - Absolute paths like `/Users/aros/...` or `/opt/homebrew/...`
  - Machine-specific tools (iTerm2 integration, 1Password, etc.)
  - Work-specific certs or environment variables

- Portable items go in `zshrc_include` (committed):
  - Generic aliases and functions
  - FZF keybindings and configuration
  - Tool completions that work cross-platform
  - Standard PATH additions like `$HOME/go/bin`

**When modifying git configs:**

- Personal identity (name, email) stays in `~/.gitconfig` (local)
- Shared preferences go in `gitconfig_include` (committed)
  - Currently uses delta for diffs, zdiff3 merge style
