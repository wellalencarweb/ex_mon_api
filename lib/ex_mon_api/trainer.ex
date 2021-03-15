defmodule ExMonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_params [:name, :password]
  # Como se fosse um pipeline
  def changeset(params) do
    %__MODULE__{}                               # nome da struct
    |> cast(params, @required_params)           # quais parâmetrso quer fazer o cast
    |> validate_required(@required_params)      # quais as validações
    |> validate_length(:password, min: 6)
    |> put_pass_has()
  end

  defp put_pass_has(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_has(changeset), do: changeset
end
