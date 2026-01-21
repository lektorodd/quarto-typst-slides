# Quarto Typst Slides Extension

A simple Quarto extension that creates PDF presentation slides using native Typst.

## Features

- Simple, no-dependency PDF slides using native Typst
- 16:9 presentation format
- Level 1 headings (`#`) create title slides (centered, large)
- Level 2 headings (`##`) create new content slides
- Level 3 headings (`###`) are subsections within slides
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

You can customize colors and fonts by editing `_extensions/typst-slides/typst-slides.typ`.

Default colors:
- Primary (headings): `#1a5490` (blue)
- Text: Black
- Code background: `#f5f5f5` (light gray)

## License

MIT License

## Contributing

Contributions welcome! Please feel free to submit issues or pull requests.
