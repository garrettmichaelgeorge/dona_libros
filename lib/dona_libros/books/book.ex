defmodule DonaLibros.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :title, :string
    field :year, :integer
    field :owner_id, :id
    field :current_reader_id, :id

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :year])
    |> validate_required([:title, :author, :year])
  end
end
