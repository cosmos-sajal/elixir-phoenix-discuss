defmodule Discuss.Topic do
  use Discuss.Web, :model
  import Discuss.SoftDelete.Schema

  schema "topics" do
    field(:title, :string)
    timestamps()
    soft_delete_schema()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
