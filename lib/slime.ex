defmodule Slime do
  def to_html(string) do
    string
    |> parse
    |> Code.eval_quoted
    |> (fn {result, _} -> result end).()
  end

  def parse(string) do
    case String.codepoints(string) do
      ["|" | text] -> Enum.join(text) |> String.strip
    end
  end
end
