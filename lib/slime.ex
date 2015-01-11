defmodule Slime do
  def to_html(string) do
    string |> parse |> EEx.eval_string 
  end

  def parse(<<"| " :: binary, text :: binary>>), do: text
  def parse(<<"= " :: binary, expression :: binary>>), do: to_eex(expression) 
  def parse(html_string), do: html_string

  defp to_eex(expression), do: "<%= #{expression} %>"
end
