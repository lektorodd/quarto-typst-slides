// Typst Slides Template Function
// Pure Typst - no Pandoc template syntax

#let slides(
  // Document metadata
  title: none,
  subtitle: none,
  author: none,
  date: none,
  institute: none,

  // Typography settings
  font-body: "Liberation Sans",
  font-headings: "Liberation Sans",
  font-mono: "Liberation Mono",

  // Color settings
  color-primary: rgb("#1a5490"),
  color-accent: rgb("#D85A5A"),
  color-text: rgb("#000000"),
  color-link: rgb("#0066cc"),

  // Content
  body,
) = {

  // Configure 16:9 presentation format
  set page(
    paper: "presentation-16-9",
    margin: (x: 2em, y: 2em),
  )

  // Basic text settings
  set text(
    size: 20pt,
    font: font-body,
    fill: color-text,
  )

  set par(justify: false)

  // Level 1 headings: Title slides (centered, large)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    place(
      center + horizon,
      text(
        size: 40pt,
        weight: "bold",
        fill: color-primary,
        font: font-headings,
        it.body
      )
    )
  }

  // Level 2 headings: New slide headers
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    v(1em)
    text(
      size: 32pt,
      weight: "bold",
      fill: color-primary,
      font: font-headings,
      it.body
    )
    v(0.5em)
  }

  // Level 3+ headings: Section headers within slides
  show heading.where(level: 3): it => {
    v(0.75em)
    text(
      size: 24pt,
      weight: "bold",
      fill: color-accent,
      font: font-headings,
      it.body
    )
    v(0.5em)
  }

  // Code blocks
  show raw.where(block: true): it => block(
    fill: rgb("#f5f5f5"),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    text(size: 16pt, font: font-mono, it)
  )

  // Inline code
  show raw.where(block: false): it => text(
    font: font-mono,
    fill: rgb("#333333"),
    it
  )

  // Links
  show link: set text(fill: color-link)

  // Strong/bold text
  show strong: set text(weight: "bold")

  // Lists
  set list(indent: 1em)
  set enum(indent: 1em)

  // Title slide
  if title != none or author != none {
    align(center + horizon)[
      #if title != none {
        text(size: 48pt, weight: "bold", fill: color-primary, font: font-headings)[#title]
      }

      #if subtitle != none {
        v(1em)
        text(size: 32pt, fill: color-accent, font: font-headings)[#subtitle]
      }

      #if author != none {
        v(2em)
        text(size: 24pt, font: font-body)[
          #if type(author) == array {
            author.join(", ")
          } else {
            author
          }
        ]
      }

      #if date != none {
        v(1em)
        text(size: 20pt, fill: rgb("#666666"), font: font-body)[#date]
      }

      #if institute != none {
        v(0.5em)
        text(size: 18pt, fill: rgb("#888888"), font: font-body)[#institute]
      }
    ]
  }

  // Content
  body
}
