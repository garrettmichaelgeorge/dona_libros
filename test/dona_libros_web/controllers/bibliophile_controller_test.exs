defmodule DonaLibrosWeb.BibliophileControllerTest do
  use DonaLibrosWeb.ConnCase

  alias DonaLibros.Books

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:bibliophile) do
    {:ok, bibliophile} = Books.create_bibliophile(@create_attrs)
    bibliophile
  end

  describe "index" do
    test "lists all bibliophiles", %{conn: conn} do
      conn = get(conn, Routes.bibliophile_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bibliophiles"
    end
  end

  describe "new bibliophile" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bibliophile_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bibliophile"
    end
  end

  describe "create bibliophile" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bibliophile_path(conn, :create), bibliophile: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bibliophile_path(conn, :show, id)

      conn = get(conn, Routes.bibliophile_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bibliophile"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bibliophile_path(conn, :create), bibliophile: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bibliophile"
    end
  end

  describe "edit bibliophile" do
    setup [:create_bibliophile]

    test "renders form for editing chosen bibliophile", %{conn: conn, bibliophile: bibliophile} do
      conn = get(conn, Routes.bibliophile_path(conn, :edit, bibliophile))
      assert html_response(conn, 200) =~ "Edit Bibliophile"
    end
  end

  describe "update bibliophile" do
    setup [:create_bibliophile]

    test "redirects when data is valid", %{conn: conn, bibliophile: bibliophile} do
      conn = put(conn, Routes.bibliophile_path(conn, :update, bibliophile), bibliophile: @update_attrs)
      assert redirected_to(conn) == Routes.bibliophile_path(conn, :show, bibliophile)

      conn = get(conn, Routes.bibliophile_path(conn, :show, bibliophile))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, bibliophile: bibliophile} do
      conn = put(conn, Routes.bibliophile_path(conn, :update, bibliophile), bibliophile: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bibliophile"
    end
  end

  describe "delete bibliophile" do
    setup [:create_bibliophile]

    test "deletes chosen bibliophile", %{conn: conn, bibliophile: bibliophile} do
      conn = delete(conn, Routes.bibliophile_path(conn, :delete, bibliophile))
      assert redirected_to(conn) == Routes.bibliophile_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.bibliophile_path(conn, :show, bibliophile))
      end
    end
  end

  defp create_bibliophile(_) do
    bibliophile = fixture(:bibliophile)
    %{bibliophile: bibliophile}
  end
end
