-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/weehuy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/weehuy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/weehuy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/weehuy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/weehuy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nØ\a\0\0\a\0/\0]6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\1\2\0015\3\a\0005\4\4\0004\5\3\0005\6\5\0>\6\1\5=\5\6\4=\4\b\0035\4\f\0005\5\n\0009\6\t\0=\6\v\5=\5\r\0045\5\14\0009\6\t\0=\6\15\5=\5\16\0045\5\17\0009\6\t\0=\6\15\5=\5\18\0045\5\19\0009\6\t\0=\6\15\5=\5\20\4=\4\21\3B\1\2\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\26\0'\5\27\0005\6\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\29\0'\5\30\0005\6\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4 \0'\5!\0005\6\"\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4#\0'\5$\0005\6%\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4&\0'\5'\0005\6(\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4)\0'\5*\0005\6+\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4,\0'\5-\0005\6.\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMovePrev<CR>\ag[\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMoveNext<CR>\ag]\1\0\2\vsilent\2\fnoremap\2\f:b#<CR>\agb\1\0\2\vsilent\2\fnoremap\2\24:BufferLinePick<CR>\agh\1\0\2\vsilent\2\fnoremap\2\29:BufferLinePickClose<CR>\agq\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCyclePrev<CR>\agp\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCycleNext<CR>\agn\6n\20nvim_set_keymap\bapi\bvim\15highlights\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\nguifg\1\0\0\tfill\1\0\0\nguibg\1\0\0\18bg_statusline\foptions\1\0\0\foffsets\1\0\4\15text_align\tleft\rfiletype\rNvimTree\14highlight\14Directory\ttext\18File Explorer\1\0\1\20separator_style\nslant\15bufferline\nsetup\22tokyonight.colors\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    after_files = { "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÙ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3\tchar\bâ”Š#show_trailing_blankline_indent\1\19char_highlight\vLineNr\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¢\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÜ\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp_luasnip", "nvim-autopairs" },
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisibleÚ\4\1\0\n\0(\0C6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0015\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\15\0009\6\r\0019\6\14\6B\6\1\2=\6\16\0059\6\r\0019\6\17\6B\6\1\2=\6\18\0059\6\r\0019\6\19\6)\büÿB\6\2\2=\6\20\0059\6\r\0019\6\19\6)\b\4\0B\6\2\2=\6\21\0059\6\r\0019\6\22\6B\6\1\2=\6\23\0059\6\r\0019\6\24\6B\6\1\2=\6\25\0059\6\r\0019\6\26\0065\b\29\0009\t\27\0019\t\28\t=\t\30\bB\6\2\2=\6\31\0053\6 \0=\6!\0053\6\"\0=\6#\5=\5\r\0044\5\4\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\5=\5'\4B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n£\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÏ\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0005\4\t\0=\4\6\3=\3\n\2B\0\2\1K\0\1\0\vindent\1\4\0\0\vpython\blua\nlatex\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nâ\3\0\2\18\2\21\0K-\2\0\0009\2\0\2\18\4\0\0B\2\2\2\18\5\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&€9\4\2\2\v\4\0\0X\5\2€'\4\3\0X\5\6€6\5\4\0009\5\5\5'\a\6\0\18\b\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\a\t\0B\5\2\0016\5\n\0\18\t\2\0009\a\1\2B\a\2\0A\5\0\4X\b\n€6\n\a\0009\n\b\n6\f\4\0009\f\5\f'\14\v\0\18\15\1\0\18\16\4\0009\17\f\tB\f\5\0A\n\0\1E\b\3\3R\bô6\5\a\0009\5\b\5'\a\r\0B\5\2\1X\4\25€\a\1\14\0X\4\5€-\4\1\0009\4\15\4\18\6\0\0B\4\2\1X\4\18€\a\1\16\0X\4\5€-\4\1\0009\4\17\4\18\6\0\0B\4\2\1X\4\v€\a\1\18\0X\4\5€-\4\1\0009\4\19\4\18\6\0\0B\4\2\1X\4\4€-\4\1\0009\4\20\4\18\6\0\0B\4\2\1K\0\1\0\1À\0À\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\vvsplit\15_multiopen2\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\nsplit\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\ttabe\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\tedit\15_multiopenŸ\b\1\0\v\0001\0a6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\0\0003\3\4\0=\3\3\0023\3\6\0=\3\5\0023\3\b\0=\3\a\0023\3\n\0=\3\t\0023\3\f\0=\3\v\0026\3\0\0'\5\r\0B\3\2\0029\3\14\0035\5#\0005\6!\0005\a\29\0005\b\16\0009\t\15\0=\t\17\b9\t\18\0=\t\19\b9\t\20\0=\t\21\b9\t\22\0009\n\18\0 \t\n\t=\t\23\b9\t\22\0009\n\20\0 \t\n\t=\t\24\b9\t\v\2=\t\25\b9\t\5\2=\t\26\b9\t\a\2=\t\27\b9\t\t\2=\t\28\b=\b\30\a5\b\31\0009\t\15\0=\t\17\b9\t\22\0009\n\18\0 \t\n\t=\t\23\b9\t\22\0009\n\20\0 \t\n\t=\t\24\b9\t\v\2=\t\25\b9\t\5\2=\t\26\b9\t\a\2=\t\27\b9\t\t\2=\t\28\b=\b \a=\a\"\6=\6$\5B\3\2\0016\3%\0009\3&\0039\3'\3'\5 \0'\6(\0'\a)\0005\b*\0B\3\5\0016\3%\0009\3&\0039\3'\3'\5 \0'\6+\0'\a,\0005\b-\0B\3\5\0016\3%\0009\3&\0039\3'\3'\5 \0'\6.\0'\a/\0005\b0\0B\3\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>sb\1\0\2\vsilent\2\fnoremap\2N<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>\15<leader>sf\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\20<leader><space>\20nvim_set_keymap\bapi\bvim\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\28telescope.actions.state\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    after = { "bufferline.nvim", "vim-signify" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\n‹\4\0\0\6\0\22\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\2\4\1'\4\5\0005\5\6\0B\2\3\0019\2\4\1'\4\a\0005\5\b\0B\2\3\0019\2\4\1'\4\t\0005\5\n\0B\2\3\0019\2\4\1'\4\v\0005\5\f\0B\2\3\0019\2\4\1'\4\r\0005\5\14\0B\2\3\0016\2\15\0009\2\16\2'\3\18\0=\3\17\0026\2\15\0009\2\16\2'\3\18\0=\3\19\0026\2\15\0009\2\16\2'\3\21\0=\3\20\2K\0\1\0\6~\31signify_sign_change_delete\24signify_sign_change\bâ–Š\21signify_sign_add\6g\bvim\1\0\1\tlink\19GitSignsDelete\31SignifySignDeleteFirstLine\1\0\1\tlink\19GitSignsDelete\22SignifySignDelete\1\0\1\tlink\19GitSignsChange\28SignifySignChangeDelete\1\0\1\tlink\19GitSignsChange\22SignifySignChange\1\0\1\tlink\16GitSignsAdd\19SignifySignAdd\14highlight\20tokyonight.util\nsetup\22tokyonight.colors\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/opt/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    config = { "\27LJ\2\nò\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\3\0)\1\0\0=\1\4\0006\0\0\0009\0\3\0)\1\0\0=\1\5\0006\0\0\0009\0\3\0)\1\0\0=\1\6\0006\0\0\0009\0\3\0)\1\0\0=\1\a\0006\0\0\0009\0\3\0)\1\0\0=\1\b\0K\0\1\0\24vimtex_view_enabled\28vimtex_quickfix_enabled\28vimtex_compiler_enabled\26vimtex_format_enabled\28vimtex_complete_enabled\6g\17conceallevel\6o\bvim\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/weehuy/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nâ\3\0\2\18\2\21\0K-\2\0\0009\2\0\2\18\4\0\0B\2\2\2\18\5\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&€9\4\2\2\v\4\0\0X\5\2€'\4\3\0X\5\6€6\5\4\0009\5\5\5'\a\6\0\18\b\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\a\t\0B\5\2\0016\5\n\0\18\t\2\0009\a\1\2B\a\2\0A\5\0\4X\b\n€6\n\a\0009\n\b\n6\f\4\0009\f\5\f'\14\v\0\18\15\1\0\18\16\4\0009\17\f\tB\f\5\0A\n\0\1E\b\3\3R\bô6\5\a\0009\5\b\5'\a\r\0B\5\2\1X\4\25€\a\1\14\0X\4\5€-\4\1\0009\4\15\4\18\6\0\0B\4\2\1X\4\18€\a\1\16\0X\4\5€-\4\1\0009\4\17\4\18\6\0\0B\4\2\1X\4\v€\a\1\18\0X\4\5€-\4\1\0009\4\19\4\18\6\0\0B\4\2\1X\4\4€-\4\1\0009\4\20\4\18\6\0\0B\4\2\1K\0\1\0\1À\0À\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\vvsplit\15_multiopen2\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\nsplit\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\ttabe\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2À\tedit\15_multiopenŸ\b\1\0\v\0001\0a6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\0\0003\3\4\0=\3\3\0023\3\6\0=\3\5\0023\3\b\0=\3\a\0023\3\n\0=\3\t\0023\3\f\0=\3\v\0026\3\0\0'\5\r\0B\3\2\0029\3\14\0035\5#\0005\6!\0005\a\29\0005\b\16\0009\t\15\0=\t\17\b9\t\18\0=\t\19\b9\t\20\0=\t\21\b9\t\22\0009\n\18\0 \t\n\t=\t\23\b9\t\22\0009\n\20\0 \t\n\t=\t\24\b9\t\v\2=\t\25\b9\t\5\2=\t\26\b9\t\a\2=\t\27\b9\t\t\2=\t\28\b=\b\30\a5\b\31\0009\t\15\0=\t\17\b9\t\22\0009\n\18\0 \t\n\t=\t\23\b9\t\22\0009\n\20\0 \t\n\t=\t\24\b9\t\v\2=\t\25\b9\t\5\2=\t\26\b9\t\a\2=\t\27\b9\t\t\2=\t\28\b=\b \a=\a\"\6=\6$\5B\3\2\0016\3%\0009\3&\0039\3'\3'\5 \0'\6(\0'\a)\0005\b*\0B\3\5\0016\3%\0009\3&\0039\3'\3'\5 \0'\6+\0'\a,\0005\b-\0B\3\5\0016\3%\0009\3&\0039\3'\3'\5 \0'\6.\0'\a/\0005\b0\0B\3\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>sb\1\0\2\vsilent\2\fnoremap\2N<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>\15<leader>sf\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\20<leader><space>\20nvim_set_keymap\bapi\bvim\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\28telescope.actions.state\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÙ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3\tchar\bâ”Š#show_trailing_blankline_indent\1\19char_highlight\vLineNr\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n£\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÏ\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0005\4\t\0=\4\6\3=\3\n\2B\0\2\1K\0\1\0\vindent\1\4\0\0\vpython\blua\nlatex\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\nò\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\3\0)\1\0\0=\1\4\0006\0\0\0009\0\3\0)\1\0\0=\1\5\0006\0\0\0009\0\3\0)\1\0\0=\1\6\0006\0\0\0009\0\3\0)\1\0\0=\1\a\0006\0\0\0009\0\3\0)\1\0\0=\1\b\0K\0\1\0\24vimtex_view_enabled\28vimtex_quickfix_enabled\28vimtex_compiler_enabled\26vimtex_format_enabled\28vimtex_complete_enabled\6g\17conceallevel\6o\bvim\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\nØ\a\0\0\a\0/\0]6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\1\2\0015\3\a\0005\4\4\0004\5\3\0005\6\5\0>\6\1\5=\5\6\4=\4\b\0035\4\f\0005\5\n\0009\6\t\0=\6\v\5=\5\r\0045\5\14\0009\6\t\0=\6\15\5=\5\16\0045\5\17\0009\6\t\0=\6\15\5=\5\18\0045\5\19\0009\6\t\0=\6\15\5=\5\20\4=\4\21\3B\1\2\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\26\0'\5\27\0005\6\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\29\0'\5\30\0005\6\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4 \0'\5!\0005\6\"\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4#\0'\5$\0005\6%\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4&\0'\5'\0005\6(\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4)\0'\5*\0005\6+\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4,\0'\5-\0005\6.\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMovePrev<CR>\ag[\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMoveNext<CR>\ag]\1\0\2\vsilent\2\fnoremap\2\f:b#<CR>\agb\1\0\2\vsilent\2\fnoremap\2\24:BufferLinePick<CR>\agh\1\0\2\vsilent\2\fnoremap\2\29:BufferLinePickClose<CR>\agq\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCyclePrev<CR>\agp\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCycleNext<CR>\agn\6n\20nvim_set_keymap\bapi\bvim\15highlights\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\nguifg\1\0\0\tfill\1\0\0\nguibg\1\0\0\18bg_statusline\foptions\1\0\0\foffsets\1\0\4\15text_align\tleft\rfiletype\rNvimTree\14highlight\14Directory\ttext\18File Explorer\1\0\1\20separator_style\nslant\15bufferline\nsetup\22tokyonight.colors\frequire\0", "config", "bufferline.nvim")

