# Testing the Slide Rendering Fix

## What Should Happen

When you render a `.qmd` file with both formats enabled:

```bash
quarto render test-simple.qmd
```

You should get **TWO PDF files**:
1. `test-simple-slides.pdf` - Presentation slides (one slide per # heading)
2. `test-simple-doc.pdf` - Continuous document format

## How to Verify Slides Work

### Check 1: Two separate PDF files
```bash
ls -l test-simple*.pdf
```

Expected output:
```
test-simple-doc.pdf
test-simple-slides.pdf
```

### Check 2: Slides are separate pages
Open `test-simple-slides.pdf` and verify:
- Page 1: Title slide with "My Presentation"
- Page 2: "Test slide" heading with the first formula
- Page 3: "TEst new slide" heading with the second formula

Each level 1 heading (`#`) should create a new slide.

### Check 3: Document is continuous
Open `test-simple-doc.pdf` and verify:
- It looks like a regular document (not slides)
- All content flows continuously
- Has traditional document formatting

## Troubleshooting

### Problem: Only one PDF file generated

**Check:** What's the filename?
- If it's `test-simple.pdf` (no suffix), the extension isn't being loaded properly
- Run: `quarto inspect test-simple.qmd` to see if the extension is recognized

**Fix:** Ensure you're in the correct directory with the `_extensions` folder

### Problem: Two PDFs but slides look like a document

**Check:** Look at the generated Typst file
```bash
quarto render test-simple.qmd --to typst-slides --output test-simple-slides.typ
```

**Look for:**
- `#polylux-slide[` blocks wrapping each section
- Each level 1 heading should be inside a `#polylux-slide[...]` block

**If you don't see polylux-slide blocks:**
- The Lua filter isn't running or has an error
- Check: `quarto pandoc test-simple.qmd -t typst --lua-filter=_extensions/typst-slides/conditional-content.lua`

### Problem: Pandoc/Lua filter errors

**Enable verbose logging:**
```bash
quarto render test-simple.qmd --to typst-slides --verbose
```

Look for error messages related to:
- Lua filter execution
- `conditional-content.lua`
- Pandoc AST processing

## Manual Verification

To see the intermediate Typst code:

```bash
# Generate Typst source for slides
quarto render test-simple.qmd --to typst-slides --output test.typ

# Check if it has polylux-slide wrapping
grep -A 5 "polylux-slide" test.typ
```

Expected output should show:
```typst
#polylux-slide[
  <content here>
]
```

## Key Changes Made

1. **Lua Filter** (`conditional-content.lua`):
   - Now uses proper `Pandoc` filter function
   - Wraps each section (level 1 heading + content) in `#polylux-slide[]`

2. **Extension Config** (`_extension.yml`):
   - Added `output-suffix: "-slides"` for typst-slides format
   - Added `output-suffix: "-doc"` for typst-doc format

3. **Template** (`typst-slides.typ`):
   - Removed `pagebreak()` from level 1 headings (Polylux handles pagination)
   - Title slide already uses `#polylux-slide()` correctly
