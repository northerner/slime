defmodule Slime do
  def to_html(string) do
    string
    |> parse
    |> Code.eval_quoted
    |> (fn {result, _} -> result end).()
  end

  def parse(string) do
    case String.codepoints(string) do
      ["|" | text] -> strip_line(string)
      ["<" | _] -> string
      ["=" | expression] -> strip_line(string) |> Code.eval_string
    end
  end

  defp strip_line(line) do
    line
    |> String.slice(2..-1) 
    |> String.strip
  end
end
