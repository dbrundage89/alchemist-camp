filename = IO.gets("File to count the words from: ") |> String.trim()
counter = IO.gets("What would you like to count? w=words,c=characters,l=lines: ") |> String.trim()
content = File.read!(filename)
not_empty = fn x -> x != "" end

items =
  case counter do
    "w" -> content |> String.split(~r{(\\n|[^\w'])+}) |> Enum.filter(not_empty)
    "c" -> content |> String.split("") |> Enum.filter(not_empty)
    "l" -> content |> String.split(~r{(\r\n|\n|\r)})
    _ -> "enter a valid option"
  end

IO.inspect(items)

items |> Enum.count() |> IO.puts()
