defmodule BandManagerWeb.BandController do
  use BandManagerWeb, :controller

  @bands [
    %{name: "Billy Talent", genre: "Punk Rock"},
    %{name: "Madonna", genre: "Pop"},
    %{name: "Nightwish", genre: "Metal", albums: [
        %{name: "Wishmaster", year: 2000, songs: [
          %{name: "The Kinslayer", rating: 3.0},
          %{name: "Wanderlust", rating: 1.3},
          %{name: "Wishmaster", rating: 4.2},
          %{name: "Crownless", rating: 4.8},
          %{name: "Dead Boy's Poem", rating: 2.4}
        ]},
        %{name: "Once", year: 2004, songs: [
          %{name: "Dark Chest of Wonders"},
          %{name: "Wish I Had an Angel"},
          %{name: "Nemo"}
        ]},
        %{name: "Imaginaerium", year: 2011, songs: [

        ]}
    ]}
  ]

  def index(conn, %{"query" => search} = params) do
    bands = @bands
    |> Enum.filter fn(b) ->
      b.name =~ search || b.genre =~ search
    end

    render conn, "index.html", bands: bands
  end

  def index(conn, _params) do
    render conn, "index.html", bands: @bands
  end

  def show(conn, %{"id" => id}) do
    band = @bands
    |> Enum.find (fn(b) -> b.name == id end)

    render conn, "show.html", band: band
  end
end
