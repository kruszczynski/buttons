defmodule ButtonsWeb.Router do
  use ButtonsWeb, :router

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

  scope "/", ButtonsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/healthz", PageController, :healthz
  end

  # Other scopes may use custom stacks.
  scope "/api", ButtonsWeb do
    pipe_through :api

    resources "/buttons", ButtonController, only: [:index]
  end
end
