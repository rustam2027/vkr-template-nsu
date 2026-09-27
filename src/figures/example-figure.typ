// Example figure: a plain table. Replace with a diagram, plot, or image as
// needed, then `#include` and wrap it in `#figure(...)` from the part that
// references it — see the comment in `parts/introduction.typ`.

#let example-figure = table(
  columns: 3,
  table.header([Column A], [Column B], [Column C]),
  [row 1], [row 1], [row 1],
  [row 2], [row 2], [row 2],
)
