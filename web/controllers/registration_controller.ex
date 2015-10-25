defmodule Myapp.RegistrationController do
  use Myapp.Web, :controller

  # plug :scrub_params, "user" when action in [:create]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    pwd = Map.get(user_params, "passwd")
    changeset = Ecto.Changeset.put_change(changeset, :crypted_passwd, Comeonin.Bcrypt.hashpwsalt(pwd))
    case Repo.insert changeset do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> put_session(:current_user, changeset)
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
