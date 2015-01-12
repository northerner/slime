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

  test "empty html tags" do
    assert Slime.to_html("p") == "<p></p>"
  end

  test "html tags with content" do
    assert Slime.to_html("p this is a test paragraph") == "<p>this is a test paragraph</p>"
    assert Slime.to_html("div this is a test div") == "<div>this is a test div</div>"
  end
end
