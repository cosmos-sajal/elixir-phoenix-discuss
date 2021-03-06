defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration
  import Discuss.SoftDelete.Migration
  import Discuss.UUID.Migration

  def up do
    create table("topics") do
      add(:title, :string)
      timestamps()
      soft_delete_columns()
      uuid_column()
    end

    create_index_on_soft_delete("topics")
  end

  def down do
    drop(table("topics"))
  end
end
