# Neovim Configuration

Modern Neovim config with LSP, AI integration, and custom plugin ecosystem.

## Features

- Plugin management via built-in `vim.pack.add()` (no lazy.nvim/packer)
- 13 LSP servers via `vim.lsp.enable()`
- blink.cmp with Rust-based fuzzy matching
- AI: opencode.nvim (agentic.nvim) + pi.nvim (inline completion via oMLX)
- Navigation: Telescope, Harpoon, Oil, Outline
- Git: lazygit.nvim + mini.diff
- Treesitter: 21 parsers + markdown preview/rendering
- Gruvbox theme with transparent background
- Sessions: auto-save/load via `.session.vim`

## Install

Run the install script to set up everything:

```bash
bash ~/.config/nvim/install-deps.sh
```

Or install manually:

```bash
# Go-based LSPs
go install golang.org/x/tools/gopls@latest
go install github.com/a-h/templ/cmd/templ@latest

# Homebrew (macOS)
brew install lua-language-server marksman llm

# npm packages
npm install -g @tailwindcss/language-server vscode-langservers-extracted intelephense pyright typescript-language-server

# blink.cmp (Rust)
cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp && cargo build --release
```

> `clangd` ships with macOS Xcode CLT — or `brew install llvm`. `pyright` is
> also available via Homebrew.

## Plugins

### AI & Completion

| Plugin        | Source                   | Notes                                         |
| ------------- | ------------------------ | --------------------------------------------- |
| blink.cmp     | `saghen/blink.cmp`       | Super-tab completion with Rust fuzzy matching |
| opencode.nvim | `sudo-tee/opencode.nvim` | AI agent interface (agentic.nvim)             |
| pi.nvim       | `pablopunk/pi.nvim`      | AI completion provider (via oMLX)             |

### Navigation & Filesystem

| Plugin                    | Source                                     | Notes                 |
| ------------------------- | ------------------------------------------ | --------------------- |
| harpoon v2                | `ThePrimeagen/harpoon`                     | Quick file navigation |
| oil.nvim                  | `stevearc/oil.nvim`                        | File explorer         |
| outline.nvim              | `hedyhli/outline.nvim`                     | Code outline/symbols  |
| telescope.nvim            | `nvim-telescope/telescope.nvim`            | Fuzzy finder          |
| telescope-fzf-native.nvim | `nvim-telescope/telescope-fzf-native.nvim` | FZF sorter            |
| telescope-ui-select.nvim  | `nvim-telescope/telescope-ui-select.nvim`  | UI select             |
| plenary.nvim              | `nvim-lua/plenary.nvim`                    | Telescope dependency  |

### Git

| Plugin       | Source                  | Notes                  |
| ------------ | ----------------------- | ---------------------- |
| lazygit.nvim | `kdheepak/lazygit.nvim` | Lazygit integration    |
| mini.diff    | `nvim-mini/mini.diff`   | Git diff visualization |

### Diagnostics & UI

| Plugin             | Source                     | Notes                        |
| ------------------ | -------------------------- | ---------------------------- |
| todo-comments.nvim | `folke/todo-comments.nvim` | TODO/FIXME/NOTE highlighting |
| trouble.nvim       | `folke/trouble.nvim`       | Diagnostics UI               |
| gruvbox.nvim       | `ellisonleao/gruvbox.nvim` | Colorscheme                  |
| mini.icons         | `nvim-mini/mini.icons`     | UI icons                     |

### Grammar

| Plugin         | Source                  | Notes           |
| -------------- | ----------------------- | --------------- |
| thethethe.nvim | `swaits/thethethe.nvim` | Grammar checker |
| vim-typo       | `tani/vim-typo`         | Typo detection  |

### Syntax & Highlighting

| Plugin                | Source                                      | Notes               |
| --------------------- | ------------------------------------------- | ------------------- |
| nvim-treesitter       | `nvim-treesitter/nvim-treesitter`           | Syntax highlighting |
| markdown-preview.nvim | `iamcco/markdown-preview.nvim`              | Browser preview     |
| render-markdown.nvim  | `MeanderingProgrammer/render-markdown.nvim` | In-buffer rendering |

### Utility

| Plugin         | Source                  | Notes                              |
| -------------- | ----------------------- | ---------------------------------- |
| bigfile.nvim   | `LunarVim/bigfile.nvim` | Optimized handling for large files |
| which-key.nvim | `folke/which-key.nvim`  | Keybinding helper                  |

### Treesitter Parsers

`typescript`, `html`, `css`, `javascript`, `svelte`, `go`, `gomod`, `templ`,
`php`, `markdown`, `markdown_inline`, `lua`, `bash`, `python`, `json`, `yaml`,
`toml`, `vim`, `vimdoc`, `diff`, `c`

## Keymaps

Leader: `<space>`

