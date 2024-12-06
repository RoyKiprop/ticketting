defmodule Ticketting.TicketsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ticketting.Tickets` context.
  """

  @doc """
  Generate a ticket.
  """
  def ticket_fixture(attrs \\ %{}) do
    {:ok, ticket} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone: "some phone",
        quantity: 42,
        total_price: "120.5"
      })
      |> Ticketting.Tickets.create_ticket()

    ticket
  end
end
