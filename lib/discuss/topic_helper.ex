defmodule Discuss.Repo.Topic do
  use Ecto.Repo, otp_app: :discuss, adapter: Ecto.Adapters.Postgres

  import Ecto.Query
  import Discuss.Repo.SoftDelete

  def get_all_topics() do
    query =
      from(t in "topics",
        select: %{
          id: t.id,
          title: t.title,
          inserted_at: t.inserted_at,
          updated_at: t.updated_at
        }
      )
      |> Discuss.Repo.SoftDelete.with_soft_delete()

    %{topics: Discuss.Repo.all(query), count: Discuss.Repo.aggregate(query, :count, :id)}
  end
end
