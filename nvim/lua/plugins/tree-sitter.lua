return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- a list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

        -- install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- automatically install missing parsers when entering buffer
        -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
        auto_install = true,
        ignore_install = {},

        -- incremental selection based on the named nodes from the grammar.
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
            node_incremental = "<Leader>si",
            scope_incremental = "<Leader>sc",
            node_decremental = "<Leader>sd",
          },
        },

        highlight = {
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          disable = {},

          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          --disable = function(lang, buf)
          --    local max_filesize = 100 * 1024 -- 100 KB
          --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --    if ok and stats and stats.size > max_filesize then
          --        return true
          --    end
          --end,

          additional_vim_regex_highlighting = false,
        },

        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- Or you can use the capture groups from another scheme
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },

            selection_modes = {
              -- Specify which mode of selection should be used for the capture
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "v", -- charwise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end,
  },
}
