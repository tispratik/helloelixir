defmodule Myapp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :crypted_pwd, :string

      timestamps
    end

  end
end
