defmodule RumblWeb.UserHTML do
  use RumblWeb, :html

  alias Rumbl.Accounts

  embed_templates "user/*"

  attr :user, :map, required: true

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def user(assigns) do
    ~H"""
    <b>{first_name(@user)}</b> ({@user.id})
    """
  end
end
