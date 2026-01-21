// Typst Show Rule - Maps Pandoc metadata to template function
// This file uses Pandoc template syntax ($if$, $for$, etc.)

#import "typst-template.typ": slides

#show: slides.with(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  author: ($for(author)$[$author$]$sep$, $endfor$),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(institute)$
  institute: [$institute$],
$endif$

  // Typography from brand.yml or defaults
$if(typography.base)$
  font-body: "$typography.base$",
$endif$
$if(typography.headings)$
  font-headings: "$typography.headings$",
$endif$
$if(typography.monospace)$
  font-mono: "$typography.monospace$",
$endif$

  // Colors from brand.yml or defaults
$if(color.primary)$
  color-primary: rgb("$color.primary$"),
$endif$
$if(color.accent)$
  color-accent: rgb("$color.accent$"),
$else$
$if(color.secondary)$
  color-accent: rgb("$color.secondary$"),
$endif$
$endif$
$if(color.foreground)$
  color-text: rgb("$color.foreground$"),
$endif$
$if(color.link)$
  color-link: rgb("$color.link$"),
$else$
$if(color.primary)$
  color-link: rgb("$color.primary$"),
$endif$
$endif$
)
