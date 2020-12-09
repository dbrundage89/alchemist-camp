defmodule MiniMarkdown do
  def to_html(text) do
    text
    |> p
    |> bold
    |> italics
    |> h2
    |> h1
  end

  def h2(text) do
    Regex.replace(~r/##(.*)##/, text, "<h2>\\1</h2>")
  end

  def h1(text) do
    Regex.replace(~r/#(.*)#/, text, "<h1>\\1</h1>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end

  @spec italics(binary) :: binary
  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  def p(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
  end

  @spec test_str :: <<_::1008>>
  def test_str do
    """
    #cookout#
    ##comments##

    I *so* enjoyed eating the burrito and the hot sauce was **amaazing**

    What did you think of it?

    asdf
    """
  end
end
