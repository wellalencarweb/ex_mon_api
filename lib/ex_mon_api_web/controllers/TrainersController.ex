defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, conn), do: error

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonApi.delete_trainer()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_response({:error, _reason} = error, conn), do: error
end
