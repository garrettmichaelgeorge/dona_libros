defmodule DonaLibros.Books do
  @moduledoc """
  The Books context.
  """

  import Ecto.Query, warn: false
  alias DonaLibros.Repo

  alias DonaLibros.Books.Bibliophile

  @doc """
  Returns the list of bibliophiles.

  ## Examples

      iex> list_bibliophiles()
      [%Bibliophile{}, ...]

  """
  def list_bibliophiles do
    Repo.all(Bibliophile)
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
end
