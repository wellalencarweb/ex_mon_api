defmodule ExMonApiWeb.TomController do
  use ExMonApiWeb, :controller

  def index(conn, _params) do
    text(conn, 'Oiii Meu nome é TOM!!!')
  end

end
