defmodule Myapp.OrgTest do
  use Myapp.ModelCase

  alias Myapp.Org

  @valid_attrs %{address: "some content", domain: "some content", email: "some content", facebook_url: "some content", fax: "some content", license: "some content", name: "some content", phone1: "some content", phone2: "some content", twitter_handle: "some content", yelp_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Org.changeset(%Org{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Org.changeset(%Org{}, @invalid_attrs)
    refute changeset.valid?
  end
end
