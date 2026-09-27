# NSU Thesis Template

A [Typst](https://typst.app) template for a Novosibirsk State University (NSU)
qualification thesis (ВКР), formatted per GOST 7.32-2017 via the
[`modern-g7-32`](https://typst-gost.ru) package.

## Requirements

- [Typst](https://typst.app/docs/) 0.14 or later.
- Internet access on first compile, so Typst can download `modern-g7-32` and
  its dependencies (`cetz`, `fletcher`) from the package registry. They are
  then cached locally and no longer required.

## Quick start

1. Use this repository as a template (or clone it).
2. Edit `src/metadata.typ`: replace every `[bracketed placeholder]` with your
   faculty, department, programme, name, thesis title, and committee
   details.
3. Compile:
   ```sh
   typst compile src/main.typ thesis.pdf
   ```
   or, for live rebuilding on save:
   ```sh
   typst watch src/main.typ thesis.pdf
   ```
4. Replace the placeholder text in `src/parts/*.typ` with your own chapters.

## Layout

```
src/
├── main.typ              entry point: assembles the document from the parts below
├── metadata.typ          thesis facts (author, title, faculty, committee, …)
├── share/
│   ├── header.typ        document-wide styling; wraps the body in the GOST template
│   ├── title-page.typ    renders the title page from metadata.typ
│   └── declarations.typ  optional draft/revision markup helpers
├── parts/
│   ├── abstract.typ      "Реферат" — required abstract page
│   ├── introduction.typ  "Введение"
│   ├── chapter-1.typ     example chapter — rename freely
│   ├── chapter-2.typ     example chapter — rename freely
│   └── conclusion.typ    "Заключение"
├── figures/
│   └── example-figure.typ  example of a figure kept in its own file
└── bibliography/
    └── references.bib    sources, cited in text as ~@key
```

Every part is a separate file included from `main.typ`. To add, remove, or
reorder a chapter, edit the `#include` list in `main.typ` — file names don't
need to match chapter titles or each other.

## Title page

`src/share/title-page.typ` reproduces NSU's standard title page for a
bachelor's or master's thesis; it reads every value it prints from
`src/metadata.typ`, so that file is the only one you need to edit for the
title page to be correct. If your faculty's official wording differs — a
different ministry name, a different approval line — edit the fixed strings
in `title-page.typ` directly; they are not metadata because they don't vary
between students.

The built-in title page of `modern-g7-32` is designed for research-institute
reports, not university theses, so it is disabled (`hide-title: true` in
`header.typ`) in favor of this one.

## Abstract

`src/parts/abstract.typ` follows the required "Реферат" structure: title,
page/source/illustration counts, keywords, then two summary paragraphs. Fill
in the counts last, since they depend on the finished, compiled document.

## Figures and bibliography

Keep each figure's drawing code in its own file under `figures/`, then
`#include` it and wrap it in `#figure(..., caption: [...]) <label>` from the
chapter that first refers to it, referencing it in text as `@label`. This
keeps chapter files focused on prose and makes a figure reusable if it is
needed in more than one place.

Bibliography sources go in `bibliography/references.bib`; cite them in text
with `~@key`, and they appear, numbered by order of first citation, wherever
`#bibliography(...)` is called in `main.typ`.

## Draft markup

`src/share/declarations.typ` provides three helpers for marking text as you
revise a draft:

- `old(content)` — struck through and highlighted red; hidden entirely when
  markup is off.
- `new(content)` — highlighted green while markup is on; shown as plain text
  otherwise.
- `comment(it)` — a bracketed, greyed-out inline note; hidden when markup is
  off.

Set `show-markup` at the top of that file to `true` while drafting and back
to `false` before the version you submit — a thesis with visible strikethrough
text will not be accepted. Delete the file, and its imports in any part that
uses it, if you don't need this workflow.

## Editor setup

Any editor with a Typst language server works. Two are common:

- **VS Code**: install the [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
  extension and open the repository root; it finds `src/main.typ`
  automatically.
- **Helix**: `.helix/languages.toml` is preconfigured to point `tinymist` at
  `src/main.typ` and export the PDF to `target/` on every keystroke, provided
  `tinymist` is installed and on your `PATH`.

## License

The thesis content is yours. `modern-g7-32`, the package this template
depends on, is licensed under GPL-3.0; see its
[repository](https://github.com/typst-g7-32/modern-g7-32) for details.
