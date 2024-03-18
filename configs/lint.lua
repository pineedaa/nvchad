require("lint").linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  vue = { "eslint" },
  python = { "pylint" },
  php = { "phpcs" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end
})
