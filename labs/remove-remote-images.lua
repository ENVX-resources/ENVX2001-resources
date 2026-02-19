-- Remove images with remote URLs for non-HTML formats.
-- Wikimedia blocks pandoc downloads (no user-agent), causing broken mediabag
-- files. Stripping remote images keeps the PDF buildable.

function Image(el)
  if el.src:match("^https?://") then
    return {}
  end
end
