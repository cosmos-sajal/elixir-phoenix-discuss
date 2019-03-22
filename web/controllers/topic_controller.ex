defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  import Discuss.Repo.Topic

  def index(conn, _params) do
    # topics = Repo.all(Discuss.Topic)
    %{topics: topics, count: _count} = Discuss.Repo.Topic.get_all_topics()

    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Discuss.Topic.changeset(%Discuss.Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = params) do
    changeset = Discuss.Topic.changeset(%Discuss.Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Topic Created!")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Error!")
        |> render("new.html", changeset: changeset)
    end
  end
end
