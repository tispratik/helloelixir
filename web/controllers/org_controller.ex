defmodule Myapp.OrgController do
  use Myapp.Web, :controller

  alias Myapp.Org

  plug :scrub_params, "org" when action in [:create, :update]

  def index(conn, _params) do
    orgs = Repo.all(Org)
    render(conn, "index.html", orgs: orgs)
  end

  def new(conn, _params) do
    changeset = Org.changeset(%Org{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"org" => org_params}) do
    changeset = Org.changeset(%Org{}, org_params)

    case Repo.insert(changeset) do
      {:ok, _org} ->
        conn
        |> put_flash(:info, "Org created successfully.")
        |> redirect(to: org_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    org = Repo.get!(Org, id)
    render(conn, "show.html", org: org)
  end

  def edit(conn, %{"id" => id}) do
    org = Repo.get!(Org, id)
    changeset = Org.changeset(org)
    render(conn, "edit.html", org: org, changeset: changeset)
  end

  def update(conn, %{"id" => id, "org" => org_params}) do
    org = Repo.get!(Org, id)
    changeset = Org.changeset(org, org_params)

    case Repo.update(changeset) do
      {:ok, org} ->
        conn
        |> put_flash(:info, "Org updated successfully.")
        |> redirect(to: org_path(conn, :show, org))
      {:error, changeset} ->
        render(conn, "edit.html", org: org, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    org = Repo.get!(Org, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(org)

    conn
    |> put_flash(:info, "Org deleted successfully.")
    |> redirect(to: org_path(conn, :index))
  end
end
