defmodule FormsWeb.Router do
  use FormsWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", FormsWeb do
    pipe_through(:api)

    resources("/pessoa_fisica", PessoaFisicaController, except: [:new, :edit])
    resources("/pessoa_juridica", PessoaJuridicaController, except: [:new, :edit])
    #  post "/pessoa_fisica", PessoaFisicaController, :create
    #  post "/pessoa_juridica", PessoaJuridicaController, :create

    # get("/pessoa_fisica/:id", PessoaFisicaController, :show)
    # get("/pessoa_juridica/:id", PessoaJuridicaController, :show)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: FormsWeb.Telemetry)
    end
  end
end
