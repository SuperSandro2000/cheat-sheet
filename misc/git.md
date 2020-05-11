# Git

## Table of Contents

- [Git](#git)
  - [Table of Contents](#table-of-contents)
  - [Aliases](#aliases)
  - [Color](#color)
  - [Settings](#settings)

## Aliases

```shell
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.branch "branch -a"
git config --global alias.ci commit
git config --global alias.c "clone --recursive"
git config --global alias.contributors "shortlog --summary --numbered"
git config --global alias.lg "log --color --decorate --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an (%G?)>%Creset' --abbrev-commit"
git config --global alias.remote "remote -v"
git config --global alias.st status
git config --global alias.tag "tag -l"
```

## Color

```shell
git config --global color.branch.current yellow reverse
git config --global color.branch.local yellow
git config --global color.branch.remote green
git config --global color.diff.meta yellow bold
git config --global color.diff.frag magenta bold
git config --global color.diff.old red
git config --global color.diff.new green
git config --global color.status.added green
git config --global color.status.changed yellow
git config --global color.status.untracked cyan
```

## Settings

```shell
git config --global apply.whitespace fix
git config --global commit.gpgsign true
git config --global diff.renames copies
git config --global help.autocorrect 1
git config --global push.default current
git config --global pull.rebase true
git config --global user.signingkey 3AF5A43A3EECC2E5
```
