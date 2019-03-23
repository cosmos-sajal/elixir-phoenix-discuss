defmodule Discuss.Repo.SoftDelete do
  use Ecto.Repo, otp_app: :discuss, adapter: Ecto.Adapters.Postgres

  import Ecto.Query

  def with_non_soft_delete(query) do
    query
    |> where([t], t.soft_deleted == false)
  end
end
