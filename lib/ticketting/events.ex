defmodule Ticketting.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Ticketting.Repo

  alias Ticketting.Events.Event
  alias Ticketting.TicketTypes.TicketType
  alias Ticketting.Accounts.{Role, User}

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """

  Returns the list of events or specific users

  """

  def list_user_events(user) do
    user_role =
      User
      |> Repo.get(user.id)
      |> Repo.preload(:role)

    case user_role.role.slug do
      "super-admin" ->
        Repo.all(Event)

      "admin" ->
        Repo.all(
          from e in Event,
            where: e.user_id == ^user.id
        )
    end
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  def get_event_by_slug(slug) do
    query =
      from e in Event,
        left_join: tt in TicketType,
        on: tt.event_id == e.id,
        where: tt.quantity_available > 0,
        where: e.slug == ^slug,
        preload: [ticket_types: tt]

    Repo.one(query)
  end

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  def upcoming_events do
    Repo.all(
      from e in Event,
        where: e.date > ^DateTime.utc_now() and e.is_active == true,
        order_by: [asc: e.date],
        limit: 4
    )
  end

  def active_events do
    Repo.all(
      from e in Event,
        where: e.is_active == true,
        order_by: [asc: e.date]
    )
  end

  def random_events(event_id) do
    Repo.all(
      from e in Event,
        where: e.id != ^event_id,
        where: e.is_active == true,
        limit: 3,
        order_by: fragment("RANDOM()")
    )
  end

  def list_user_events(user_id) do
    Event
    |> where([e], e.user_id == ^user_id)
    |> Repo.all()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{data: %Event{}}

  """
  def change_event(%Event{} = event, attrs \\ %{}) do
    Event.changeset(event, attrs)
  end

  alias Ticketting.Events.EventOrganizer

  @doc """
  Returns the list of event_organizers.

  ## Examples

      iex> list_event_organizers()
      [%EventOrganizer{}, ...]

  """
  def list_event_organizers do
    Repo.all(EventOrganizer)
  end

  @doc """
  Gets a single event_organizer.

  Raises `Ecto.NoResultsError` if the Event organizer does not exist.

  ## Examples

      iex> get_event_organizer!(123)
      %EventOrganizer{}

      iex> get_event_organizer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_organizer!(id), do: Repo.get!(EventOrganizer, id)

  @doc """
  Creates a event_organizer.

  ## Examples

      iex> create_event_organizer(%{field: value})
      {:ok, %EventOrganizer{}}

      iex> create_event_organizer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_organizer(attrs \\ %{}) do
    %EventOrganizer{}
    |> EventOrganizer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_organizer.

  ## Examples

      iex> update_event_organizer(event_organizer, %{field: new_value})
      {:ok, %EventOrganizer{}}

      iex> update_event_organizer(event_organizer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_organizer(%EventOrganizer{} = event_organizer, attrs) do
    event_organizer
    |> EventOrganizer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event_organizer.

  ## Examples

      iex> delete_event_organizer(event_organizer)
      {:ok, %EventOrganizer{}}

      iex> delete_event_organizer(event_organizer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_organizer(%EventOrganizer{} = event_organizer) do
    Repo.delete(event_organizer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_organizer changes.

  ## Examples

      iex> change_event_organizer(event_organizer)
      %Ecto.Changeset{data: %EventOrganizer{}}

  """
  def change_event_organizer(%EventOrganizer{} = event_organizer, attrs \\ %{}) do
    EventOrganizer.changeset(event_organizer, attrs)
  end
end
