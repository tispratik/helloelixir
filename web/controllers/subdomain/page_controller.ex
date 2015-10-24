defmodule Myapp.Subdomain.PageController do
  use Myapp.Web, :controller

  def index(conn, _params) do
    text(conn, "Subdomain home page for #{conn.private[:subdomain]}")
  end
end
