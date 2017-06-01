# Inspired by https://blackode.github.io/elixir-tips/

import IO.ANSI, only: [color: 3]

# Colors
light_blue = color(1, 2, 4)
bright_pink = color(5, 0, 1)
pale_orange = color(5, 3, 2)

IEx.configure(
  colors: [
    eval_result: [light_blue, :bright],
    eval_error: [bright_pink, :bright],
    eval_info: [pale_orange, :bright],
  ])
