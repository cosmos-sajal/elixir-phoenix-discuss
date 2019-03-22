defmodule Discuss.Repo.SoftDelete do
  use Ecto.Repo, otp_app: :discuss, adapter: Ecto.Adapters.Postgres

  import Ecto.Query

  def with_soft_delete(query) do
    query
    |> where([t], is_nil(t.deleted_at))
  end
end
