return {
  -- colorscheme
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "dark",
      transparent = false,
      code_style = {
        comments = 'none'
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme
      colorscheme = "tokyonight",
    },
  },

  -- comment-box
  {
    "LudoPinelli/comment-box.nvim",
  },

  -- glance
  {
    "dnlhc/glance.nvim",
    opts = {
      height = 30,
      border = {
        enable = true,
      },
    },
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  -- doge
  {
    "kkoomen/vim-doge",
    config = function()
      vim.api.nvim_call_function("doge#install", {})
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- stylelint autofix
      require("lspconfig").stylelint_lsp.setup({
        settings = {
          stylelintplus = {
            autoFixOnSave = true,
            autoFixOnFormat = true,
          },
        },
      })
    end,
  },

  -- cmp
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      opts.view = {
        entries = {
          name = "custom",
          selection_order = "near_cursor",
        },
      }

      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          },
        }),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
