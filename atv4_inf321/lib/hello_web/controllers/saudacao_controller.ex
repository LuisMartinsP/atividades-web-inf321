defmodule HelloWeb.SaudacaoController do
  use HelloWeb, :controller

  def saudacao(conn, %{"lang" => "en", "name" => nome}) do
    render(conn, :saudacao, lang: "Hello, ", name: String.capitalize(nome))
  end

  def saudacao(conn, %{"lang" => "pt", "name" => nome}) do
    render(conn, :saudacao, lang: "Olá, ", name: String.capitalize(nome))
  end
end
