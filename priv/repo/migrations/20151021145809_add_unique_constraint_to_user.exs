defmodule :"Elixir.Myapp.Repo.Migrations.Add-unique-constraint-to-user" do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email])
  end
end
