# Repository Guidelines

## Project Structure & Module Organization

This repo is a personal dotfiles collection managed with GNU Stow. Most files are meant to be stowed directly into your home directory.

- Root-level dotfiles: shell, git, and terminal settings (e.g., `.bashrc`, `.gitconfig`, `.tmux.conf`).
- App configs: under `.config/` (e.g., `.config/zed/`, `.config/hypr/`, `.config/nvim/`).
- Local completions: under `.local/share/bash-completion/`.
- Stow configuration: `.stowrc`, `.stow-local-ignore`.

## Build, Test, and Development Commands

Formatting is handled with Prettier via `pnpm`:

- `pnpm format`: run all format targets.
- `pnpm format-md`: format Markdown files.
- `pnpm format-json`: format JSON files.
- `pnpm format-sh`: format select shell dotfiles.
- `pnpm format-toml`: format TOML files.

There is no build or test pipeline for this repository.

## Coding Style & Naming Conventions

- Prefer the existing dotfile naming patterns (leading dots, descriptive filenames).
- Keep files ASCII unless the target format requires otherwise.
- Formatting is standardized by Prettier; see `.prettierrc` for configuration.

## Testing Guidelines

- No automated tests are defined.
- Validate changes by reviewing the affected config file and, if applicable, reloading the relevant tool (e.g., shell, editor, window manager).

## Commit & Pull Request Guidelines

- Follow the conventional commit style seen in history, e.g., `feat: ...`, `docs: ...`, `chore(scope): ...`.
- Keep commits scoped to a single topic (example: `chore(hypr): ...`).
- PRs should include a short description of the change and any relevant context (screenshots are helpful for UI-related config changes).

## Security & Configuration Tips

- Treat credentials and tokens as sensitive; avoid committing secrets.
- Prefer sample or placeholder configs (see `.gitconfig.local.example`) when sharing private settings.
