defmodule ExMonApiWeb.TrainersView do
  use ExMonApiWeb, :view

  def render("create.json", %{trainer: trainer}) do
    %{
      message: "Trainer created!"
    }
  end
end
