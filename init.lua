--[[

=====================================================================
==================== 继续之前请阅读此内容 ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ 无需鼠标 \     ========
========       /:::========|  |==hjkl==:::\  \ 操作 \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

什么是 Kickstart?

  Kickstart.nvim 不是一个发行版。

  Kickstart.nvim 是你自己配置的起点。
    目标是让你能够从头到尾阅读每一行代码，理解你的配置在做什么，
    并根据你的需求进行修改。

    一旦你完成了这些，你就可以开始探索、配置和调整，使 Neovim 成为你自己的编辑器！
    这可能意味着暂时保持 Kickstart 原样，或者立即将其分解成模块化的部分。这取决于你！

    如果你对 Lua 一无所知，我建议花点时间阅读一个指南。
    这里有一个只需要 10-15 分钟的示例：
      - https://learnxinyminutes.com/docs/lua/

    在更多地了解 Lua 之后，你可以使用 `:help lua-guide` 作为
    Neovim 如何集成 Lua 的参考。
    - :help lua-guide
    - (或 HTML 版本): https://neovim.io/doc/user/lua-guide.html

Kickstart 指南:

  注意：你应该做的第一件事是在 Neovim 中运行 `:Tutor` 命令。

    如果你不知道这是什么意思，请输入以下内容：
      - <escape 键>
      - :
      - Tutor
      - <enter 键>

    (如果你已经了解 Neovim 基础知识，可以跳过这一步。)

  完成后，你可以继续阅读 kickstart init.lua 的其余部分。

  接下来，运行并阅读 `:help`。
    这将打开一个帮助窗口，其中包含有关阅读、导航和搜索内置帮助文档的基本信息。

    当你遇到困难或困惑时，这应该是你首先要去的地方。
    这是我最喜欢的 Neovim 功能之一。

    最重要的是，我们提供了一个快捷键 "<space>sh" 来搜索帮助文档，
    当你不确切知道要找什么时，这非常有用。

  我在 init.lua 中留下了几个 `:help X` 注释
    这些是提示，用于查找有关 Kickstart 中使用的相关设置、
    插件或 Neovim 功能的更多信息。

   注意：寻找这样的行

    贯穿整个文件。这些是为你，读者，帮助你理解正在发生什么。
    一旦你知道你在做什么，可以随意删除它们，但当你第一次遇到
    Neovim 配置中的一些不同结构时，它们应该作为指南。

如果你在尝试安装 kickstart 时遇到任何错误，运行 `:checkhealth` 获取更多信息。

希望你享受你的 Neovim 之旅，
- TJ

P.S. 当你完成后也可以删除这个。这现在是你的配置了！:)
--]]

-- 将 <space> 设置为 leader 键
-- 参见 `:help mapleader`
--  注意：必须在加载插件之前进行（否则将使用错误的 leader 键）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 如果你安装并在终端中选择了 Nerd Font，设置为 true
vim.g.have_nerd_font = false

-- [[ 设置选项 ]]
-- 参见 `:help vim.opt`
-- 注意：你可以根据需要更改这些选项！
--  更多选项，可以查看 `:help option-list`

-- 默认显示行号
vim.opt.number = true
-- 你也可以添加相对行号，以帮助跳转。
--  自己尝试看看是否喜欢！
-- vim.opt.relativenumber = true

-- 启用鼠标模式，例如调整分割窗口大小时很有用！
vim.opt.mouse = 'a'

-- 不显示模式，因为它已经在状态栏中了
vim.opt.showmode = false

