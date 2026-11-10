# choto.nvim
Port of my color theme, "choto", for nvim

```lua
{
    "joyanta-kumar/choto.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        transparent = false,
        italic_comments = true
    },
    config = function(_, opts)
        require("choto").setup(opts)
        vim.cmd.colorscheme("choto")
    end
}
```
