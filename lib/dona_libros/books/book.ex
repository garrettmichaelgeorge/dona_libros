defmodule DonaLibros.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias DonaLibros.Books.Bibliophile

  schema "books" do
    field :author, :string
    field :title, :string
    field :year, :integer
    belongs_to :owner, Bibliophile
    belongs_to :current_reader, Bibliophile

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :year])
    |> validate_required([:title, :author, :year])
  end
end