### Agentic AI (`<space>a`)

| Keymap      | Mode    | Action                        |
| ----------- | ------- | ----------------------------- |
| `<C-\>`     | n, v, i | Toggle chat                   |
| `<C-'>`     | n, v    | Add selection/file to context |
| `<space>an` | n       | New session                   |
| `<space>ar` | n       | Restore session               |
| `<space>ad` | n       | Add line diagnostics          |
| `<space>aD` | n       | Add all buffer diagnostics    |

### Harpoon (`<space>h`)

| Keymap      | Mode | Action        |
| ----------- | ---- | ------------- |
| `<space>hh` | n    | Toggle menu   |
| `<space>ha` | n    | Add file      |
| `<space>hr` | n    | Remove file   |
| `<space>hn` | n    | Next file     |
| `<space>hp` | n    | Previous file |

### Explorer (`<space>e`)

| Keymap      | Mode | Action                |
| ----------- | ---- | --------------------- |
| `<space>ee` | n    | Open parent dir (Oil) |
| `<space>er` | n    | Open root dir (Oil)   |

### Telescope (`<space>f`)

| Keymap      | Mode | Action       |
| ----------- | ---- | ------------ |
| `<space>ff` | n    | Find files   |
| `<space>fb` | n    | Find buffers |
| `<space>fs` | n    | Live grep    |

### Window Management (`<space>w`)

| Keymap        | Mode | Action           |
| ------------- | ---- | ---------------- |
| `<space>ww`   | n    | Split to new tab |
| `<space>ws`   | n    | Vertical split   |
| `<space>wv`   | n    | Horizontal split |
| `<space>q`    | n    | Close (wq)       |
| `<C-h/j/k/l>` | n    | Navigate window  |

### Tab Management (`<space>t`)

| Keymap      | Mode | Action       |
| ----------- | ---- | ------------ |
| `<space>tt` | n    | New tab      |
| `<space>tc` | n    | Close tab    |
| `<space>tp` | n    | Previous tab |
| `<space>tn` | n    | Next tab     |

### Session (`<space>s`)

| Keymap      | Mode | Action       |
| ----------- | ---- | ------------ |
| `<space>ss` | n    | Save session |
| `<space>sl` | n    | Load session |

_Auto-loads `.session.vim` on startup when no arguments given._

### Buffer (`<space>b`)

| Keymap      | Mode | Action                    |
| ----------- | ---- | ------------------------- |
| `<space>bn` | n    | Next buffer               |
| `<space>bp` | n    | Previous buffer           |
| `<space>bd` | n    | Delete buffer             |
| `<space>bD` | n    | Delete all except current |
| `<space>bb` | n    | Switch to last buffer     |

### LSP & Code (`<space>c`)

| Keymap      | Mode | Action                       |
| ----------- | ---- | ---------------------------- |
| `gd`        | n    | Go to definition             |
| `gr`        | n    | Go to references             |
| `K`         | n    | Hover docs                   |
| `<space>ca` | n    | Code actions                 |
| `<space>cd` | n    | Show diagnostics             |
| `<space>cf` | n    | Format buffer                |
| `<space>cx` | n    | Toggle diagnostics (Trouble) |
| `<space>cX` | n    | Toggle buffer diagnostics    |
| `<space>cc` | n    | Toggle Clangd debug          |

### Git (`<space>g`)

| Keymap      | Mode | Action       |
| ----------- | ---- | ------------ |
| `<space>gg` | n    | Open Lazygit |

### Markdown

| Keymap       | Mode | Action               |
| ------------ | ---- | -------------------- |
| `<space>mp`  | n    | Start preview        |
| `<space>ms`  | n    | Stop preview         |
| `<space>cfm` | n    | Format with Prettier |

### Makefile (`<space>m`)

| Keymap          | Mode | Action              |
| --------------- | ---- | ------------------- |
| `<space>m<key>` | n    | Run Makefile target |

### Other

| Keymap      | Mode | Action         |
| ----------- | ---- | -------------- |
| `<leader>o` | n    | Toggle Outline |
| `<M-j>`     | n    | Next quickfix  |
| `<M-k>`     | n    | Prev quickfix  |

## Settings

### Indentation

- Tab size: 4 | Shift width: 4 | Expand tab: off (real tabs)

### Display

- Line numbers: absolute + relative
- Cursor line: enabled
- Color column: 80, 120
- Tab → `→ `, Space `·`

### Spell Check

- Languages: `en_us`, `de_de`
- Enabled by default

### Session

Saves buffers, curdir, folds, tabpages, winsize, winpos, terminal, and
local/globals options.

### Gruvbox Theme

- Transparent mode + italic (strings, comments, emphasis, folds)
- Inverse, underline, bold, undercurl enabled

_Plugin lockfile: `nvim-pack-lock.json`_
