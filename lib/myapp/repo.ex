defmodule Myapp.Repo do
  use Ecto.Repo, otp_app: :myapp
  use Scrivener, page_size: 10
end
