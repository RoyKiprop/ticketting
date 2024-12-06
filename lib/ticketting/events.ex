defmodule Ticketting.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Ticketting.Repo

  alias Ticketting.Events.Event
  alias Ticketting.TicketTypes.TicketType

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

    Repo.one!(query)
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
    Event
    |> where([e], e.date > ^DateTime.utc_now() and e.is_active == true)
    |> order_by([e], asc: e.date)
    |> Repo.all()
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
end
