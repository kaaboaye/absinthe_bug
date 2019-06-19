defmodule AbsintheBug.Schema do
  use Absinthe.Schema

  object :key_value do
    field(:key, non_null(:string))
    field(:value, non_null(:string))
  end

  input_object :key_value_input do
    field(:key, non_null(:string))
    field(:value, non_null(:string))
  end

  query do
    field :test, list_of(non_null(:key_value)) do
      arg(:list, non_null(list_of(non_null(:key_value_input))))

      resolve(fn _, a, _ ->
        {:ok, a[:list]}
      end)
    end
  end
end
