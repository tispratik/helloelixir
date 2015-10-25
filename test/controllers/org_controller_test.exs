defmodule Myapp.OrgControllerTest do
  use Myapp.ConnCase

  alias Myapp.Org
  @valid_attrs %{address: "some content", domain: "some content", email: "some content", facebook_url: "some content", fax: "some content", license: "some content", name: "some content", phone1: "some content", phone2: "some content", twitter_handle: "some content", yelp_url: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, org_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing orgs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, org_path(conn, :new)
    assert html_response(conn, 200) =~ "New org"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, org_path(conn, :create), org: @valid_attrs
    assert redirected_to(conn) == org_path(conn, :index)
    assert Repo.get_by(Org, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, org_path(conn, :create), org: @invalid_attrs
    assert html_response(conn, 200) =~ "New org"
  end

  test "shows chosen resource", %{conn: conn} do
    org = Repo.insert! %Org{}
    conn = get conn, org_path(conn, :show, org)
    assert html_response(conn, 200) =~ "Show org"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, org_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    org = Repo.insert! %Org{}
    conn = get conn, org_path(conn, :edit, org)
    assert html_response(conn, 200) =~ "Edit org"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    org = Repo.insert! %Org{}
    conn = put conn, org_path(conn, :update, org), org: @valid_attrs
    assert redirected_to(conn) == org_path(conn, :show, org)
    assert Repo.get_by(Org, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    org = Repo.insert! %Org{}
    conn = put conn, org_path(conn, :update, org), org: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit org"
  end

  test "deletes chosen resource", %{conn: conn} do
    org = Repo.insert! %Org{}
    conn = delete conn, org_path(conn, :delete, org)
    assert redirected_to(conn) == org_path(conn, :index)
    refute Repo.get(Org, org.id)
  end
end
