defmodule AbsintheBug.SchemaTest do
  use ExUnit.Case

  test "positive case" do
    res =
      """
      {
        test(list: [{key: "a", value: "1"}, {key: "b", value: "2"}]) {
          key
          value
        }
      }
      """
      |> Absinthe.run!(AbsintheBug.Schema)

    assert %{
             data: %{"test" => [%{"key" => "a", "value" => "1"}, %{"key" => "b", "value" => "2"}]}
           } == res
  end

  test "integer instead of list" do
    res =
      """
      {
        test(list: 1234) {
          key
          value
        }
      }
      """
      |> Absinthe.run!(AbsintheBug.Schema)

    assert %{errors: [%{locations: [%{column: _, line: _}]}]} = res
  end

  test "string instead of list" do
    res =
      """
      {
        test(list: "abcd") {
          key
          value
        }
      }
      """
      |> Absinthe.run!(AbsintheBug.Schema)

    assert %{errors: [%{locations: [%{column: _, line: _}]}]} = res
  end
end
