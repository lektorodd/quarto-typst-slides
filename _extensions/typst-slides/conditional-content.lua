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

return {
  {Meta = Meta},
  {Div = Div, Span = Span}
}
