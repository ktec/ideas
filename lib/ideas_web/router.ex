defmodule IdeasWeb.Router do
  use IdeasWeb, :router

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

  scope "/", IdeasWeb do
    pipe_through :browser # Use the default browser stack
    
    resources "/sessions", SessionController
    resources "/", IdeaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", IdeasWeb do
  #   pipe_through :api
  # end
end
