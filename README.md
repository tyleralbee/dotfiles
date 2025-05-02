# dotfiles

This directory must follow the same structure as `~/`.

## Required packages

## git

```sh
sudo apt install git
```


## GNU Stow

Download GNU Stow using a package manager:

```sh
sudo apt install stow
```

Create symbolic links for all files in the directory:

```sh
stow .
```

This command will place symbolic links from `dotfiles/*` in `~/*`. If a file exists at the path that GNU Stow should put a symbolic link, this command will fail.

To ensure `stow` creates symbolic links in place of existing files, use the `--adopt` flag: 

```sh
stow --adopt .
```

> [!WARNING]
> This command will replace the file in this directory (`dotfiles/*`) with the file in the target directory (`~/*`). Ensure changes are committed to git before running this command.

## Resources

- [Stow has forever changed the way I manage my dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)

