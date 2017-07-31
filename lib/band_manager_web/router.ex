defmodule BandManagerWeb.Router do
  use BandManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BandManagerWeb do
    pipe_through :browser # Use the default browser stack

    resources "/", BandController do
      resources "/albums", AlbumController do
        resources "/songs", SongController, only: [:create, :update, :delete]
      end
    end
  end

  # Other scopes may use custom stacks.
  scope "/api", BandManagerWeb.Api, as: :api do
    pipe_through :api

    resources "/bands", BandController, except: [:new, :edit]
  end
end
