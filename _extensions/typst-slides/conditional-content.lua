-- Lua filter for conditional content in slides vs documents
-- Usage:
--   ::: {.slides-only}
--   Content that only appears in slides
--   :::
--
--   ::: {.doc-only}
--   Content that only appears in documents
--   :::

local is_slides = false

-- Check if we're rendering slides format
function Meta(meta)
  if FORMAT:match("typst%-slides") then
    is_slides = true
  end
  return meta
end

-- Filter divs based on class
function Div(div)
  -- Remove .doc-only content when rendering slides
  if is_slides and div.classes:includes("doc-only") then
    return {}
  end

  -- Remove .slides-only content when rendering documents
  if not is_slides and div.classes:includes("slides-only") then
    return {}
  end

  -- Keep everything else
  return div
end

-- Filter spans based on class (for inline conditional content)
function Span(span)
  -- Remove .doc-only content when rendering slides
  if is_slides and span.classes:includes("doc-only") then
    return {}
  end

  -- Remove .slides-only content when rendering documents
  if not is_slides and span.classes:includes("slides-only") then
    return {}
  end

  -- Keep everything else
  return span
end

-- Wrap sections in Polylux slides for slides format
function Blocks(blocks)
  if not is_slides then
    return blocks
  end

  local result = {}
  local current_slide = {}

  for _, block in ipairs(blocks) do
    if block.t == 'Header' and block.level == 1 then
      -- Close previous slide if it has content
      if #current_slide > 0 then
        -- Wrap in polylux-slide
        table.insert(result, pandoc.RawBlock('typst', '#polylux-slide['))
        for _, b in ipairs(current_slide) do
          table.insert(result, b)
        end
        table.insert(result, pandoc.RawBlock('typst', ']\n'))
        current_slide = {}
      end

      -- Start new slide with this heading
      table.insert(current_slide, block)
    else
      -- Add to current slide
      table.insert(current_slide, block)
    end
  end

  -- Close final slide if it has content
  if #current_slide > 0 then
    table.insert(result, pandoc.RawBlock('typst', '#polylux-slide['))
    for _, b in ipairs(current_slide) do
      table.insert(result, b)
    end
    table.insert(result, pandoc.RawBlock('typst', ']\n'))
  end

  return result
end

return {
  {Meta = Meta},
  {Div = Div, Span = Span},
  {Blocks = Blocks}
}
