defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    text(conn, Hello.hello())
  end
end
