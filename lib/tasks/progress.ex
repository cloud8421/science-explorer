defmodule Mix.Tasks.Progress do
  use Mix.Task

  def run(_) do
    IO.write IO.ANSI.red <> "Some random test"
    :timer.sleep(1000)
    IO.write "]\n\033[F\033[J"
    IO.write "]\n\033[F\033[J"
    IO.puts IO.ANSI.green <> "\e[2K" <> "First update"
    :timer.sleep(2000)
    IO.puts IO.ANSI.green <> "]\n\033[F\033[J" <> "Second update"
    :timer.sleep(2000)
    IO.puts IO.ANSI.yellow <> "]\n\033[F\033[J" <> "Third update"
  end
end
