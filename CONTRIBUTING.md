# Contributing

This document is intended to be a template of sorts. It is written in the context of this repository to provide concrete examples, but **changes to this repository may not always adhere to the guidelines below**.

## Commit messages

Commit messages adhere to the [Conventional Commits specification](https://conventionalcommits.org/en/v1.0.0/#specification). General structure, [Type](#type) and [Scope](#scope) are adapted from [Angular's commit message guidelines](https://github.com/angular/angular/blob/c672f9211bf78a580ed220a0729d3a8cefa5a737/contributing-docs/commit-message-guidelines.md).

### Structure

```txt
<header>
<!-- <BLANK LINE> -->
<body>
<!-- <BLANK LINE> -->
<footer>
```

1. `<header>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) exist
2. `<body>` [SHOULD](https://rfc-editor.org/rfc/rfc2119#section-3) exist
3. `<footer>` [MAY](https://rfc-editor.org/rfc/rfc2119#section-5) exist

#### Header

```txt
<type>[(<scope>)][<bang>]: <summary>
   │       │       │        │
   │       │       │        └─⫸ `MUST` be present-tense, periodless, `Uncapitalize<string>`
   │       │       │
   │       │       └─⫸ `MUST` include `!` for breaking changes; `MUST` omit otherwise
   │       │
   │       └─⫸ `MUST` be `bash|git|rg|stow|tmux|.config/*` for non-breaking changes; `MAY` omit otherwise
   │
   └─⫸ `MUST` be `build|chore|ci|docs|feat|fix|perf|refactor|test`
```

1. `<type>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be a [Type](#type)
2. `<scope>`, if set, [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be a [Scope](#scope)
3. `<scope>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) exist if `!bang`
4. `<scope>` [SHOULD](https://rfc-editor.org/rfc/rfc2119#section-3) exist if `bang`
5. `<bang>` [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) exist if `type!=feat|fix`
6. `<summary>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be present-tense
7. `<summary>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be uncapitalized
8. `<summary>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) omit ending "."

##### Type

A commit's **type** provides insight into the commit's changes and their impact.

1. `type` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be one of the following:

| **Type**   | **Changes**                | **Example paths**         | **Version** | **`!`**  | **Example commit message**         |
| ---------- | -------------------------- | ------------------------- | ----------- | -------- | ---------------------------------- |
| `build`    | Dependencies, build system | `**/package.json`         | `+0.0.1`    | `-`      | `build: bump pnpm to v10.21.0`     |
| `chore`    | Devtools                   | `**/eslint.config.js`     | `-`         | `-`      | `chore: warn on ESLint issue`      |
| `ci`       | Workflows                  | `.github/workflows/**`    | `-`         | `-`      | `ci: run tests on PR to main`      |
| `docs`     | Comments, documentation    | `**/README.md`, `docs/**` | `-`         | `-`      | `docs: mark APIs @internal`        |
| `feat`     | Functionality              | `**/src/**`               | `+0.1.0`    | `+1.0.0` | `feat: add support for dark mode`  |
| `fix`      | Behavior                   | `**/src/**`               | `+0.0.1`    | `+1.0.0` | `fix: disallow weak password`      |
| `refactor` | Code structure             | `*`                       | `+0.0.1`    | `-`      | `refactor: extend shared tsconfig` |
| `test`     | Unit/E2E                   | `**/test/**`              | `-`         | `-`      | `test: snapshot Tab component`     |

Common `type`(s) intentionally excluded:

- `perf`: slow performance is considered a bug, and thus covered by `fix`

Commit `type`s with a **Version** of `-`:

1. Public API [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) change if `type!=feat|fix`
2. Release [SHOULD](https://rfc-editor.org/rfc/rfc2119#section-3) trigger if `type=build|feat|fix|refactor`
3. Version [SHOULD NOT](https://rfc-editor.org/rfc/rfc2119#section-4) change if `type!=build|feat|fix|refactor`
    - Major (`1.0.0`) version [MUST](https://rfc-editor.org/rfc/rfc2119#section-2) change if `!` is present
    - Minor (`0.1.0`) version [MUST](https://rfc-editor.org/rfc/rfc2119#section-2) change if `type=feat` and `!` is not present
    - Patch (`0.0.1`) version [MUST](https://rfc-editor.org/rfc/rfc2119#section-2) change if `type=build|fix|refactor` and `!` is not present

##### Scope

A commit's **scope** indicates a commit's area of impact. Omit scope if changes span multiple areas (e.g. `refactor`) or aren't related to a specific package (e.g. `docs`).

1. If supplied, `scope` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be one of the following:

| **Scope**          | **Changes**               | **Example paths**                                                      |
| ------------------ | ------------------------- | ---------------------------------------------------------------------- |
| `bash`             | Bash shell config         | `.bash_aliases\|.bash_prompt\|.bash_profile\|.bashrc\|.bash_functions` |
| `git`              | Git config                | `.gitignore\|.gitconfig.local.example\|.gitconfig\|.gitignore_global`  |
| `readline`         | GNU readline config       | `.inputrc`                                                             |
| `rg`               | Ripgrep config            | `.rgignore\|.ripgreprc`                                                |
| `stow`             | GNU Stow config           | `.stow-local-ignore\|.stowrc`                                          |
| `tmux`             | Tmux config               | `.tmux.conf`                                                           |
| `*` in `.config/*` | Directories in `.config/` | `.config/cheat`                                                        |
| `devtools`         | Developer tooling         | `.prettierignore\|.prettierrc\|.zed/*`                                 |

Generally, `scope` should be a package. In this repository, `scope` tends to be the name of the binary that the changes affect OR a directory in `.config/`.

> [!TIP]
> `scope` serves to inform readers _where_ a change occurred. `scope` generally helps us do two things:
>
> 1. Organize the CHANGELOG
> 2. Determine a commit's area of impact
>
> Consider the following:
>
> - Breaking changes are read carefully: `<header>`, `<body>`(s), and `<footer>`(s).
> - Non-breaking changes are more often represented by their `<header>` in a CHANGELOG.
>
> It follows that **`scope` is most important for non-breaking changes**.

### Examples

> [!EXAMPLE]- Minimal non-breaking change
>
> ```txt
> <type>(<scope>): <summary>
> ```

> [!EXAMPLE]- Minimal breaking change (`!`)
>
> ```txt
> <fix|feat>!: <summary>
>
> BREAKING CHANGE: <description>
> ```

> [!EXAMPLE]- Detailed non-breaking change
>
> ```txt
> <type>(<scope>): <summary>
>
> <optional body>
>
> <optional footer(s)>
> ```

> [!EXAMPLE]- Detailed breaking change (`!`)
>
> ```txt
> <fix|feat>(<optional scope>)!: <summary>
>
> <optional body>
>
> BREAKING CHANGE: <description>
> <optional footer(s)>
> ```

## Release

A release is triggered by a commit that includes a message [header](#header) with one of the following prefixes:

| Prefix        | Description      | Example                                   | Version  |
| ------------- | ---------------- | ----------------------------------------- | -------- |
| `build(*)`    | Scoped build     | `build(api): bump Express to 5.0.0`       | `+0.0.1` |
| `build`       | Build            | `build: bump TypeScript to 6.0.0`         | `+0.0.1` |
| `feat!`       | Breaking feature | `feat!: require MFA for all`              | `+1.0.0` |
| `feat(*)!`    | Scoped, breaking | `feat(api)!: send welcome email`          | `+1.0.0` |
| `feat(*)`     | Scoped feature   | `feat(web): toggle dark mode`             | `+0.1.0` |
| `feat`        | Feature          | `feat: add background jobs`               | `+0.1.0` |
| `fix!`        | Breaking bugfix  | `fix!: disallow weak password`            | `+1.0.0` |
| `fix(*)!`     | Scoped, breaking | `fix(api)!: auth cookie expires`          | `+1.0.0` |
| `fix(*)`      | Scoped bugfix    | `fix(web): redirect on login`             | `+0.0.1` |
| `fix`         | Bugfix           | `fix: run tests included in source`       | `+0.0.1` |
| `refactor(*)` | Scoped refactor  | `refactor(api): split tests from source`  | `+0.0.1` |
| `refactor`    | Refactor         | `refactor: use lower-kebab for filenames` | `+0.0.1` |

Notable exclusions:

- `refactor!`, `refactor(*)!`, `build!`, and `build(*)`: bumping dependencies and refactoring code shouldn't affect public API.
- The rest of the [types](#type): a release can include any valid [type](#type), but a release is only triggered by `build|feat|fix|refactor`.

1. Releases [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be triggered by `build|feat|fix|refactor` [type](#type) commits.
2. Releases [MAY](https://rfc-editor.org/rfc/rfc2119#section-5) include one or more `chore|ci|docs|test` [type](#type) commits.
