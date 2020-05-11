# Tmux

## Table of Contents

- [Tmux](#tmux)
  - [Table of Contents](#table-of-contents)
  - [Settings](#settings)

## Settings

Enable mouse control

```shell
set -g mouse on
```

Start windows and panes at 1, not 0

```shell
set -g base-index 1
setw -g pane-base-index 1
```
