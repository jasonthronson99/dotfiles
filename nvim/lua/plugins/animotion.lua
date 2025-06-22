return {
  "luiscassih/AniMotion.nvim",
  event = "VeryLazy",
  config = function()
    require("AniMotion").setup({
      mode = "helix",
      clear_keys = { "<C-c>" },
      edit_keys = { "d", "x" },
      color = { bg = "#673AB7" }
    })
  end
}
