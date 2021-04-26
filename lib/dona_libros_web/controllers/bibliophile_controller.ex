defmodule DonaLibrosWeb.BibliophileController do
  use DonaLibrosWeb, :controller

  alias DonaLibros.Books
  alias DonaLibros.Books.Bibliophile

  def index(conn, _params) do
    bibliophiles = Books.list_bibliophiles()
    render(conn, "index.html", bibliophiles: bibliophiles)
  end

  def new(conn, _params) do
    changeset = Books.change_bibliophile(%Bibliophile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bibliophile" => bibliophile_params}) do
    case Books.create_bibliophile(bibliophile_params) do
      {:ok, bibliophile} ->
        conn
        |> put_flash(:info, "Bibliophile created successfully.")
        |> redirect(to: Routes.bibliophile_path(conn, :show, bibliophile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bibliophile = Books.get_bibliophile!(id)
    render(conn, "show.html", bibliophile: bibliophile)
  end

  def edit(conn, %{"id" => id}) do
    bibliophile = Books.get_bibliophile!(id)
    changeset = Books.change_bibliophile(bibliophile)
    render(conn, "edit.html", bibliophile: bibliophile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bibliophile" => bibliophile_params}) do
    bibliophile = Books.get_bibliophile!(id)

    case Books.update_bibliophile(bibliophile, bibliophile_params) do
      {:ok, bibliophile} ->
        conn
        |> put_flash(:info, "Bibliophile updated successfully.")
        |> redirect(to: Routes.bibliophile_path(conn, :show, bibliophile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bibliophile: bibliophile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bibliophile = Books.get_bibliophile!(id)
    {:ok, _bibliophile} = Books.delete_bibliophile(bibliophile)

    conn
    |> put_flash(:info, "Bibliophile deleted successfully.")
    |> redirect(to: Routes.bibliophile_path(conn, :index))
  end
end
