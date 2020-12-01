defmodule Greeter do
  def greet do
    name = "hello, I am Lary! What's your name?"
    respond(name)
  end

  def respond(name) do
    case(String.trim(name) |> String.capitalize()) do
      "David" -> "Wow!!! That is my creator's name. I am so glad we have met."
      "Kaitlyn" -> "I really like that name. You must be very nice."
      _ -> "It is very nice to meet you, #{name}."
    end
  end
end
