defmodule Discuss.SoftDelete.Migration do
  @moduledoc """
  Contains functions to add soft delete columns to a table during migrations
  """

  use Ecto.Migration

  @doc """
  Adds deleted_at column to a table. This column is used to track if an item is deleted or not and when
      defmodule MyApp.Repo.Migrations.CreateUser do
        use Ecto.Migration
        import Ecto.SoftDelete.Migration
        def change do
          create table(:users) do
            add :email, :string
            add :password, :string
            timestamps()
            soft_delete_columns()
          end
        end
      end
  """
  def soft_delete_columns() do
    add(:deleted_at, :utc_datetime, [])
    add(:soft_deleted, :boolean, default: false)
  end

  def create_index_on_soft_delete(table_name) do
    create(index(table_name, [:soft_deleted]))
  end
end
