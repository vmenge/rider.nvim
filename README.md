# rider.nvim

`rider.nvim` is a vibe-coded Neovim colorscheme inspired by the Rider theme from IntelliJ Rider.

It is not a pixel-perfect port. The goal is to capture the general feel of Rider inside Neovim and tune it for this plugin's current highlight groups.

## Install

With `lazy.nvim`:

```lua
{
  "vmenge/rider.nvim",
  lazy = false,
  priority = 1000,
}
```

## Use

```lua
vim.cmd.colorscheme("rider")
```

## Notes

- This theme is vibe coded.
- It is based on JetBrains IntelliJ Rider's Rider theme direction, not an official JetBrains theme port.
- Colors and highlight coverage may keep changing as the theme evolves.
