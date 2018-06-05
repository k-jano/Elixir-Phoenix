defmodule PokerPotion.Accounts.Auth do
    alias PokerPotion.Accounts.{Encrypter, User}
    alias PokerPotion.Repo

    def login(params) do
        user = Repo.get_by(User, email: String.downcase(params["email"]))
        case authenticate(user, params["potential_password"]) do
            true -> {:ok, user}
            _ -> :error
        end
    end

    defp authenticate(user, password) do
        case user do
            nil  -> false
            _ -> Encrypter.validate(password, user.password)
        end
    end

    def logged_in?(conn) do
        case Plug.Conn.get_session(conn, :user) do
            nil -> false
            _ -> true
        end
    end
end