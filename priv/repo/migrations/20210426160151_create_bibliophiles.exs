defmodule DonaLibros.Repo.Migrations.CreateBibliophiles do
  use Ecto.Migration

  def change do
    create table(:bibliophiles) do
      add :user_id, references(:users, on_delete: :delete_all),
                    null: false

      timestamps()
    end

    create unique_index(:bibliophiles, [:user_id])
  end
end
