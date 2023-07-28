Some title
==========

# Introduction

yada ua.

# Methods

## data collection

ldydsa

# Results

this is not bad

Maybe you can use pandoc citations?

# Conclusions

there you have it.

# Fancier markdown

From https://github.com/agoose77/jupyterlab-markup

This seems promising that you can add features to markdown. 

## Definition Lists


Term 1
  ~ Definition 1

Term 2
  ~ Definition 2a
  ~ Definition 2b

## Mermaid

```mermaid 
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

## SVG Bob

```svgbob 
     .---.
    /-o-/--
 .-/ / /->
( *  \/
 '-.  \
    \ /
     '
```

## Using Footnotes

Here is a footnote reference,[^1] and another.[^longnote]

This is one way to do references for now. See [^1] again. And later, see [^longnote]. that looks kind of odd. [^longnote] it seems to keep a counter?


# Wish list

1. Collapsible headings
2. citations and bibliography
3. Custom links that are clickable, with tooltips.
4. export of a Markdown file to PDF, probably via pandoc (see https://github.com/jupyterlab/jupyterlab/issues/4676 for options)
5. some editing sugar in this. Basically anything...



# Footnotes

[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.