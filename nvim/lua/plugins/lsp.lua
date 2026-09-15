return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,

        settings = {
          Lua = {
            codeLens = {
              enable = true,
            },

            hint = {
              enable = true,
              semicolon = "Disable",
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
              diagnosticMode = "openFilesOnly",
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
