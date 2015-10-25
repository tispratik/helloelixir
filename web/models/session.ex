defmodule Myapp.Session do
  alias Myapp.User
  use Myapp.Web, :controller

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["passwd"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, passwd) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(passwd, user.crypted_passwd)
    end
  end

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
    # id = Plug.Conn.get_session(conn, :current_user)
    # if id, do: Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)
end
