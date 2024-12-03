defmodule Ticketting.TicketTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ticketting.TicketTypes` context.
  """

  @doc """
  Generate a ticket_type.
  """
  def ticket_type_fixture(attrs \\ %{}) do
    {:ok, ticket_type} =
      attrs
      |> Enum.into(%{
        activate_on: ~U[2024-12-02 07:29:00Z],
        deactivate_on: ~U[2024-12-02 07:29:00Z],
        description: "some description",
        name: "some name",
        price: "120.5",
        quantity_available: 42,
        quantity_sold: 42
      })
      |> Ticketting.TicketTypes.create_ticket_type()

    ticket_type
  end

  @doc """
  Generate a ticket_type.
  """
  def ticket_type_fixture(attrs \\ %{}) do
    {:ok, ticket_type} =
      attrs
      |> Enum.into(%{
        activate_on: ~U[2024-12-02 10:39:00Z],
        deactivate_on: ~U[2024-12-02 10:39:00Z],
        description: "some description",
        name: "some name",
        price: "120.5",
        quantity_available: 42,
        quantity_sold: 42
      })
      |> Ticketting.TicketTypes.create_ticket_type()

    ticket_type
  end
end
