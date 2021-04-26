defmodule DonaLibrosWeb.PageController do
  use DonaLibrosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
