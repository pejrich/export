defmodule Export.Helpers do
  @moduledoc false

  def convert_options(options) do
    options
    |> Enum.map(fn
      {key, ["" <> _ | _] = list} ->
        {key, Enum.map(list, &to_charlist/1)}

      {key, other_options} when is_list(other_options) ->
        {key,
         other_options
         |> Enum.map(fn
           {key, value} ->
             {key |> Atom.to_charlist(), value |> String.to_charlist()}
         end)}

      {key, "" <> value} ->
        {key, value |> String.to_charlist()}

      opt ->
        opt
    end)
  end
end
