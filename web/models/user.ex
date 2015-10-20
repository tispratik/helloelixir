defmodule Myapp.User do
  use Myapp.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :crypted_passwd, :string
    field :passwd, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email passwd)
  @optional_fields ~w()

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
    |> validate_length(:passwd, min: 5)
  end
end
