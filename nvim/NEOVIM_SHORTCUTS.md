# Neovim Shortcuts & Commands Reference

## 🚀 Getting Started
- `:help` - Open help documentation
- `:checkhealth` - Check Neovim health status
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Sync/install plugins
- `:Lazy log` - View plugin logs

## 📁 File & Buffer Management

### File Operations
- `:e <filename>` - Edit file
- `:w` - Save file
- `:wq` or `:x` - Save and quit
- `:q!` - Quit without saving
- `:qa` - Quit all buffers
- `:qa!` - Quit all without saving

### Buffer Navigation
- `:bn` - Next buffer
- `:bp` - Previous buffer
- `:bd` - Delete buffer
- `:ls` - List buffers
- `:b <number>` - Switch to buffer by number

### Window Management
- `Ctrl+w h/j/k/l` - Navigate between windows
- `Ctrl+w s` - Split horizontally
- `Ctrl+w v` - Split vertically
- `Ctrl+w c` - Close window
- `Ctrl+w o` - Close other windows
- `Ctrl+w =` - Equalize window sizes

## 🔍 Search & Navigation

### Search
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `*` - Search word under cursor
- `#` - Search word under cursor backward

### Navigation
- `gg` - Go to beginning of file
- `G` - Go to end of file
- `:number` - Go to line number
- `Ctrl+g` - Show current position
- `Ctrl+o` - Go back in jump list
- `Ctrl+i` - Go forward in jump list

## ✏️ Editing

### Basic Editing
- `i` - Insert mode
- `a` - Append after cursor
- `A` - Append at end of line
- `o` - New line below
- `O` - New line above
- `x` - Delete character under cursor
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p` - Paste after cursor
- `P` - Paste before cursor

### Visual Mode
- `v` - Visual mode
- `V` - Visual line mode
- `Ctrl+v` - Visual block mode
- `y` - Yank selection
- `d` - Delete selection
- `c` - Change selection

### Undo/Redo
- `u` - Undo
- `Ctrl+r` - Redo
- `U` - Undo all changes on line

## 🎯 Your Custom Keymaps (Based on Config)

### Telescope (Fuzzy Finder)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fo` - Find old files
- `<leader>fz` - Find in current file

### LSP (Language Server Protocol)
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>D` - Type definition
- `<leader>ds` - Document symbols
- `<leader>ws` - Workspace symbols

### Git Operations
- `<leader>gb` - Git blame
- `<leader>gd` - Git diff
- `<leader>gs` - Git status
- `<leader>gp` - Git push
- `<leader>gl` - Git log

### Tree Explorer
- `<leader>e` - Toggle file tree
- `a` - Create file/folder
- `d` - Delete file/folder
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder

### Terminal
- `<leader>tt` - Toggle terminal
- `<leader>tf` - Toggle float terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal

### Buffer Management
- `<leader>bd` - Delete buffer
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bl` - List buffers

### Window Management
- `<leader>wv` - Split vertically
- `<leader>ws` - Split horizontally
- `<leader>wc` - Close window
- `<leader>wo` - Close other windows

## 🎨 Theme & UI

### Colorscheme
- `:colorscheme <name>` - Change colorscheme
- `:set background=dark` - Dark mode
- `:set background=light` - Light mode

### Line Numbers
- `:set number` - Show line numbers
- `:set relativenumber` - Show relative line numbers
- `:set nonumber` - Hide line numbers

### Indent Guides
- `:IndentBlanklineToggle` - Toggle indent guides
- `:IndentBlanklineRefresh` - Refresh indent guides

## 🔧 Configuration

### Reload Config
- `:source ~/.config/nvim/init.lua` - Reload Neovim config
- `:LuaReload` - Reload Lua modules

### Plugin Management
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Sync plugins
- `:Lazy clean` - Clean unused plugins
- `:Lazy check` - Check for updates
- `:Lazy log` - View logs

## 📚 Advanced Commands

### Macros
- `q<letter>` - Start recording macro
- `q` - Stop recording
- `@<letter>` - Execute macro
- `@@` - Repeat last macro

### Marks
- `m<letter>` - Set mark
- `'<letter>` - Go to mark
- `:marks` - List marks

### Registers
- `:reg` - Show registers
- `"<register>` - Use specific register
- `:put <register>` - Put from register

### Folds
- `za` - Toggle fold
- `zo` - Open fold
- `zc` - Close fold
- `zR` - Open all folds
- `zM` - Close all folds

## 🎮 Mode-Specific Commands

### Insert Mode
- `Ctrl+n` - Next completion
- `Ctrl+p` - Previous completion
- `Ctrl+x Ctrl+f` - File path completion
- `Ctrl+x Ctrl+l` - Line completion

### Command Mode
- `Ctrl+f` - Open command history
- `Ctrl+r` - Insert register contents
- `Ctrl+v` - Insert literal character

### Visual Mode
- `>` - Indent right
- `<` - Indent left
- `=` - Auto-indent
- `y` - Yank selection
- `d` - Delete selection

## 🚨 Troubleshooting

### Common Issues
- `:checkhealth` - Check for issues
- `:Lazy log` - View plugin errors
- `:messages` - View message history
- `:set syntax=on` - Re-enable syntax highlighting

### Performance
- `:profile start profile.log` - Start profiling
- `:profile func *` - Profile functions
- `:profile file *` - Profile files

## 💡 Pro Tips

1. **Use `:help <topic>`** for detailed information on any command
2. **Press `Ctrl+]`** on any word in help to jump to related topic
3. **Use `:verbose <command>`** to see where a setting comes from
4. **Press `g?`** in normal mode to see what the key does
5. **Use `:options`** to see all available options

## 🔗 External Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Neovim GitHub](https://github.com/neovim/neovim)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)

---

*This reference is based on your Neovim configuration. Customize it further based on your specific needs and plugins.*
