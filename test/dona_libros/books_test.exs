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

  describe "books" do
    alias DonaLibros.Books.Book

    @valid_attrs %{author: "some author", title: "some title", year: 42}
    @update_attrs %{author: "some updated author", title: "some updated title", year: 43}
    @invalid_attrs %{author: nil, title: nil, year: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.title == "some title"
      assert book.year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Books.update_book(book, @update_attrs)
      assert book.author == "some updated author"
      assert book.title == "some updated title"
      assert book.year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
