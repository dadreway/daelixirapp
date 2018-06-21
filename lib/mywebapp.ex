defmodule Parser do
  @moduledoc """

  """
  defstruct last_id: -1, carinfo: %{}

  @path "lib/hondamodels.tsv"

  def parse do
    @path
    |> read
    |> touchup
  end

  defp read(filepath) do
    filepath
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  defp touchup(data) do
    cars = fn el, acc ->
      [id, modelname, firstyear, status, picture] = String.split(el, "\t")
      id = String.to_integer(id)
      Map.put(acc, id, %Hondacars{id: id, modelname: modelname, firstyear: firstyear, status: status, picture: picture})
    end

    carinfo = Enum.reduce(data, %{}, cars)
    last_id = Map.keys(carinfo) |> Enum.max()

    %Parser{last_id: last_id, carinfo: carinfo}

  end
end
