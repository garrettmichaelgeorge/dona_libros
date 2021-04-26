defmodule DonaLibros.Books.Bibliophile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bibliophiles" do
    field :user_id, :id

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
