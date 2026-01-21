// Simple Typst Slides Template with Brand Support
// Supports Quarto _brand.yml integration

// Configure 16:9 presentation format
#set page(
  paper: "presentation-16-9",
  margin: (x: 2em, y: 2em),
)

// Font configuration from brand.yml or defaults
#let body-font = "$if(typography.base)$$typography.base$$else$Liberation Sans$endif$"
#let heading-font = "$if(typography.headings)$$typography.headings$$else$Liberation Sans$endif$"
#let mono-font = "$if(typography.monospace)$$typography.monospace$$else$Liberation Mono$endif$"

// Color configuration from brand.yml or defaults
#let primary-color = rgb("$if(color.primary)$$color.primary$$else$#1a5490$endif$")
#let accent-color = rgb("$if(color.accent)$$color.accent$$else$$if(color.secondary)$$color.secondary$$else$#D85A5A$endif$$endif$")
#let text-color = rgb("$if(color.foreground)$$color.foreground$$else$#000000$endif$")
#let link-color = rgb("$if(color.link)$$color.link$$else$$if(color.primary)$$color.primary$$else$#0066cc$endif$$endif$")

// Basic text settings
#set text(
  size: 20pt,
  font: body-font,
  fill: text-color,
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
      fill: primary-color,
      font: heading-font,
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
    fill: primary-color,
    font: heading-font,
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
    fill: accent-color,
    font: heading-font,
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
  text(size: 16pt, font: mono-font, it)
)

// Inline code
#show raw.where(block: false): it => text(
  font: mono-font,
  fill: rgb("#333333"),
  it
)

// Links
#show link: set text(fill: link-color)

// Strong/bold text
#show strong: set text(weight: "bold")

// Lists
#set list(indent: 1em)
#set enum(indent: 1em)

// Title slide
#align(center + horizon)[
  $if(title)$
  #text(size: 48pt, weight: "bold", fill: primary-color, font: heading-font)[$title$]
  $endif$

  $if(subtitle)$
  #v(1em)
  #text(size: 32pt, fill: accent-color, font: heading-font)[$subtitle$]
  $endif$

  $if(author)$
  #v(2em)
  #text(size: 24pt, font: body-font)[$for(author)$$author$$sep$, $endfor$]
  $endif$

  $if(date)$
  #v(1em)
  #text(size: 20pt, fill: rgb("#666666"), font: body-font)[$date$]
  $endif$

  $if(institute)$
  #v(0.5em)
  #text(size: 18pt, fill: rgb("#888888"), font: body-font)[$institute$]
  $endif$
]

// Content
$body$
