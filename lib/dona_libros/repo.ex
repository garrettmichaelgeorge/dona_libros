defmodule DonaLibros.Repo do
  use Ecto.Repo,
    otp_app: :dona_libros,
    adapter: Ecto.Adapters.Postgres
end
