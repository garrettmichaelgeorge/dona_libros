defmodule DonaLibros.Books.Bibliophile do
  use Ecto.Schema
  import Ecto.Changeset

  alias DonaLibros.Accounts.User
  alias DonaLibros.Books.Book

  schema "bibliophiles" do
    belongs_to :user, User
    has_many :owned_books, Book, foreign_key: :owner_id
    has_many :borrowed_books, Book, foreign_key: :current_reader_id

    timestamps()
  end

  @doc false
  def changeset(bibliophile, attrs) do
    bibliophile
    |> cast(attrs, [])
    |> validate_required([])
    |> unique_constraint(:user_id)
  end
end
