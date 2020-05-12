# Factorio

- [Factorio](#factorio)
  - [Console commands](#console-commands)

## Console commands

List all crafting tabs and their order

```lua
/c for k,v in pairs(game.item_group_prototypes) do log("name "..v.name..",order "..v.order) end
```
