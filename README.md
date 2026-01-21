# Quarto Typst Slides Extension

A Quarto extension that provides two Typst-based output formats:

- **typst-slides**: PDF presentation slides using Polylux
- **typst-doc**: PDF documents with traditional document formatting

Both formats support conditional content, allowing you to maintain a single source file that renders differently for presentations vs. documents.

## Features

- Generate beautiful PDF slides using Typst and Polylux
- Create detailed PDF documents from the same source
- Conditional content blocks (`.slides-only` and `.doc-only`)
- Full integration with Quarto's `_brand.yml` for typography
- Consistent styling across both formats
- No intermediate LaTeX or HTML steps

## Installation

```bash
quarto add lektorodd/quarto-typst-slides
```

Or if working locally with this repository:

```bash
quarto install extension .
```

## Usage

### Basic Setup

In your QMD file's YAML header, specify one or both formats:

```yaml
---
title: "My Presentation"
author: "Your Name"
format:
  typst-slides: default
  typst-doc: default
---
```

### Conditional Content

Use fenced divs to control what appears in each format:

#### Slides-Only Content

```markdown
::: {.slides-only}
- Bullet points for slides
- Keep it concise
- Visual focus
:::
```

#### Document-Only Content

```markdown
::: {.doc-only}
This detailed explanation only appears in the document version.
It can include extensive analysis, references, and comprehensive
discussions that would be too verbose for slides.
:::
```

#### Inline Conditional Content

You can also use spans for inline conditional content:

```markdown
This appears everywhere, but [this is slides only]{.slides-only}
and [this is document only]{.doc-only}.
```

### Brand Integration

Create a `_brand.yml` file in your project root to customize typography:

```yaml
typography:
  fonts:
    - family: Roboto Slab
      source: google
    - family: JetBrains Mono
      source: google
    - family: Source Sans 3
      source: google

  base: Source Sans 3
  headings: Roboto Slab
  monospace: JetBrains Mono

color:
  primary: "#1f77b4"
  secondary: "#555555"
```

The extension will automatically use these settings for both formats.

## Rendering

### Render Both Formats

```bash
quarto render document.qmd
```

### Render Specific Format

```bash
quarto render document.qmd --to typst-slides
quarto render document.qmd --to typst-doc
```

## Example

See `example.qmd` for a complete example demonstrating:

- Title slides with metadata
- Conditional content blocks
- Code highlighting
- Mixed content (universal + format-specific)
- Document-only abstracts and detailed sections
- Slides-only summary points

## Requirements

- Quarto >= 1.4.0
- Typst (automatically installed by Quarto)

## File Structure

```
_extensions/
  typst-slides/
    _extension.yml          # Extension metadata
    conditional-content.lua # Lua filter for conditional blocks
    typst-slides.typ        # Slides template (Polylux)
    typst-doc.typ           # Document template
```

## How It Works

1. **Lua Filter**: The `conditional-content.lua` filter processes your document during Quarto's AST transformation phase, removing `.slides-only` content when rendering documents and `.doc-only` content when rendering slides.

2. **Typst Templates**: Two separate templates provide format-specific styling:
   - `typst-slides.typ` uses Polylux for presentation slides
   - `typst-doc.typ` provides traditional document formatting

3. **Brand Integration**: Both templates read from Quarto's brand.yml system, ensuring consistent typography and colors across formats.

## Tips

- Keep slides concise with `.slides-only` bullet points
- Add detailed explanations in `.doc-only` sections
- Use abstracts, acknowledgments, and references in document-only blocks
- Include presenter notes or speaker guidance in document-only content
- Add tables, detailed statistics, and methodology in document-only sections

## License

MIT License

## Contributing

Contributions welcome! Please feel free to submit issues or pull requests.
