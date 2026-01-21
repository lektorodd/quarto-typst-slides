# Quarto Typst Slides Extension

A simple Quarto extension that creates PDF presentation slides using native Typst.

## Features

- Simple, no-dependency PDF slides using native Typst
- 16:9 presentation format
- Level 1 headings (`#`) create title slides (centered, large)
- Level 2 headings (`##`) create new content slides
- Level 3 headings (`###`) are subsections within slides
- Quarto `_brand.yml` integration for fonts and colors
- Google Fonts support
- Clean, minimal styling

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

In your QMD file's YAML header:

```yaml
---
title: "My Presentation"
subtitle: "Optional Subtitle"
author: "Your Name"
date: "2026-01-21"
format: typst-slides
---
```

### Slide Structure

- `#` Level 1 headings create **title slides** (centered, large text)
- `##` Level 2 headings create **new content slides**
- `###` Level 3 headings are subsections within the current slide

### Example

```markdown
---
title: "My Talk"
author: "Your Name"
format: typst-slides
---

# Introduction

This appears as a centered title slide

## First Topic

Content on the first slide.

- Bullet point 1
- Bullet point 2

## Second Topic

More content here.

### Subsection

This subsection stays on the same slide.

# Section Two

Another title slide

## Final Slide

Closing content.
```

## Rendering

```bash
quarto render document.qmd
```

## Requirements

- Quarto >= 1.4.0
- Typst (automatically installed by Quarto)

## File Structure

```
_extensions/
  typst-slides/
    _extension.yml       # Extension metadata
    typst-slides.typ     # Typst template
```

## How It Works

The extension uses native Typst with:
- `paper: "presentation-16-9"` for slide format
- Custom heading styles that create pagebreaks
- Simple, clean design with no external dependencies

## Customization

### Using Quarto Brand (Recommended)

Create a `_brand.yml` file in your project to customize fonts and colors:

```yaml
typography:
  fonts:
    - family: Roboto Slab
      source: google
    - family: Source Sans 3
      source: google
    - family: JetBrains Mono
      source: google

  base: Source Sans 3        # Body text
  headings: Roboto Slab      # Headings
  monospace: JetBrains Mono  # Code

color:
  primary: "#008B8B"    # Headings (Deep Teal)
  accent: "#D85A5A"     # Level 3 headings, subtitle (Warm Coral)
  foreground: "#1A1D23" # Body text
  link: "#6B46C1"       # Links (Purple)
```

The extension automatically uses these settings from your brand file.

### Advanced Color Palette

You can also define a full color palette in `_brand.yml`:

```yaml
color:
  palette:
    deep-teal: "#008B8B"
    warm-coral: "#D85A5A"
    neutral-900: "#1A1D23"
    link-purple: "#6B46C1"

  # Map palette to semantic colors
  primary: deep-teal
  accent: warm-coral
  foreground: neutral-900
  link: link-purple
```

See the included `_brand.yml` for a complete example.

### Manual Customization

You can also edit `_extensions/typst-slides/typst-slides.typ` directly.

Default colors (if no brand file):
- Primary (headings): `#1a5490` (blue)
- Accent: `#D85A5A` (coral)
- Text: Black
- Code background: `#f5f5f5` (light gray)

## License

MIT License

## Contributing

Contributions welcome! Please feel free to submit issues or pull requests.
