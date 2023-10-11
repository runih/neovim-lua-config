return {
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
  dependencies = {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  },
  opts = {
    ensure_installed = {
      "black", -- python formatter
      "gitlint", -- git commit messages
      "goimports", -- go formatter
      "hadolint", -- dockerfile
      "jq", --json formatter
      "markdownlint", -- markdown formatter/linter
      "nixfmt", -- nixfmt is a formatter for Nix code, intended to apply a uniform style.
      "pylint", -- python linter
      "pyright", -- python language server
      "shfmt", -- shell scritps
      "statix", -- Lints and suggestions for the nix programming language.
      "stylua", -- lua formatter
      "yamllint",
    },
    automatic_installation = true,
  },
}
