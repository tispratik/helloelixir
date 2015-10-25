defmodule Myapp.Repo.Migrations.CreateOrg do
  use Ecto.Migration

  def change do
    create table(:orgs) do
      add :name, :string
      add :domain, :string
      add :license, :string
      add :address, :string
      add :email, :string
      add :phone1, :string
      add :phone2, :string
      add :fax, :string
      add :facebook_url, :string
      add :twitter_handle, :string
      add :yelp_url, :string

      timestamps
    end

  end
end
