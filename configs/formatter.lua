local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    vue = {
      require("formatter.filetypes.vue").prettier
    },
    python = {
      require("formatter.filetypes.python").black
    },
    c = {
      require("formatter.filetypes.c").clang_format
    },
    cpp = {
      require("formatter.filetypes.cpp").clang_format
    },
    php = {
      require("formatter.filetypes.php").pretty_php
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
