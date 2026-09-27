// Optional helpers for tracking text under revision. Set `show-markup` to
// `true` while drafting to see comments and highlighted changes; set it back
// to `false` (the value used for the submitted thesis) to render clean text.
// Delete this file and its imports if you don't need the workflow.

#let show-markup = false

#let comment(it) = {
  if show-markup {
    text(fill: luma(50))[*\[#it\]*]
  }
}

#let old(content) = {
  if show-markup {
    highlight(fill: red.transparentize(80%), strike(content))
  }
}

#let new(content) = {
  if show-markup {
    highlight(fill: green.transparentize(80%), content)
  } else {
    content
  }
}
