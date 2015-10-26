defmodule Myapp.User do
  use Myapp.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :crypted_passwd, :string
    field :passwd, :string, virtual: true
    field :passwd_confirmation, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email passwd passwd_confirmation)
  @optional_fields ~w()

  before_insert :set_passwd_digest

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:passwd, min: 8)
    |> validate_confirmation(:passwd, message: "does not match password")
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
  end

  def set_passwd_digest(changeset) do
    passwd = Ecto.Changeset.get_field(changeset, :passwd)
    change(changeset, %{crypted_passwd: encrypt_passwd(passwd)})
  end

  def encrypt_passwd(passwd) do
    Comeonin.Bcrypt.hashpwsalt(passwd)
  end
end
