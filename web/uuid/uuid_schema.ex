defmodule Discuss.UUID.Schema do
  @moduledoc """
  Contains schema macros to add uuid fields to a schema
  """

  defmacro uuid_schema do
    quote do
      field(:uuid, :binary_id, read_after_writes: true)
    end
  end
end
