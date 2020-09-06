defmodule LiftsWeb.SetView do
  use LiftsWeb, :view
  alias LiftsWeb.SetView

  def render("show.json", %{set: set}) do
    set
    |> render_one(SetView, "set.json")
  end

  def render("day_sets.json", %{day_sets: %{day: day, sets: sets}}) do
    %{
      day: day,
      sets:
        sets
        |> render_many(SetView, "set_map.json")
    }
  end

  def render("set.json", %{set: set}) do
    set_to_render = %{
      id: set.id,
      order: set.order,
      repetitions: set.repetitions,
      is_weighted: set.is_weighted
    }

    case set.is_weighted do
      true -> Map.put_new(set_to_render, :weight, set.weight)
      _ -> set_to_render
    end
  end

  def render("set_map.json", %{set: set}) do
    set_to_render = %{
      id: set["id"],
      order: set["order"],
      repetitions: set["repetitions"],
      is_weighted: set["is_weighted"]
    }

    case set["is_weighted"] do
      true -> %{set | "weight" => set["weight"]}
      _ -> set_to_render
    end
  end
end
