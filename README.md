# BoJack

Elixir client for [BoJack](https://github.com/marceloboeira/bojack) - the unreliable key-value store :horse:.

```elixir
server = BoJack.server("localhost")
server |> BoJack.ping #=> "pong"

server |> BoJack.set("hero", "Batman")
server |> BoJack.get("hero") # => "Batman"

server |> BoJack.set("rescues", 42)
server |> BoJack.increment("rescues")
server |> BoJack.get("rescues") # => "43"

server |> BoJack.set("heroes", ["Batman"])
server |> BoJack.append("heroes", "Robin")
server |> BoJack.get("heroes") # => "[\"Batman\", \"Robin\"]"

server |> BoJack.size #=> 3
server |> BoJack.close
```
