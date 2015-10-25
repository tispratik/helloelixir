defmodule Myapp.Org do
  use Myapp.Web, :model

  schema "orgs" do
    field :name, :string
    field :domain, :string
    field :license, :string
    field :address, :string
    field :email, :string
    field :phone1, :string
    field :phone2, :string
    field :fax, :string
    field :facebook_url, :string
    field :twitter_handle, :string
    field :yelp_url, :string

    timestamps
  end

  @required_fields ~w(name domain license address phone1)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
