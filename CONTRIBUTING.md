# Contributing

This document is intended to be a template of sorts. It is written in the context of this repository to provide concrete examples, but **changes to this repository may not always adhere to the guidelines below**.

## Commit message

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
   │       │       │        └─ `MUST` be present-tense, periodless, `Uncapitalize<string>`
   │       │       │
   │       │       └─ `MUST` include `!` for breaking changes; `MUST` omit otherwise
   │       │
   │       └─ `MUST` be a subdirectory of `apps/*` or `packages/*`, `devtools`, or a root directory (e.g. `infra`)
   │
   └─ `MUST` be `build|chore|ci|docs|feat|fix|refactor|test`
```

1. `<type>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be a [Type](#type)
2. `<scope>`, if set, [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be a [Scope](#scope)
3. `<scope>` [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) exist if `<bang>` (`!`) doesn't exist
4. `<scope>` [SHOULD](https://rfc-editor.org/rfc/rfc2119#section-3) exist if `<bang>` (`!`) exists
5. `<bang>` [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) exist if `type==chore|ci|docs|refactor|test`
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

| **Scope**                                | **Example Changes**                | **Example Scope** | **Example paths**         |
| ---------------------------------------- | ---------------------------------- | ----------------- | ------------------------- |
| A directory in `apps/*`                  | Standalone apps in `apps/`         | `www`             | `apps/www`                |
| A directory in `packages/*`              | Shared packages in `packages/`     | `logger`          | `packages/logger`         |
| Root directory besides `apps`/`packages` | Infrastructure as code in `infra/` | `infra`           | `infra/environments/prod` |
| `devtools`                               | Developer tooling                  | `devtools`        | `.zed`                    |

Generally, `scope` should be a package. In this repository, `scope` tends to be the name of the app that the changes affect OR a directory in `packages/`.

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

##### Bang

If a commit introduces a breaking change, the `!` character [MUST](https://rfc-editor.org/rfc/rfc2119#section-1) be present in the `<header>`.

The following [Types](#type) should never have a `!` in the `<header>`:

1. `chore`: Changes to developer tooling [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) affect the public API or end-user functionality.
2. `ci`: Changes to CI/CD [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) affect the public API or end-user functionality.
3. `docs`: Changes to documentation [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) affect the public API or end-user functionality.
4. `refactor`: Changes to code structure [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) affect the public API or end-user functionality.
5. `test`: Changes to tests [MUST NOT](https://rfc-editor.org/rfc/rfc2119#section-2) affect the public API or end-user functionality.
