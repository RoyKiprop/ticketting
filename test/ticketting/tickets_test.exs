defmodule Ticketting.TicketsTest do
  use Ticketting.DataCase

  alias Ticketting.Tickets

  describe "tickets" do
    alias Ticketting.Tickets.Ticket

    import Ticketting.TicketsFixtures

    @invalid_attrs %{name: nil, phone: nil, email: nil, total_price: nil, quantity: nil}

    test "list_tickets/0 returns all tickets" do
      ticket = ticket_fixture()
      assert Tickets.list_tickets() == [ticket]
    end

    test "get_ticket!/1 returns the ticket with given id" do
      ticket = ticket_fixture()
      assert Tickets.get_ticket!(ticket.id) == ticket
    end

    test "create_ticket/1 with valid data creates a ticket" do
      valid_attrs = %{name: "some name", phone: "some phone", email: "some email", total_price: "120.5", quantity: 42}

      assert {:ok, %Ticket{} = ticket} = Tickets.create_ticket(valid_attrs)
      assert ticket.name == "some name"
      assert ticket.phone == "some phone"
      assert ticket.email == "some email"
      assert ticket.total_price == Decimal.new("120.5")
      assert ticket.quantity == 42
    end

    test "create_ticket/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tickets.create_ticket(@invalid_attrs)
    end

    test "update_ticket/2 with valid data updates the ticket" do
      ticket = ticket_fixture()
      update_attrs = %{name: "some updated name", phone: "some updated phone", email: "some updated email", total_price: "456.7", quantity: 43}

      assert {:ok, %Ticket{} = ticket} = Tickets.update_ticket(ticket, update_attrs)
      assert ticket.name == "some updated name"
      assert ticket.phone == "some updated phone"
      assert ticket.email == "some updated email"
      assert ticket.total_price == Decimal.new("456.7")
      assert ticket.quantity == 43
    end

    test "update_ticket/2 with invalid data returns error changeset" do
      ticket = ticket_fixture()
      assert {:error, %Ecto.Changeset{}} = Tickets.update_ticket(ticket, @invalid_attrs)
      assert ticket == Tickets.get_ticket!(ticket.id)
    end

    test "delete_ticket/1 deletes the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{}} = Tickets.delete_ticket(ticket)
      assert_raise Ecto.NoResultsError, fn -> Tickets.get_ticket!(ticket.id) end
    end

    test "change_ticket/1 returns a ticket changeset" do
      ticket = ticket_fixture()
      assert %Ecto.Changeset{} = Tickets.change_ticket(ticket)
    end
  end
end
