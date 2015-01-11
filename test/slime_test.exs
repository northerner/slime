defmodule SlimeTest do
  use ExUnit.Case

  test "text line indicator |" do
    assert Slime.to_html("| this is text") == "this is text"
  end
end
