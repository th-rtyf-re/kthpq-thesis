KTH-PQ thesis: a PhD thesis template for KTH Royal Institute of Technology
============================================================================

General information
-------------------

This software provides a LuaLaTeX PhD thesis template following KTH's
[Brand guidelines](https://intra.kth.se/en/administration/kommunikation/varumarke/grafiskprofil/kth-s-grafiska-profil-1.844676),
published in October 2023, and their
[thesis template](https://www.kth.se/en/student/studier/examensarbete/avhandlingarochexamensarbeten/mall-for-avhandling-1.458236).
This package is not directly supported by KTH or its communications department.

The intent for this class is to be as simple as possible, ready for use without
modifications, but also customizable with as small a learning curve as possible.

`kthpq-thesis` is meant to be compiled with LuaLaTeX. Some commands
may break if using a different "engine". This software can be copy-pasted as-is
into a local directory or a new Overleaf project.

Licensing
---------

Aside from the font files, the files of this software are marked
[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).
See [`LICENSE`](LICENSE) for more details.

Details
-------

### Hints about usage

The sample document [`sample.tex`](sample.tex) provides a mock-up of a thesis, as well as
hints about the class's features.

### List of features

`kthpq-thesis` is based on the `book` class: all options (aside from
`figtreepath`) will be passed onto it.

Loading options:
```
    \documentclass[figreepath=<path>,HTML]{kthpq-thesis}
```
- `figtreepath=<path>` will load Figtree from `<path>`. Default value is
    `auto`, which lets `fontspec` look for Figtree by itself.
- `HTML` will load KTH colors as HTML colors. By default, KTH colors are loaded
    with their CMYK specifications.

Package files:
- [`biblatex-kthpq.sty`](kthpq/biblatex-kthpq.sty). Some options for `biblatex`
    can only be set when loading the package: therefore `kthpq-thesis` cannot
    load `biblatex` itself. The workaround is to provide this package,
    `biblatex-kthpq`, that passes all options to `biblatex`, and to load this
    package in the preamble.
- [`fjournal.dbx`](kthpq/fjournal.dbx). Auxiliary `biblatex` file defining the
    full journal title field.
- [`kthpq-color.sty`](kthpq/kthpq-color.sty). Loads KTH colors.
- [`kthpq-font.sty`](kthpq/kthpq-font.sty). Loads fonts.

Loaded packages:
- [`xcolor`](https://ctan.org/pkg/xcolor) for specifying KTH colors
- [`biblatex`](https://ctan.org/pkg/biblatex) for bibliography management
- [`fontspec`](https://ctan.org/pkg/fontspec) for loading fonts
- [`unicode-math`](https://ctan.org/pkg/unicode-math) for loading math fonts
- [`geometry`](https://ctan.org/pkg/geometry) for setting the page size and margins
- [`fancyhdr`](https://ctan.org/pkg/fancyhdr) for the headers and footers
- [`titlesec`](https://ctan.org/pkg/titlesec) for formatting titles and sections
- [`tocloft`](https://ctan.org/pkg/tocloft) for formatting the table of contents
- [`babel`](https://ctan.org/pkg/babel) and [`csquotes`](https://ctan.org/pkg/csquotes) for switching languages
- [`caption`](https://ctan.org/pkg/caption) for formatting captions
- [`enumitem`](https://ctan.org/pkg/enumitem) for formatting lists

and some packages mostly for internal use:
- [`kvoptions`](https://ctan.org/pkg/kvoptions)
- [`etoolbox`](https://ctan.org/pkg/etoolbox)
- [`emptypage`](https://ctan.org/pkg/emptypage)
- [`afterpage`](https://ctan.org/pkg/afterpage)
- [`xstring`](https://ctan.org/pkg/xstring)

Provided commands:
- `\addchap{<name>}` creates an unnumbered chapter named `<name>` and
    adds it to the table of contents (copied from KOMA-Script).
- `\makecopyright` inserts a placeholder copyright page.
- `\keywords{<words>}` formats keywords for the thesis abstract. This command
    detects the language if the language is English or Swedish.
- `\inlinepaper[submitted]{<ref>}` formats the bibliography entry for
    `<ref>`. If the option `submitted` is present and `<ref>` is a `misc`
    entry, then the output includes a "Submitted" statement. This command
    can handle `article`, `inbook`, `incollection`, `inproceedings`, and
    `misc` bibliography entries.
- `\papertitlepage[color=<color>,submitted]{<ref>}` produces a divider page
    for `<ref>`. The page will be colored `<color>`; the default color is
    white. If the option `submitted` is present and `<ref>` is a `misc` entry,
    then the output includes a "Submitted" statement. This command can handle
    `article`, `inbook`, `incollection`, `inproceedings`, and `misc`
    bibliography entries.
- `\paperchapter[<short title>]{<ref>}` creates a chapter heading for `<ref>`.
    This command is meant to be used when directly including the `TeX` code for
    an included paper in a compilation thesis. `<short title>` is the title
    that appears in headers and footers; the default value is the title of
    `<ref>`.

Provided environments:
- `\begin{dedication}[align=r,stretch=2]...\end{dedication}` creates a
    dedication page. `align` is the alignment of the dedication on the page. It
    takes values `r`, `c`, and `l`; the default value is `r`. `stretch` is the
    the amount of vertical space below the dedication, relative to above; the
    default value is `2`.
- `\begin{abstract}[<language>]...\end{abstract}` creates the thesis
    abstract. The default `<language>` is `english`, and `swedish` is also
    available.
- `\begin{paperabstract}[<width>]...\end{paperabstract}` creates the abstract
    for a paper, useful when directly including the `TeX` code of an included
    paper in a compilation thesis. The abstract is centered, with width
    `<width`. Default `<width>` is `.9\textwidth`.
- `\begin{colophon}[<width>]...\end{colophon}` creates a colophon,
    horizontally and vertically centered, with width `<width>`. Default
    `<width>` is `.5\textwidth`.

Other provided elements:
- `\fontscale`, set to `0.8`, is the scaling factor for most fonts.
- KTH colors: see `kthpq/kthpq-color.sty` for the full list of color names and
    values, both in `HTML` and `cmyk`.
- The `fjournal` field in bibliography entries is now available to `biblatex`
    as `fjournaltitle`.

This class redefines the following commands:
- `\tableofcontents`, `\listoffigures`, `\listoftables` to add them to the
    table of contents,

as well some more expected things, like `\maketitle`.
