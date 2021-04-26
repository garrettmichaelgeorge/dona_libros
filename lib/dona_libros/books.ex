defmodule DonaLibros.Books do
  @moduledoc """
  The Books context.
  """

  import Ecto.Query, warn: false
  alias DonaLibros.Repo

  alias DonaLibros.Accounts
  alias DonaLibros.Books.Bibliophile

  @doc """
  Returns the list of bibliophiles.

  ## Examples

      iex> list_bibliophiles()
      [%Bibliophile{}, ...]

  """
  def list_bibliophiles do
    Bibliophile
    |> Repo.all()
    |> Repo.preload(:books)
  end

  @doc """
  Gets a single bibliophile.

  Raises `Ecto.NoResultsError` if the Bibliophile does not exist.

  ## Examples

      iex> get_bibliophile!(123)
      %Bibliophile{}

      iex> get_bibliophile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bibliophile!(id), do: Repo.get!(Bibliophile, id)

  @doc """
  Creates a bibliophile.

  ## Examples

      iex> create_bibliophile(%{field: value})
      {:ok, %Bibliophile{}}

      iex> create_bibliophile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bibliophile(attrs \\ %{}) do
    %Bibliophile{}
    |> Bibliophile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bibliophile.

  ## Examples

      iex> update_bibliophile(bibliophile, %{field: new_value})
      {:ok, %Bibliophile{}}

      iex> update_bibliophile(bibliophile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bibliophile(%Bibliophile{} = bibliophile, attrs) do
    bibliophile
    |> Bibliophile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bibliophile.

  ## Examples

      iex> delete_bibliophile(bibliophile)
      {:ok, %Bibliophile{}}

      iex> delete_bibliophile(bibliophile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bibliophile(%Bibliophile{} = bibliophile) do
    Repo.delete(bibliophile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bibliophile changes.

  ## Examples

      iex> change_bibliophile(bibliophile)
      %Ecto.Changeset{data: %Bibliophile{}}

  """
  def change_bibliophile(%Bibliophile{} = bibliophile, attrs \\ %{}) do
    Bibliophile.changeset(bibliophile, attrs)
  end

  alias DonaLibros.Books.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Book
    |> Repo.all()
    |> Repo.preload(:owner)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(%Bibliophile{} = owner, attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Ecto.Changeset.put_change(:owner_id, owner.id)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  def ensure_owner_exists(%Accounts.User{} = user) do
    %Bibliophile{user_id: user.id}
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.unique_constraint(:user_id)
    |> Repo.insert()
    |> handle_existing_owner
  end

  defp handle_existing_owner({:ok, owner}), do: owner
  defp handle_existing_owner({:error, changeset}) do
    Repo.get_by!(Bibliophile, user_id: changeset.data.user_id)
  end
end
