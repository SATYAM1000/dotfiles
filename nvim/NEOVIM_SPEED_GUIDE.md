# 🚀 Neovim Speed Guide: Become Lightning Fast!

## ⚡ **The Speed Philosophy**

Neovim is designed for **speed without leaving the home row**. The key is:
- **Minimal mouse usage** - Keep hands on keyboard
- **Compound commands** - Chain operations together
- **Muscle memory** - Practice until it's automatic
- **Efficient navigation** - Move fast, edit faster

---

## 🎯 **Essential Speed Shortcuts (Start Here)**

### **Navigation (Most Important for Speed)**
```
h j k l     - Basic movement (left, down, up, right)
w b         - Jump by words (forward/backward)
0 $         - Start/end of line
gg G        - Top/bottom of file
Ctrl+u/d    - Page up/down (faster than j/k)
Ctrl+b/f    - Page up/down (vim style)
```

### **Fast Editing**
```
dd          - Delete entire line
yy          - Copy entire line
p           - Paste after cursor
P           - Paste before cursor
u           - Undo
Ctrl+r      - Redo
```

### **Visual Mode (Selection)**
```
v           - Visual mode
V           - Visual line mode
Ctrl+v      - Visual block mode
y           - Yank (copy) selection
d           - Delete selection
c           - Change selection
```

---

## 🏃‍♂️ **Speed Workflows**

### **1. Fast File Navigation**
```
:find filename    - Quick file find
:buffer filename - Switch buffers
Ctrl+^           - Switch to previous buffer
:ls              - List buffers
```

### **2. Rapid Text Manipulation**
```
ciw              - Change inner word
ci"              - Change inside quotes
ci(              - Change inside parentheses
ci{              - Change inside braces
```

### **3. Quick Search & Replace**
```
*                - Search word under cursor
#                - Search word under cursor (backward)
n                - Next search result
N                - Previous search result
:%s/old/new/g   - Replace all occurrences
```

---

## 🎮 **Your Custom Speed Shortcuts**

### **Telescope (Fuzzy Finding)**
```
<leader>ff       - Find files (FAST!)
<leader>fg       - Live grep (search content)
<leader>fb       - Find buffers
<leader>fh       - Find help
```

### **LSP (Code Intelligence)**
```
gd               - Go to definition
gr               - Go to references
K                - Hover documentation
<leader>ca       - Code actions
<leader>rn       - Rename symbol
```

### **File Tree**
```
<leader>e        - Toggle file tree
a                - Create file/folder
d                - Delete
r                - Rename
x                - Cut
c                - Copy
p                - Paste
```

---

## 🧠 **Speed Training Exercises**

### **Exercise 1: Navigation Mastery**
1. Open a long file
2. Practice: `gg` → `G` → `:100` → `gg`
3. Use `w`, `b`, `0`, `$` to move around lines
4. Goal: Navigate without thinking

### **Exercise 2: Editing Speed**
1. Practice: `dd` → `p` → `u` → `Ctrl+r`
2. Use `ciw` to change words quickly
3. Master `y` → `p` for copying lines
4. Goal: Edit without looking at keys

### **Exercise 3: Visual Mode**
1. `v` → move → `y` (copy selection)
2. `V` → `y` (copy entire lines)
3. `Ctrl+v` → select block → `I` → type → `Esc`
4. Goal: Select and manipulate text blocks

---

## ⚡ **Pro Speed Techniques**

### **1. Compound Commands**
```
d2w              - Delete 2 words
y3j              - Yank 3 lines down
c4w              - Change 4 words
>5j              - Indent 5 lines
```

### **2. Marks & Jumps**
```
ma               - Set mark 'a'
'a               - Jump to mark 'a'
Ctrl+o           - Go back in jump list
Ctrl+i           - Go forward in jump list
```

### **3. Macros (Power User)**
```
qa               - Start recording macro 'a'
...perform actions...
q                - Stop recording
@a               - Execute macro 'a'
@@               - Repeat last macro
```

---

## 🎯 **Daily Speed Routine**

### **Morning (5 minutes)**
- Practice basic movements: `h j k l w b 0 $`
- Use `gg G` to navigate files
- Practice `dd yy p` combinations

### **Afternoon (5 minutes)**
- Use Telescope: `<leader>ff` to find files
- Practice LSP: `gd gr K`
- Use visual mode: `v V Ctrl+v`

### **Evening (5 minutes)**
- Practice compound commands: `d2w y3j`
- Use marks: `ma 'a`
- Try macros: `qa ... q @a`

---

## 🚫 **Speed Killers to Avoid**

1. **Using arrow keys** - Stay on home row
2. **Reaching for mouse** - Use keyboard shortcuts
3. **Typing full commands** - Use abbreviations
4. **Not using visual mode** - Select text efficiently
5. **Ignoring LSP features** - Use code intelligence

---

## 🏆 **Speed Milestones**

### **Beginner (Week 1-2)**
- ✅ Navigate without arrow keys
- ✅ Basic editing commands automatic
- ✅ Use Telescope for file finding

### **Intermediate (Week 3-4)**
- ✅ Visual mode selection automatic
- ✅ LSP shortcuts second nature
- ✅ Compound commands fluid

### **Advanced (Week 5+)**
- ✅ Macros for repetitive tasks
- ✅ Custom keymaps automatic
- ✅ Full keyboard workflow

---

## 💡 **Speed Tips**

1. **Start Slow**: Accuracy before speed
2. **Practice Daily**: 15 minutes > 2 hours once
3. **Use Real Projects**: Don't just practice on dummy files
4. **Customize Gradually**: Add shortcuts as you need them
5. **Watch Others**: YouTube Neovim speed demos

---

## 🔧 **Speed Configuration**

### **Enable These Options**
```lua
-- In your options.lua
vim.opt.incsearch = true      -- Incremental search
vim.opt.hlsearch = true       -- Highlight search
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- Smart case sensitivity
vim.opt.lazyredraw = true     -- Don't redraw during macros
```

---

## 📚 **Speed Resources**

- **Practice**: [Vim Adventures](https://vim-adventures.com/)
- **Cheat Sheet**: [Vim Cheat Sheet](https://vim.rtorr.com/)
- **Tutorials**: [Vim Genius](http://www.vimgenius.com/)
- **Community**: r/neovim on Reddit

---

## 🎯 **Your Speed Goal**

**Target**: Edit code 3-5x faster than traditional editors
**Timeline**: 4-6 weeks of consistent practice
**Focus**: Navigation → Editing → Workflow → Automation

---

*Remember: Speed comes from practice, not shortcuts. Start with the basics, build muscle memory, then add advanced features. You'll be flying through code in no time!* 🚀
