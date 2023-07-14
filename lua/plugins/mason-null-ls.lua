return {
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
  dependencies = {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  },
  opts = {
    ensure_installed = {
      "stylua", -- lua formatter
      "pylint", -- python linter
      "pyright", -- python language server
      "black", -- python formatter
      "hadolint", -- dockerfile
      "gitlint", -- git commit messages
      "jq", --json formatter
      "goimports", -- go formatter
      "markdownlint", -- markdown formatter/linter
      "nixfmt", -- nixfmt is a formatter for Nix code, intended to apply a uniform style.
      "statix", -- Lints and suggestions for the nix programming language.
      "shfmt", -- shell scritps
      "yamllint",
    },
    automatic_installation = true,
  },
}
