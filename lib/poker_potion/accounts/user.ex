defmodule PokerPotion.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PokerPotion.Accounts.Encrypter

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    # VIRTUAL
    field :potential_password, :string, virtual: true
    field :potential_password_confirmation, :string, virtual: true

    timestamps()
  end

  @required_fields ~w(email name potential_password)
  @optional_fields ~w()

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :potential_password])
    |> validate_required([:name, :email, :potential_password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:potential_password, min: 8)
    |> validate_confirmation(:potential_password)
    |> unique_constraint(:name)
    |> unique_constraint(:email)
    |> encrypt_password
  end

  defp encrypt_password(changeset) do
    pwd = get_change(changeset, :potential_password)
    if pwd do
      hash = Encrypter.hash(pwd)
      put_change(changeset, :password, hash)
    else
      changeset
    end
  end

end
