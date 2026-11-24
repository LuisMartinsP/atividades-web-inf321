defmodule Rumbl.Multimedia do
  alias Rumbl.Multimedia.Video

  def list_videos do
    [
      %Video{
        id: "1",
        title: "The Soul of Erlang and Elixir - Saša Jurić",
        url: "https://www.youtube.com/embed/JvBT4XBdoUE"
      },
      %Video{
        id: "2",
        title: "Twitter clone em 15 minutos com LiveView - Chris McCord",
        url: "https://www.youtube.com/embed/MZvmYaFkNJI"
      },
      %Video{
        id: "3",
        title: "Livebook e Elixir - José Valim",
        url: "https://www.youtube.com/embed/pas9WdWIBHs"
      }
    ]
  end

  def get_video(id) do
    Enum.find(list_videos(), fn video -> video.id == id end)
  end
end
