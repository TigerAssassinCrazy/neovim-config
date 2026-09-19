return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        severity_sort = false,

        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      vim.api.nvim_create_user_command("DiagnosticsToggle", function()
        local config = vim.diagnostic.config()

        vim.diagnostic.config({
          virtual_text = not config.virtual_text,
          signs = not config.signs,
          underline = not config.underline,
          severity_sort = not config.severity_sort,
        })
      end, {
        desc = "Toggle diagnostic show",
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,

        settings = {
          Lua = {
            codeLens = {
              enable = true,
            },

            hint = {
              enable = true,
              semicolon = "Enable",
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,

        settings = {
          pyright = {
            disableTaggedHints = true,
          },

          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,

        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,

              debug = {
                enable = true,
              },

              implementations = {
                enable = true,
              },

              references = {
                adt = {
                  enable = true,
                },

                enumVariant = {
                  enable = true,
                },

                method = {
                  enable = true,
                },

                trait = {
                  enable = true,
                },
              },

              run = {
                enable = true,
              },

              updateTest = {
                enable = true,
              },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
      })
    end,
  },
}
