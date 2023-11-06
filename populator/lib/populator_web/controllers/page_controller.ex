defmodule PopulatorWeb.PageController do
  use PopulatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
