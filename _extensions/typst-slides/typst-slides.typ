// Simple Typst Slides Template
// No external dependencies - just native Typst

// Configure 16:9 presentation format
#set page(
  paper: "presentation-16-9",
  margin: (x: 2em, y: 2em),
)

// Basic text settings
#set text(
  size: 20pt,
  font: "Liberation Sans",
)

#set par(justify: false)

// Level 1 headings: Title slides (centered, large)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  place(
    center + horizon,
    text(
      size: 40pt,
      weight: "bold",
      fill: rgb("#1a5490"),
      it.body
    )
  )
}

// Level 2 headings: New slide headers
#show heading.where(level: 2): it => {
  pagebreak(weak: true)
  v(1em)
  text(
    size: 32pt,
    weight: "bold",
    fill: rgb("#1a5490"),
    it.body
  )
  v(0.5em)
}

// Level 3+ headings: Section headers within slides
#show heading.where(level: 3): it => {
  v(0.75em)
  text(
    size: 24pt,
    weight: "bold",
    fill: rgb("#333333"),
    it.body
  )
  v(0.5em)
}

// Code blocks
#show raw.where(block: true): it => block(
  fill: rgb("#f5f5f5"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  text(size: 16pt, it)
)

// Links
#show link: set text(fill: rgb("#0066cc"))

// Strong/bold text
#show strong: set text(weight: "bold")

// Title slide
#align(center + horizon)[
  $if(title)$
  #text(size: 48pt, weight: "bold", fill: rgb("#1a5490"))[$title$]
  $endif$

  $if(subtitle)$
  #v(1em)
  #text(size: 32pt, fill: rgb("#555555"))[$subtitle$]
  $endif$

  $if(author)$
  #v(2em)
  #text(size: 24pt)[$for(author)$$author$$sep$, $endfor$]
  $endif$

  $if(date)$
  #v(1em)
  #text(size: 20pt, fill: rgb("#666666"))[$date$]
  $endif$
]

// Content
$body$
