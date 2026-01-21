#import "@preview/polylux:0.3.1": *

// Typography settings from brand.yml
$if(brand.typography.base)$
#let body-font = ("$brand.typography.base$",)
$else$
#let body-font = ("Source Sans 3",)
$endif$

$if(brand.typography.headings)$
#let heading-font = ("$brand.typography.headings$",)
$else$
#let heading-font = ("Roboto Slab",)
$endif$

$if(brand.typography.monospace)$
#let mono-font = ("$brand.typography.monospace$",)
$else$
#let mono-font = ("JetBrains Mono",)
$endif$

// Theme colors from brand.yml
$if(brand.color.primary)$
#let primary-color = rgb("$brand.color.primary$")
$else$
#let primary-color = rgb("#008B8B")
$endif$

$if(brand.color.accent)$
#let accent-color = rgb("$brand.color.accent$")
$else$
#let accent-color = rgb("#D85A5A")
$endif$

// Neutral colors
$if(brand.color.neutral.900)$
#let text-color = rgb("$brand.color.neutral.900$")
$else$
#let text-color = rgb("#1A1D23")
$endif$

$if(brand.color.neutral.800)$
#let text-secondary = rgb("$brand.color.neutral.800$")
$else$
#let text-secondary = rgb("#2C3038")
$endif$

$if(brand.color.neutral.600)$
#let text-muted = rgb("$brand.color.neutral.600$")
$else$
#let text-muted = rgb("#555B68")
$endif$

$if(brand.color.neutral.50)$
#let bg-subtle = rgb("$brand.color.neutral.50$")
$else$
#let bg-subtle = rgb("#F5F6F8")
$endif$

// Functional colors
$if(brand.color.link)$
#let link-color = rgb("$brand.color.link$")
$else$
#let link-color = rgb("#6B46C1")
$endif$

$if(brand.color.highlight)$
#let highlight-color = rgb("$brand.color.highlight$")
$else$
#let highlight-color = rgb("#FBBF24")
$endif$

$if(brand.color.highlight-bg)$
#let highlight-bg = rgb("$brand.color.highlight-bg$")
$else$
#let highlight-bg = rgb("#FEF3C7")
$endif$

// Configure the document
#set page(
  paper: "presentation-16-9",
  margin: (x: 2em, y: 2em),
)

#set text(
  font: body-font,
  size: 20pt,
  fill: text-color,
)

#set par(justify: true)

#show heading.where(level: 1): set text(
  font: heading-font,
  size: 32pt,
  fill: primary-color,
)

#show heading.where(level: 2): set text(
  font: heading-font,
  size: 28pt,
  fill: primary-color,
)

#show heading.where(level: 3): set text(
  font: heading-font,
  size: 24pt,
  fill: text-secondary,
)

#show raw: set text(
  font: mono-font,
  size: 16pt,
  fill: text-secondary,
)

#show raw.where(block: true): it => block(
  fill: bg-subtle,
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  it
)

// Link styling (colorblind-friendly purple)
#show link: set text(fill: link-color)

// Strong text uses accent color for emphasis
#show strong: set text(fill: accent-color)

// Configure Polylux
#polylux-slide(
  // Title slide
  align(horizon + center)[
    $if(title)$
    #text(size: 40pt, font: heading-font, fill: primary-color, weight: "bold")[$title$]
    $endif$

    $if(subtitle)$
    #v(0.5em)
    #text(size: 28pt, font: heading-font, fill: text-muted)[$subtitle$]
    $endif$

    $if(author)$
    #v(2em)
    #text(size: 24pt, fill: text-color)[$for(author)$$author$$sep$, $endfor$]
    $endif$

    $if(date)$
    #v(1em)
    #text(size: 20pt, fill: text-muted)[$date$]
    $endif$

    $if(institute)$
    #v(1em)
    #text(size: 18pt, fill: text-muted)[$institute$]
    $endif$
  ]
)

// Content slides
$body$
