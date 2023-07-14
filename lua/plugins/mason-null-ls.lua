return {
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
  dependencies = {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  },
  opts = {
    ensure_installed = {
      "hadolint", -- dockerfile
      "stylua", -- lua formatter
      "gitlint", -- git commit messages
      "jq", --json formatter
      "goimports", -- go formatter
      "markdownlint", -- markdown formatter/linter
      "nixfmt", -- nixfmt is a formatter for Nix code, intended to apply a uniform style.
      "statix", -- Lints and suggestions for the nix programming language.
      "pylint", -- python linter
      "black", -- python formatter
      "shfmt", -- shell scritps
      "yamllint",
    },
    automatic_installation = true,
  },
}
