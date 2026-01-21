# Brand Style Guide — Quick Reference

## Typography

### Fonts
- **Base Text**: Source Sans 3 — Clean, readable, professional
- **Headings**: Roboto Slab — Elegant serif with character
- **Code/Data**: JetBrains Mono — Monospace with ligatures

### Font Sources
All fonts available from Google Fonts:
```
https://fonts.google.com/specimen/Source+Sans+3
https://fonts.google.com/specimen/Roboto+Slab
https://fonts.google.com/specimen/JetBrains+Mono
```

---

## Color Palette

### Neutrals
Sophisticated grays for text, backgrounds, and borders.

| Shade | Hex | Usage |
|-------|-----|-------|
| 900 | `#1A1D23` | Primary text, headings |
| 800 | `#2C3038` | Secondary headings, code |
| 700 | `#3E434E` | Strong text |
| 600 | `#555B68` | Body text, captions |
| 500 | `#6E7481` | Muted text |
| 400 | `#8B919D` | Disabled text |
| 300 | `#A8ADB6` | Borders |
| 200 | `#C5C8CF` | Subtle borders |
| 100 | `#E2E4E8` | Light backgrounds |
| 50 | `#F5F6F8` | Subtle backgrounds |

### Primary — Deep Teal
Sophisticated and professional. Use for primary buttons, key UI elements.

| Shade | Hex |
|-------|-----|
| 900 | `#004D4D` |
| 800 | `#006666` |
| 700 | `#007F7F` |
| **Primary** | `#008B8B` |
| 300 | `#33A3A3` |
| 200 | `#66BBBB` |
| 100 | `#99D3D3` |
| 50 | `#CCE9E9` |

### Accent — Warm Coral
Energetic and approachable. Use for CTAs and highlights.

| Shade | Hex |
|-------|-----|
| 900 | `#8B3A3A` |
| 800 | `#A34545` |
| **Accent** | `#D85A5A` |
| 300 | `#E07B7B` |
| 200 | `#E89C9C` |
| 100 | `#F0BDBD` |
| 50 | `#F8DEDE` |

### Functional Colors
Colorblind-friendly colors for specific purposes.

| Purpose | Color | Hex | Usage |
|---------|-------|-----|-------|
| **Link** | Purple | `#6B46C1` | All hyperlinks |
| Link Hover | Dark Purple | `#553C9A` | Hover state |
| Link Visited | Light Purple | `#9333EA` | Visited links |
| **Highlight** | Golden Yellow | `#FBBF24` | Important content |
| Highlight BG | Pale Yellow | `#FEF3C7` | Highlight background |
| **Success** | Green | `#10B981` | Success messages |
| Success BG | Pale Green | `#D1FAE5` | Success background |
| **Warning** | Amber | `#F59E0B` | Warning messages |
| Warning BG | Pale Amber | `#FEF3C7` | Warning background |
| **Error** | Red | `#DC2626` | Error messages |
| Error BG | Pale Red | `#FEE2E2` | Error background |
| **Info** | Blue | `#3B82F6` | Info messages |
| Info BG | Pale Blue | `#DBEAFE` | Info background |

---

## Usage Guidelines

### Text Hierarchy
- **H1-H3**: Roboto Slab, Neutral 900/800
- **Body**: Source Sans 3, Neutral 900, 12pt
- **Secondary**: Neutral 600 for captions
- **Code**: JetBrains Mono, Neutral 800

### Color Application
- **Primary (Teal)**: Main CTAs, primary nav, key interactions
- **Accent (Coral)**: Secondary CTAs, highlights, hovers
- **Links (Purple)**: All hyperlinks — highly visible & colorblind-safe
- **Highlight (Yellow)**: Selections, callouts, featured content
- **Backgrounds**: Neutral 50 for subtle, white for primary

### Accessibility ✓
- ✓ All colors meet WCAG AA contrast requirements
- ✓ Link purple optimized for colorblind users (deuteranopia, protanopia)
- ✓ Highlight yellow works for all colorblind types
- ✓ Never rely solely on color — use text labels, icons, or patterns

---

## Implementation in Quarto Typst Slides

This extension automatically integrates with your `_brand.yml` file to apply the brand guidelines across both slides and documents.

### How It Works

The extension reads color and typography settings from your `_brand.yml`:

```yaml
typography:
  base: Source Sans 3
  headings: Roboto Slab
  monospace: JetBrains Mono

color:
  primary: "#008B8B"        # Deep Teal
  accent: "#D85A5A"         # Warm Coral
  link: "#6B46C1"           # Purple (colorblind-friendly)
  highlight: "#FBBF24"      # Golden Yellow
  neutral:
    900: "#1A1D23"          # Primary text
    800: "#2C3038"          # Secondary text
    600: "#555B68"          # Muted text
    50: "#F5F6F8"           # Subtle backgrounds
```

### Applied Styles

#### Slides (`typst-slides`)
- **H1/H2**: Primary color (Deep Teal)
- **H3**: Secondary text color (Neutral 800)
- **Body**: Primary text (Neutral 900)
- **Links**: Purple (#6B46C1) - colorblind-friendly
- **Strong/Bold**: Accent color (Warm Coral)
- **Code blocks**: Subtle background (Neutral 50)

#### Documents (`typst-doc`)
- **H1/H2**: Primary color (Deep Teal)
- **H3**: Secondary text color (Neutral 800)
- **Body**: Primary text (Neutral 900)
- **Links**: Purple (#6B46C1) - colorblind-friendly
- **Strong/Bold**: Accent color (Warm Coral)
- **Headers**: Muted text (Neutral 500)
- **Code blocks**: Subtle background (Neutral 50)

---

## Key Principles

1. **Simple & Elegant**: Clean typography, generous whitespace
2. **Colorblind-Friendly**: Purple links, yellow highlights
3. **Professional**: Deep teal for trust, warm coral for energy
4. **Accessible**: High contrast, never color-only indicators
5. **Modern**: Sans-serif base, serif headings, monospace code
6. **Consistent**: Same design language across slides and documents

---

## Examples

### Slide Example
- Title in Deep Teal (Primary)
- Bullet points in Neutral 900
- Emphasis in Warm Coral (Accent)
- Links in Purple
- Code with subtle gray background

### Document Example
- Chapter headings in Deep Teal
- Body text in Neutral 900
- Captions in Neutral 600
- Links in Purple
- Strong text in Warm Coral
- Tables and figures with consistent styling

---

## Customization

To customize colors for your specific needs, edit your `_brand.yml` file. The extension will automatically apply your changes to both formats.

### Example: Custom Primary Color

```yaml
color:
  primary: "#006666"  # Darker teal
  accent: "#E07B7B"   # Lighter coral
```

All headings, key UI elements, and emphasis will automatically use your custom colors while maintaining accessibility and consistency.
