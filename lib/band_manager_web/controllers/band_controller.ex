defmodule BandManagerWeb.BandController do
  use BandManagerWeb, :controller

  @bands [
    %{name: "Billy Talent", genre: "Punk Rock"},
    %{name: "Madonna", genre: "Pop"},
    %{name: "Nightwish", genre: "Metal"}
  ]

  def index(conn, %{"query" => search} = params) do
    bands = @bands
    |> Enum.filter fn(b) ->
      b.name =~ search || b.genre =~ search
    end

    json(conn, %{bands: bands, params: params})
  end

  def index(conn, _params) do
    json(conn, %{bands: @bands})
  end

  def show(conn, params) do
    html(conn, "<h1>" <> params["id"] <> "</h1>")
  end
end
