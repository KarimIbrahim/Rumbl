defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true

  import Phoenix.Template

  test "renders index.html", %{conn: _conn} do
    videos = [
      %Rumbl.Multimedia.Video{id: "1", title: "dogs"},
      %Rumbl.Multimedia.Video{id: "2", title: "cats"}
    ]

    content = render_to_string(RumblWeb.VideoHTML, "index", "html", videos: videos)

    assert String.contains?(content, "Listing Videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: _conn} do
    changeset = Rumbl.Multimedia.change_video(%Rumbl.Multimedia.Video{})
    categories = [%Rumbl.Multimedia.Category{id: 123, name: "cats"}]

    content =
      render_to_string(RumblWeb.VideoHTML, "new", "html",
        changeset: changeset,
        categories: categories
      )

    assert String.contains?(content, "New Video")
  end
end
