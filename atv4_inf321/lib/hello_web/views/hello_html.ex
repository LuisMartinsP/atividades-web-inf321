defmodule HelloWeb.HelloHTML do
  use HelloWeb, :html

  embed_templates "../templates/hello_html/*"
end
