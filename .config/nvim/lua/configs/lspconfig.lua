local nvchad_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
  nvchad_on_attach(client, bufnr)
  -- custom mappings
  require("mappings").lspconfig(client, bufnr)
end

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "eslint",
  "stylelint_lsp",
  "jsonls",
  "gopls",
  "ts_ls",
  "pyright",
  -- "custom_elements_ls",
  -- "tailwindcss",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig["yamlls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    yaml = {
      -- ... -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/catalog-info.json"] = "component.yaml",
      },
    },
  },
}

-- Vue.js language server
lspconfig["volar"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = "/usr/local/lib/node_modules/typescript/lib",
    },
  },
}

-- lua
lspconfig["lua_ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

-- python-lsp-server (used for styles only)
-- lspconfig["pylsp"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       configurationSources = { "pycodestyle" },
--       plugins = {
--         autopep8 = { enabled = false },
--         pycodestyle = { enabled = true, ignore = { "W391" } },
--         pyflakes = { enabled = false },
--         mccabe = { enabled = false },
--         yapf = { enabled = true },
--       },
--     },
--   },
-- }
-- MS python language server
lspconfig["pyright"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
-- Robot Framework LSP OVERRIDE
local virtualenv = os.getenv "VIRTUAL_ENV"
local settings = {
  robot = {
    lint = {
      robocop = {
        enabled = true,
      },
    },
  },
}
if virtualenv then
  settings.robot.python = {
    executable = virtualenv .. "/bin/python",
  }
end
lspconfig["robotframework_ls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = settings,
}

------------------------------------------------------

local diagnostics = {
  BoldError = "",
  Error = "",
  BoldWarning = "",
  Warning = "",
  BoldInformation = "",
  Information = "",
  BoldQuestion = "",
  Question = "",
  BoldHint = "",
  Hint = "󰌶",
  Debug = "",
  Trace = "✎",
}
-- [LSP] Change inline diagnostic text to hover popup
vim.diagnostic.config {
  virtual_text = false,
  -- signs = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostics.Error,
      [vim.diagnostic.severity.WARN] = diagnostics.Warning,
      [vim.diagnostic.severity.HINT] = diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = diagnostics.Information,
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}

-- Open diganostic when hover on error words
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      close_events = { "CursorMoved", "InsertEnter", "FocusLost" },
      focus = false, -- float is not focused immediately, use <C-w>w to focus
      focusable = true,
      border = "rounded",
      source = "always",
      -- prefix = ' ',
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})