vim.cmd [[ packadd vim-signify ]]

-- Config for: vim-signify
try_loadstring("\27LJ\2\n‹\4\0\0\6\0\22\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\2\4\1'\4\5\0005\5\6\0B\2\3\0019\2\4\1'\4\a\0005\5\b\0B\2\3\0019\2\4\1'\4\t\0005\5\n\0B\2\3\0019\2\4\1'\4\v\0005\5\f\0B\2\3\0019\2\4\1'\4\r\0005\5\14\0B\2\3\0016\2\15\0009\2\16\2'\3\18\0=\3\17\0026\2\15\0009\2\16\2'\3\18\0=\3\19\0026\2\15\0009\2\16\2'\3\21\0=\3\20\2K\0\1\0\6~\31signify_sign_change_delete\24signify_sign_change\bâ–Š\21signify_sign_add\6g\bvim\1\0\1\tlink\19GitSignsDelete\31SignifySignDeleteFirstLine\1\0\1\tlink\19GitSignsDelete\22SignifySignDelete\1\0\1\tlink\19GitSignsChange\28SignifySignChangeDelete\1\0\1\tlink\19GitSignsChange\22SignifySignChange\1\0\1\tlink\16GitSignsAdd\19SignifySignAdd\14highlight\20tokyonight.util\nsetup\22tokyonight.colors\frequire\0", "config", "vim-signify")

vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisibleÚ\4\1\0\n\0(\0C6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0015\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\15\0009\6\r\0019\6\14\6B\6\1\2=\6\16\0059\6\r\0019\6\17\6B\6\1\2=\6\18\0059\6\r\0019\6\19\6)\büÿB\6\2\2=\6\20\0059\6\r\0019\6\19\6)\b\4\0B\6\2\2=\6\21\0059\6\r\0019\6\22\6B\6\1\2=\6\23\0059\6\r\0019\6\24\6B\6\1\2=\6\25\0059\6\r\0019\6\26\0065\b\29\0009\t\27\0019\t\28\t=\t\30\bB\6\2\2=\6\31\0053\6 \0=\6!\0053\6\"\0=\6#\5=\5\r\0044\5\4\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\5=\5'\4B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\nÜ\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
