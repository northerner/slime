defmodule Slime do
  def to_html(string) do
    string |> parse |> EEx.eval_string 
  end

  def parse(<<"| " :: binary, text :: binary>>), do: text
  def parse(<<"= " :: binary, expression :: binary>>), do: to_eex(expression) 
  def parse(<<"<", html_string :: binary>>), do: "<" <> html_string
  def parse(line) do
    case String.split(line) do
      [tag | content] -> "<#{tag}>#{Enum.join(content, " ")}</#{tag}>" 
      tag -> "<#{tag}></#{tag}>" 
    end
  end

  defp to_eex(expression), do: "<%= #{expression} %>"
end
