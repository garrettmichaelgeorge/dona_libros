defmodule DonaLibros.BooksTest do
  use DonaLibros.DataCase

  alias DonaLibros.Books

  describe "bibliophiles" do
    alias DonaLibros.Books.Bibliophile

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def bibliophile_fixture(attrs \\ %{}) do
      {:ok, bibliophile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_bibliophile()

      bibliophile
    end

    test "list_bibliophiles/0 returns all bibliophiles" do
      bibliophile = bibliophile_fixture()
      assert Books.list_bibliophiles() == [bibliophile]
    end

    test "get_bibliophile!/1 returns the bibliophile with given id" do
      bibliophile = bibliophile_fixture()
      assert Books.get_bibliophile!(bibliophile.id) == bibliophile
    end

    test "create_bibliophile/1 with valid data creates a bibliophile" do
      assert {:ok, %Bibliophile{} = bibliophile} = Books.create_bibliophile(@valid_attrs)
    end

    test "create_bibliophile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_bibliophile(@invalid_attrs)
    end

    test "update_bibliophile/2 with valid data updates the bibliophile" do
      bibliophile = bibliophile_fixture()
      assert {:ok, %Bibliophile{} = bibliophile} = Books.update_bibliophile(bibliophile, @update_attrs)
    end

    test "update_bibliophile/2 with invalid data returns error changeset" do
      bibliophile = bibliophile_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_bibliophile(bibliophile, @invalid_attrs)
      assert bibliophile == Books.get_bibliophile!(bibliophile.id)
    end

    test "delete_bibliophile/1 deletes the bibliophile" do
      bibliophile = bibliophile_fixture()
      assert {:ok, %Bibliophile{}} = Books.delete_bibliophile(bibliophile)
      assert_raise Ecto.NoResultsError, fn -> Books.get_bibliophile!(bibliophile.id) end
    end

    test "change_bibliophile/1 returns a bibliophile changeset" do
      bibliophile = bibliophile_fixture()
      assert %Ecto.Changeset{} = Books.change_bibliophile(bibliophile)
    end
  end
end
