defmodule DonaLibros.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :author, :string
      add :year, :integer
      add :owner_id, references(:bibliophiles, on_delete: :delete_all),
                     null: false
      add :current_reader_id, references(:bibliophiles, on_delete: :delete_all),
                              null: false

      timestamps()
    end

    create index(:books, [:owner_id])
    create index(:books, [:current_reader_id])
  end
end
