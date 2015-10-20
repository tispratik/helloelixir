defmodule Myapp.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> put_change(:crypted_passwd, hashed_password(changeset.params["passwd"]))
    |> repo.insert()
  end

  defp hashed_password(passwd) do
    Comeonin.Bcrypt.hashpwsalt(passwd)
  end
end
