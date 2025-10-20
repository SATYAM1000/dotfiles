# Neovim Keybindings Reference

> Leader key: `Space`
> Font: Iosevka Nerd Font (size 16)

## Essential Shortcuts

### Mode Navigation
| Key | Description |
|-----|-------------|
| `jk` or `jj` | Exit insert mode |
| `i` | Enter insert mode |
| `v` | Enter visual mode |
| `V` | Enter visual line mode |
| `Ctrl+v` | Enter visual block mode |

### File Operations
| Key | Description |
|-----|-------------|
| `Ctrl+s` | Save file (works in normal and insert mode) |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all |

## Navigation

### Basic Movement
| Key | Description |
|-----|-------------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Jump to next word |
| `b` | Jump to previous word |
| `0` | Jump to beginning of line |
| `$` | Jump to end of line |
| `gg` | Go to first line |
| `G` | Go to last line (centered) |

### Enhanced Navigation
| Key | Description |
|-----|-------------|
| `Ctrl+d` | Half page down and center |
| `Ctrl+u` | Half page up and center |
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |

### Buffer Navigation
| Key | Description |
|-----|-------------|
| `Shift+h` | Previous buffer |
| `Shift+l` | Next buffer |
| `<leader>bd` | Delete current buffer |
| `<leader>bn` | Create new buffer |

## Window Management

### Splits
| Key | Description |
|-----|-------------|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size |
| `<leader>sx` | Close current split |

### Split Navigation
| Key | Description |
|-----|-------------|
| `Ctrl+h` | Move to left split |
| `Ctrl+j` | Move to lower split |
| `Ctrl+k` | Move to upper split |
| `Ctrl+l` | Move to right split |

### Split Resizing
| Key | Description |
|-----|-------------|
| `Ctrl+↑` | Decrease window height |
| `Ctrl+↓` | Increase window height |
| `Ctrl+←` | Decrease window width |
| `Ctrl+→` | Increase window width |

### Tabs
| Key | Description |
|-----|-------------|
| `<leader>to` | Open new tab |
| `<leader>tx` | Close current tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |
| `<leader>tf` | Open current buffer in new tab |

## Editing

### Basic Editing
| Key | Description |
|-----|-------------|
| `x` | Delete character (without copying) |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `Ctrl+a` | Select all |

### Advanced Editing
| Key | Description |
|-----|-------------|
| `J` | Join line below to current line |
| `<leader>dw` | Delete word backwards |
| `<leader>+` | Increment number |
| `<leader>-` | Decrement number |

### Line Movement
| Key | Description |
|-----|-------------|
| `Alt+j` | Move line/selection down |
| `Alt+k` | Move line/selection up |

### Indentation (Visual Mode)
| Key | Description |
|-----|-------------|
| `<` | Indent left (stays in visual mode) |
| `>` | Indent right (stays in visual mode) |

### Clipboard
| Key | Description |
|-----|-------------|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>P` | Paste before from system clipboard |
| `<leader>p` (visual) | Paste without yanking replaced text |

## Search

### Search & Replace
| Key | Description |
|-----|-------------|
| `/` | Search forward |
| `?` | Search backward |
| `<leader>nh` | Clear search highlights |
| `Esc` | Clear search highlights |
| `*` | Search word under cursor |
| `#` | Search word under cursor backwards |

## File Explorer (NvimTree)

| Key | Description |
|-----|-------------|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Find file in explorer |
| `<leader>ec` | Collapse file explorer |
| `<leader>er` | Refresh file explorer |

## Telescope (Fuzzy Finder)

| Key | Description |
|-----|-------------|
| `<leader>ff` | Find files |
| `<leader>fr` | Find recent files |
| `<leader>fs` | Find string (live grep) |
| `<leader>fc` | Find string under cursor |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fk` | Find keymaps |
| `<leader>ft` | Find Telescope builtins |

## Code Intelligence (LSP)

### Navigation
| Key | Description |
|-----|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gR` | Show references |
| `K` | Show hover documentation |
| `Ctrl+k` (insert) | Show signature help |

### Actions
| Key | Description |
|-----|-------------|
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>lf` | Format code |
| `<leader>ih` | Toggle inlay hints |
| `<leader>rs` | Restart LSP |

### Diagnostics
| Key | Description |
|-----|-------------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Show line diagnostics |
| `<leader>D` | Show buffer diagnostics |
| `<leader>e` | Show diagnostic float |
| `<leader>dl` | Open diagnostics list |

## Autocompletion (in Insert Mode)

| Key | Description |
|-----|-------------|
| `Ctrl+Space` | Trigger completion |
| `Ctrl+n` | Next completion item |
| `Ctrl+p` | Previous completion item |
| `Tab` | Next item / Expand snippet |
| `Shift+Tab` | Previous item |
| `Ctrl+b` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |
| `Ctrl+e` | Abort completion |
| `CR` (Enter) | Confirm completion |

## Git (Gitsigns)

| Key | Description |
|-----|-------------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Toggle blame line |
| `<leader>hB` | Toggle blame |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff this ~ |

## Quickfix List

| Key | Description |
|-----|-------------|
| `<leader>qo` | Open quickfix list |
| `<leader>qc` | Close quickfix list |
| `[q` | Previous quickfix item |
| `]q` | Next quickfix item |

## Comments (Comment.nvim)

| Key | Description |
|-----|-------------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Toggle comment for selection |
| `gb` (visual) | Toggle block comment for selection |

## Sessions (Auto-session)

| Key | Description |
|-----|-------------|
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session |

## Terminal (ToggleTerm)

| Key | Description |
|-----|-------------|
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Toggle floating terminal |
| `<leader>th` | Toggle horizontal terminal |
| `<leader>tv` | Toggle vertical terminal |

## Trouble (Diagnostics List)

| Key | Description |
|-----|-------------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |

## TODO Comments

| Key | Description |
|-----|-------------|
| `]t` | Next TODO comment |
| `[t` | Previous TODO comment |

## Maximizer

| Key | Description |
|-----|-------------|
| `<leader>sm` | Maximize/restore current split |

## Which-Key

| Key | Description |
|-----|-------------|
| `<leader>?` | Show all keybindings |

## Tips

1. **Leader Key Combinations**: Most custom commands start with `<leader>` (Space)
2. **Window Navigation**: Use `Ctrl` + hjkl for quick split navigation
3. **Buffer vs Tab**: Prefer buffers over tabs for file management
4. **Completion**: Use `Tab` for both completion navigation and snippet expansion
5. **Format on Save**: Auto-formats for JS, TS, Lua, JSON, HTML, CSS files
6. **Undo History**: Persistent undo is enabled, history saved in `~/.vim/undodir`

## Custom Settings Applied

- **Line Numbers**: Relative + absolute on cursor line
- **Scrolloff**: 8 lines always visible above/below cursor
- **Persistent Undo**: Enabled with dedicated directory
- **Clipboard**: System clipboard integration
- **Search**: Smart case-sensitive searching
- **Indentation**: 2 spaces, expand tabs
- **Folding**: TreeSitter-based (disabled by default)
- **Update Time**: 250ms for faster completion
- **Timeout**: 300ms for key sequences