defmodule SlimeTest do
  use ExUnit.Case

  test "text line indicator |" do
    assert Slime.to_html("| this is text") == "this is text"
  end

  test "html inline indicator <" do
    assert Slime.to_html("<p>this is html</p>") == "<p>this is html</p>"
  end

  test "dynamic output with =" do
    assert Slime.to_html("= 1 + 1") == "2"
  end

  test "html tags" do
    assert Slime.to_html("p") == "<p></p>"
  end
end