-- 在 OS 和 Neovim 之间同步剪贴板。
--  在 `UiEnter` 之后调度设置，因为它可能会增加启动时间。
--  如果你想让 OS 剪贴板保持独立，请删除此选项。
--  参见 `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- 启用断行缩进
vim.opt.breakindent = true

-- 保存撤销历史
vim.opt.undofile = true

-- 除非使用 \C 或搜索词中包含一个或多个大写字母，否则搜索不区分大小写
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 默认保持符号列开启
vim.opt.signcolumn = 'yes'

-- 减少更新时间
vim.opt.updatetime = 250

-- 减少映射序列等待时间
-- 使 which-key 弹出窗口更快显示
vim.opt.timeoutlen = 300

-- 配置新分割窗口应如何打开
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 设置 Neovim 如何在编辑器中显示某些空白字符。
--  参见 `:help 'list'`
--  和 `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 实时预览替换效果！
vim.opt.inccommand = 'split'

-- 显示光标所在行
vim.opt.cursorline = true

-- 光标上下保持的最小屏幕行数。
vim.opt.scrolloff = 10

-- [[ 基本键映射 ]]
--  参见 `:help vim.keymap.set()`

-- 在普通模式下按 <Esc> 清除搜索高亮
--  参见 `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 诊断相关键映射
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '打开诊断 [Q]uickfix 列表' })

-- 在内置终端中使用更容易发现的快捷键退出终端模式。
-- 否则，通常需要按 <C-\><C-n>，这不是人们在没有更多经验的情况下能猜到的。
--
-- 注意：这在所有终端模拟器/tmux 等中都不一定有效。尝试你自己的映射
-- 或者只使用 <C-\><C-n> 退出终端模式
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = '退出终端模式' })

-- 提示：在普通模式下禁用方向键
-- vim.keymap.set('n', '<left>', '<cmd>echo "使用 h 移动!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "使用 l 移动!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "使用 k 移动!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "使用 j 移动!!"<CR>')

-- 使分割窗口导航更容易的键映射。
--  使用 CTRL+<hjkl> 在窗口间切换
--
--  参见 `:help wincmd` 获取所有窗口命令列表
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = '将焦点移到左窗口' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = '将焦点移到右窗口' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = '将焦点移到下窗口' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = '将焦点移到上窗口' })

-- [[ 基本自动命令 ]]
--  参见 `:help lua-guide-autocommands`

-- 复制时高亮
--  在普通模式下用 `yap` 试试
--  参见 `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = '复制时高亮文本',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ 安装 `lazy.nvim` 插件管理器 ]]
--    参见 `:help lazy.nvim.txt` 或 https://github.com/folke/lazy.nvim 获取更多信息
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('克隆 lazy.nvim 时出错:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ 配置和安装插件 ]]
--
--  要检查插件的当前状态，运行
--    :Lazy
--
--  你可以在此菜单中按 `?` 获取帮助。使用 `:q` 关闭窗口
--
--  要更新插件，你可以运行
--    :Lazy update
--
-- 注意：这里是安装插件的地方。
require('lazy').setup({
  -- 注意：插件可以通过链接添加（或对于 github 仓库：'owner/repo' 链接）。
  'tpope/vim-sleuth', -- 自动检测 tabstop 和 shiftwidth

  -- 注意：插件也可以通过使用表格添加，
  -- 第一个参数是链接，后面的
  -- 键可以用来配置插件行为/加载/等。
  --
  -- 使用 `opts = {}` 强制加载插件。
  --

  -- 这是一个更高级的例子，我们将配置选项
  -- 传递给 `gitsigns.nvim`。这相当于以下 Lua：
  --    require('gitsigns').setup({ ... })
  --
  -- 参见 `:help gitsigns` 了解配置键的作用
  { -- 在行号槽中添加 git 相关标志，以及管理更改的实用工具
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- 注意：插件也可以配置在加载时运行 Lua 代码。
  --
  -- 这通常对于既要分组配置，又要处理
  -- 不需要在启动时立即加载的延迟加载插件非常有用。
  --
  -- 例如，在以下配置中，我们使用：
  --  event = 'VimEnter'
  --
  -- 这在所有 UI 元素加载之前加载 which-key。事件可以是
  -- 普通的自动命令事件（`:help autocmd-events`）。
  --
  -- 然后，因为我们使用 `config` 键，配置只在
  -- 插件加载后运行：
  --  config = function() ... end

  { -- 有用的插件，显示待处理的键绑定。
    'folke/which-key.nvim',
    event = 'VimEnter', -- 将加载事件设置为 'VimEnter'
    opts = {
      icons = {
        -- 如果你有 Nerd Font，将图标映射设置为 true
        mappings = vim.g.have_nerd_font,
        -- 如果你使用 Nerd Font：将 icons.keys 设置为空表，这将使用
        -- which-key.nvim 默认定义的 Nerd Font 图标，否则定义一个字符串表
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- 记录现有的键链
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- 注意：插件可以指定依赖项。
  --
  -- 依赖项也是正确的插件规范 - 任何你
  -- 对顶层插件做的事，你也可以对依赖项做。
  --
  -- 使用 `dependencies` 键指定插件的依赖项

  { -- 模糊查找器（文件、lsp、等）
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- 如果遇到错误，参见 telescope-fzf-native README 获取安装说明
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` 用于在插件安装/更新时运行某些命令。
        -- 这只在那时运行，而不是每次 Neovim 启动时。
        build = 'make',

        -- `cond` 是用来决定这个插件是否应该被
        -- 安装和加载的条件。
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- 用于获取漂亮的图标，但需要 Nerd Font。
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope 是一个模糊查找器，它可以模糊查找很多不同的东西！
      -- 它不仅仅是一个"文件查找器"，它可以搜索
      -- Neovim 的许多不同方面、你的工作区、LSP 等等！
      --
      -- 使用 Telescope 最简单的方法是从以下类似的操作开始：
      --  :Telescope help_tags
      --
      -- 运行此命令后，一个窗口将打开，你可以
      -- 在提示窗口中输入。你会看到一个 `help_tags` 选项列表
      -- 和相应的帮助预览。
      --
      -- 在 Telescope 中使用的两个重要键映射是：
      --  - 插入模式：<c-/>
      --  - 普通模式：?
      --
      -- 这会打开一个窗口，显示当前
      -- Telescope 选择器的所有键映射。这对于发现 Telescope 可以
      -- 做什么以及如何实际做到非常有用！

      -- [[ 配置 Telescope ]]
      -- 参见 `:help telescope` 和 `:help telescope.setup()`
      require('telescope').setup {
        -- 你可以在这里放置默认映射 / 更新 / 等。
        --  所有你要找的信息都在 `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- 如果已安装，启用 Telescope 扩展
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- 参见 `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- 稍微高级一点的覆盖默认行为和主题的示例
      vim.keymap.set('n', '<leader>/', function()
        -- 你可以传递额外的配置给 Telescope 来改变主题、布局等。
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] 在当前缓冲区中模糊搜索' })

      -- 也可以传递额外的配置选项。
      --  参见 `:help telescope.builtin.live_grep()` 了解特定键的信息
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = '在打开的文件中 Live Grep',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- 搜索你的 Neovim 配置文件的快捷方式
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP 插件
  {
    -- `lazydev` 为你的 Neovim 配置、运行时和插件配置 Lua LSP
    -- 用于 Neovim api 的补全、注释和签名
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- 当找到 `vim.uv` 单词时加载 luvit 类型
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- 主要 LSP 配置
    'neovim/nvim-lspconfig',
    dependencies = {
      -- 自动为 Neovim 安装 LSP 和相关工具到 stdpath
      { 'williamboman/mason.nvim', config = true }, -- 注意：必须在依赖项之前加载
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP 的有用状态更新。
      -- 注意：`opts = {}` 等同于调用 `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- 允许 nvim-cmp 提供的额外功能
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- 简单说明：**什么是 LSP？**
      --
      -- LSP 是你可能听说过但可能不理解的缩写。
      --
      -- LSP 代表语言服务器协议。它是一个帮助编辑器
      -- 和语言工具以标准化方式通信的协议。
      --
      -- 通常，你有一个"服务器"，它是为理解特定
      -- 语言而构建的工具（如 `gopls`、`lua_ls`、`rust_analyzer` 等）。这些语言服务器
      -- （有时称为 LSP 服务器，但这有点像 ATM 机）是独立的
      -- 进程，与某个"客户端" - 在这种情况下是 Neovim！- 通信
      --
      -- LSP 为 Neovim 提供了以下功能：
      --  - 跳转到定义
      --  - 查找引用
      --  - 自动完成
      --  - 符号搜索
      --  - 等等！
      --
      -- 因此，语言服务器是必须与 Neovim 分开安装的外部工具。
      -- 这就是 `mason` 和相关插件发挥作用的地方。
      --
      -- 如果你想了解 lsp vs treesitter，你可以查看精心
      -- 编写的帮助部分，`:help lsp-vs-treesitter`

      --  当 LSP 附加到特定缓冲区时，这个函数会运行。
      --    也就是说，每次打开一个与 lsp 相关的新文件时
      --    （例如，打开 `main.rs` 与 `rust_analyzer` 相关）
      --    这个函数将被执行来配置当前缓冲区
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- 注意：记住 Lua 是一个真正的编程语言，因此可以
          -- 定义小的辅助和实用函数，这样你就不必重复自己。
          --
          -- 在这种情况下，我们创建一个函数，让我们更容易定义特定于 LSP 的映射。
          -- 它每次都为我们设置模式、缓冲区和描述。
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- 跳转到光标下单词的定义。
          --  这是变量首次声明的地方，或者函数定义的地方等。
          --  要跳回，按 <C-t>。
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- 查找光标下单词的引用。
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- 跳转到光标下单词的实现。
          --  当你的语言有声明类型而没有实际实现的方式时很有用。
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- 跳转到光标下单词的类型。
          --  当你不确定变量的类型，想要看到其*类型*的
          --  定义，而不是它在哪里*定义*时很有用。
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- 模糊查找当前文档中的所有符号。
          --  符号是变量、函数、类型等东西。
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- 模糊查找当前工作区中的所有符号。
          --  类似于文档符号，但搜索整个项目。
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- 重命名光标下的变量。
          --  大多数语言服务器支持跨文件重命名等。
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- 执行代码操作，通常你的光标需要位于错误上方
          -- 或者来自 LSP 的建议上才能激活此功能
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- 警告：这不是转到定义，而是转到声明。
          -- 例如，在 C 语言中，这会带你到头文件。
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- 以下两个自动命令用于在你的光标停留一段时间时
          -- 高亮显示光标下单词的引用。
          --    查看 `:help CursorHold` 了解此功能何时执行的信息
          --
          -- 当你移动光标时，高亮将被清除（第二个自动命令）。
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- 以下代码创建一个键映射来切换代码中的内联提示，
          -- 如果你使用的语言服务器支持这个功能
          --
          -- 这可能是不需要的，因为它们会占用你的代码空间
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- 更改诊断符号在符号列（装订线）中的显示
      -- if vim.g.have_nerd_font then
      --   local signs = { Error = '', Warn = '', Hint = '', Info = '' }
      --   for type, icon in pairs(signs) do
      --     local hl = 'DiagnosticSign' .. type
      --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      --   end
      -- end

      -- LSP 服务器和客户端能够相互通信它们支持的功能。
      -- 默认情况下，Neovim 不支持 LSP 规范中的所有内容。
      -- 当你添加 nvim-cmp、luasnip 等插件时，Neovim 现在有了*更多*的功能。
      -- 因此，我们用 nvim-cmp 创建新的功能，然后将其广播给服务器。
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- 启用以下语言服务器
      -- 你可以随意在这里添加/删除任何你想要的 LSP。它们将自动被安装。
      --
      -- 在下面的表格中添加任何额外的覆盖配置。可用的键有：
      -- - cmd (table)：覆盖用于启动服务器的默认命令
      -- - filetypes (table)：覆盖服务器的默认关联文件类型列表
      -- - capabilities (table)：覆盖功能中的字段。可用于禁用某些 LSP 功能。
      -- - settings (table)：覆盖初始化服务器时传递的默认设置。
      --        例如，要查看 `lua_ls` 的选项，你可以访问：https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... 等。查看 `:help lspconfig-all` 获取所有预配置的 LSP 列表
        --
        -- 一些语言（如 typescript）有完整的语言插件可能很有用：
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- 但对于许多设置来说，LSP (`ts_ls`) 就足够了
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- 你可以切换下面的选项来忽略 Lua_LS 的嘈杂的 `missing-fields` 警告
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- 确保上述服务器和工具已安装
      -- 要检查已安装工具的当前状态和/或手动安装
      -- 其他工具，你可以运行
      --    :Mason
      --
      -- 你可以在这个菜单中按 `g?` 获取帮助。
      require('mason').setup()

      -- 你可以在这里添加其他你想要 Mason 为你安装的工具，
      -- 这样它们就可以在 Neovim 中使用。
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- 用于格式化 Lua 代码
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- 这只处理覆盖上面服务器配置中明确传递的值
            -- 在禁用 LSP 的某些功能时很有用
            -- （例如，关闭 ts_ls 的格式化功能）
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- 自动格式化
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]格式化缓冲区',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 对于没有良好标准化编码风格的语言，禁用 "format_on_save lsp_fallback"。
        -- 你可以在这里添加其他语言或重新启用已禁用的语言。
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform 也可以按顺序运行多个格式化工具
        -- python = { "isort", "black" },
        --
        -- 你可以使用 'stop_after_first' 来运行列表中第一个可用的格式化工具
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- 自动补全
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- 代码片段引擎及其相关的 nvim-cmp 源
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- 需要构建步骤来支持代码片段中的正则表达式。
          -- 此步骤在许多 Windows 环境中不受支持。
          -- 删除下面的条件以在 Windows 上重新启用
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` 包含各种预制代码片段。
          --    查看 README 了解各个语言/框架/插件的代码片段：
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- 添加其他补全功能。
      --  nvim-cmp 默认不包含所有源。
      --  它们被分成多个仓库以便于维护。
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- 查看 `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- 要理解为什么选择这些映射，
        -- 你需要阅读 `:help ins-completion`
        --
        -- 说真的，请阅读 `:help ins-completion`，它真的很好！
        mapping = cmp.mapping.preset.insert {
          -- 选择[下]一个项目
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- 选择[上]一个项目
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- 滚动文档窗口[后]退/[前]进
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- 接受([是])补全。
          --  如果你的 LSP 支持，这将自动导入。
          --  如果 LSP 发送了代码片段，这将展开代码片段。
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- 如果你更喜欢传统的补全按键映射，
          -- 你可以取消下面几行的注释
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- 手动触发 nvim-cmp 的补全。
          --  通常你不需要这个，因为当 nvim-cmp 有可用的补全选项时
          --  会自动显示补全。
          ['<C-Space>'] = cmp.mapping.complete {},

          -- 把 <c-l> 想象成移动到代码片段展开的右侧。
          --  所以如果你有这样的代码片段：
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> 会将你移动到每个展开位置的右侧。
          -- <c-h> 类似，但是向后移动。
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- 关于更高级的 Luasnip 按键映射（例如选择选项节点、展开）请参见：
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- 将组索引设置为 0 以跳过加载 LuaLS 补全，因为 lazydev 推荐这样做
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- 你可以轻松地切换到不同的配色方案。
    -- 更改下面配色方案插件的名称，然后
    -- 将配置中的命令更改为该配色方案的名称。
    --
    -- 如果你想查看已经安装了哪些配色方案，可以使用 `:Telescope colorscheme`。
    'folke/tokyonight.nvim',
    priority = 1000, -- 确保在所有其他启动插件之前加载此插件。
    init = function()
      -- 在这里加载配色方案。
      -- 像许多其他主题一样，这个主题有不同的样式，你可以加载
      -- 任何其他样式，比如 'tokyonight-storm'、'tokyonight-moon' 或 'tokyonight-day'。
      vim.cmd.colorscheme 'tokyonight-night'

      -- 你可以通过这样的方式配置高亮：
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- 在注释中高亮显示 todo、notes 等
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- 各种小型独立插件/模块的集合
    'echasnovski/mini.nvim',
    config = function()
      -- 更好的 Around/Inside 文本对象
      --
      -- 示例：
      --  - va)  - [V]isually 选择 [A]round [)]括号
      --  - yinq - [Y]ank [I]nside [N]ext [Q]引号
      --  - ci'  - [C]hange [I]nside [']引号
      require('mini.ai').setup { n_lines = 500 }

      -- 添加/删除/替换包围符号（括号、引号等）
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]括号
      -- - sd'   - [S]urround [D]elete [']引号
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- 简单易用的状态栏。
      --  如果你不喜欢它，可以删除这个设置调用，
      --  然后尝试其他状态栏插件
      local statusline = require 'mini.statusline'
      -- 如果你有 Nerd Font，将 use_icons 设置为 true
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- 你可以通过覆盖它们的默认行为来配置状态栏中的部分。
      -- 例如，这里我们将光标位置部分设置为 行:列
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... 还有更多！
      --  查看：https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- 高亮、编辑和导航代码
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- 设置用于 opts 的主模块
    -- [[ 配置 Treesitter ]] 查看 `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- 自动安装未安装的语言
      auto_install = true,
      highlight = {
        enable = true,
        -- 某些语言依赖 vim 的正则表达式高亮系统（如 Ruby）来处理缩进规则。
        --  如果你遇到奇怪的缩进问题，请将该语言添加到
        --  additional_vim_regex_highlighting 列表中，并在 indent 中禁用该语言。
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- 还有其他 nvim-treesitter 模块可以用来与 nvim-treesitter 交互。
    -- 你应该去探索一下，看看哪些是你感兴趣的：
    --
    --    - 增量选择：已包含，查看 `:help nvim-treesitter-incremental-selection-mod`
    --    - 显示当前上下文：https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + 文本对象：https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- 以下注释仅在你下载了 kickstart 仓库时才有效,而不是仅复制粘贴了
  -- init.lua。如果你想要这些文件,它们在仓库中,所以你可以下载它们并
  -- 放在正确的位置。

  -- 注意: 你的 Neovim 之旅的下一步: 为 Kickstart 添加/配置额外的插件
  --
  -- 这里有一些我在 Kickstart 仓库中包含的示例插件。
  -- 取消下面任何一行的注释来启用它们(你需要重启 nvim)。
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- 添加 gitsigns 推荐的键位映射

  -- 注意: 下面的导入可以自动从 `lua/custom/plugins/*.lua` 添加你自己的插件、配置等
  -- 这是模块化配置的最简单方式。
  --
  -- 取消下面这行的注释并将你的插件添加到 `lua/custom/plugins/*.lua` 即可开始。
  -- { import = 'custom.plugins' },
  --
  -- 关于加载、源文件和示例的更多信息,请参见 `:help lazy.nvim-🔌-plugin-spec`
  -- 或者使用 telescope!
  -- 在普通模式下输入 `<space>sh` 然后输入 `lazy.nvim-plugin`
  -- 你可以用 `<space>sr` 在同一窗口继续,它会恢复上次的 telescope 搜索
}, {
  ui = {
    -- 如果你使用 Nerd Font: 将图标设置为空表,这样将使用
    -- lazy.nvim 默认定义的 Nerd Font 图标,否则定义一个 unicode 图标表
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- 下面这行叫做 `modeline`。参见 `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
