defmodule Ticketting.TicketTypesTest do
  use Ticketting.DataCase

  alias Ticketting.TicketTypes

  describe "ticket_types" do
    alias Ticketting.TicketTypes.TicketType

    import Ticketting.TicketTypesFixtures

    @invalid_attrs %{name: nil, description: nil, price: nil, quantity_sold: nil, quantity_available: nil, activate_on: nil, deactivate_on: nil}

    test "list_ticket_types/0 returns all ticket_types" do
      ticket_type = ticket_type_fixture()
      assert TicketTypes.list_ticket_types() == [ticket_type]
    end

    test "get_ticket_type!/1 returns the ticket_type with given id" do
      ticket_type = ticket_type_fixture()
      assert TicketTypes.get_ticket_type!(ticket_type.id) == ticket_type
    end

    test "create_ticket_type/1 with valid data creates a ticket_type" do
      valid_attrs = %{name: "some name", description: "some description", price: "120.5", quantity_sold: 42, quantity_available: 42, activate_on: ~U[2024-12-02 07:29:00Z], deactivate_on: ~U[2024-12-02 07:29:00Z]}

      assert {:ok, %TicketType{} = ticket_type} = TicketTypes.create_ticket_type(valid_attrs)
      assert ticket_type.name == "some name"
      assert ticket_type.description == "some description"
      assert ticket_type.price == Decimal.new("120.5")
      assert ticket_type.quantity_sold == 42
      assert ticket_type.quantity_available == 42
      assert ticket_type.activate_on == ~U[2024-12-02 07:29:00Z]
      assert ticket_type.deactivate_on == ~U[2024-12-02 07:29:00Z]
    end

    test "create_ticket_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TicketTypes.create_ticket_type(@invalid_attrs)
    end

    test "update_ticket_type/2 with valid data updates the ticket_type" do
      ticket_type = ticket_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", price: "456.7", quantity_sold: 43, quantity_available: 43, activate_on: ~U[2024-12-03 07:29:00Z], deactivate_on: ~U[2024-12-03 07:29:00Z]}

      assert {:ok, %TicketType{} = ticket_type} = TicketTypes.update_ticket_type(ticket_type, update_attrs)
      assert ticket_type.name == "some updated name"
      assert ticket_type.description == "some updated description"
      assert ticket_type.price == Decimal.new("456.7")
      assert ticket_type.quantity_sold == 43
      assert ticket_type.quantity_available == 43
      assert ticket_type.activate_on == ~U[2024-12-03 07:29:00Z]
      assert ticket_type.deactivate_on == ~U[2024-12-03 07:29:00Z]
    end

    test "update_ticket_type/2 with invalid data returns error changeset" do
      ticket_type = ticket_type_fixture()
      assert {:error, %Ecto.Changeset{}} = TicketTypes.update_ticket_type(ticket_type, @invalid_attrs)
      assert ticket_type == TicketTypes.get_ticket_type!(ticket_type.id)
    end

    test "delete_ticket_type/1 deletes the ticket_type" do
      ticket_type = ticket_type_fixture()
      assert {:ok, %TicketType{}} = TicketTypes.delete_ticket_type(ticket_type)
      assert_raise Ecto.NoResultsError, fn -> TicketTypes.get_ticket_type!(ticket_type.id) end
    end

    test "change_ticket_type/1 returns a ticket_type changeset" do
      ticket_type = ticket_type_fixture()
      assert %Ecto.Changeset{} = TicketTypes.change_ticket_type(ticket_type)
    end
  end

  describe "ticket_types" do
    alias Ticketting.TicketTypes.TicketType

    import Ticketting.TicketTypesFixtures

    @invalid_attrs %{name: nil, description: nil, price: nil, quantity_sold: nil, quantity_available: nil, activate_on: nil, deactivate_on: nil}

    test "list_ticket_types/0 returns all ticket_types" do
      ticket_type = ticket_type_fixture()
      assert TicketTypes.list_ticket_types() == [ticket_type]
    end

    test "get_ticket_type!/1 returns the ticket_type with given id" do
      ticket_type = ticket_type_fixture()
      assert TicketTypes.get_ticket_type!(ticket_type.id) == ticket_type
    end

    test "create_ticket_type/1 with valid data creates a ticket_type" do
      valid_attrs = %{name: "some name", description: "some description", price: "120.5", quantity_sold: 42, quantity_available: 42, activate_on: ~U[2024-12-02 10:39:00Z], deactivate_on: ~U[2024-12-02 10:39:00Z]}

      assert {:ok, %TicketType{} = ticket_type} = TicketTypes.create_ticket_type(valid_attrs)
      assert ticket_type.name == "some name"
      assert ticket_type.description == "some description"
      assert ticket_type.price == Decimal.new("120.5")
      assert ticket_type.quantity_sold == 42
      assert ticket_type.quantity_available == 42
      assert ticket_type.activate_on == ~U[2024-12-02 10:39:00Z]
      assert ticket_type.deactivate_on == ~U[2024-12-02 10:39:00Z]
    end

    test "create_ticket_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TicketTypes.create_ticket_type(@invalid_attrs)
    end

    test "update_ticket_type/2 with valid data updates the ticket_type" do
      ticket_type = ticket_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", price: "456.7", quantity_sold: 43, quantity_available: 43, activate_on: ~U[2024-12-03 10:39:00Z], deactivate_on: ~U[2024-12-03 10:39:00Z]}

      assert {:ok, %TicketType{} = ticket_type} = TicketTypes.update_ticket_type(ticket_type, update_attrs)
      assert ticket_type.name == "some updated name"
      assert ticket_type.description == "some updated description"
      assert ticket_type.price == Decimal.new("456.7")
      assert ticket_type.quantity_sold == 43
      assert ticket_type.quantity_available == 43
      assert ticket_type.activate_on == ~U[2024-12-03 10:39:00Z]
      assert ticket_type.deactivate_on == ~U[2024-12-03 10:39:00Z]
    end

    test "update_ticket_type/2 with invalid data returns error changeset" do
      ticket_type = ticket_type_fixture()
      assert {:error, %Ecto.Changeset{}} = TicketTypes.update_ticket_type(ticket_type, @invalid_attrs)
      assert ticket_type == TicketTypes.get_ticket_type!(ticket_type.id)
    end

    test "delete_ticket_type/1 deletes the ticket_type" do
      ticket_type = ticket_type_fixture()
      assert {:ok, %TicketType{}} = TicketTypes.delete_ticket_type(ticket_type)
      assert_raise Ecto.NoResultsError, fn -> TicketTypes.get_ticket_type!(ticket_type.id) end
    end

    test "change_ticket_type/1 returns a ticket_type changeset" do
      ticket_type = ticket_type_fixture()
      assert %Ecto.Changeset{} = TicketTypes.change_ticket_type(ticket_type)
    end
  end
end
