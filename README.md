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
See `LICENSE` for more details.

Details
-------

### Hints about usage

The sample document `sample.tex` provides a mock-up of a thesis, as well as
hints about the class's features.

### List of features

`kthpq-thesis` is based on the `book` class: all options (aside from
`figtreepath`) will be passed onto it.

Loaded packages:
- `xcolor` with option `cmyk`
- `biblatex` via the package `biblatex-kthpq`
- `fontspec` for loading fonts
- `unicode-math` for loading math fonts
- `geometry` for setting the page and margins
- `fancyhdr` for the headers and footers
- `titlesec` for formatting titles and sections
- `tocloft` for formatting the table of contents
- `babel` and `csquotes` for switching languages
- `caption` for formatting captions
- `enumitem` for formatting lists

and some packages mostly for internal use:
- `kvoptions`
- `etoolbox`
- `emptypage`
- `afterpage`
- `xstring`

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
