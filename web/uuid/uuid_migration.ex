defmodule Discuss.UUID.Migration do
  @moduledoc """
  Contains functions to add uuid columns to a table during migrations
  """

  use Ecto.Migration

  def uuid_column() do
    add(:uuid, :uuid, default: fragment("uuid_generate_v4()"))
  end
end
