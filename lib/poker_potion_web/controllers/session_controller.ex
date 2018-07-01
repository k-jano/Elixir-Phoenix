defmodule PokerPotionWeb.SessionController do
    use PokerPotionWeb, :controller

    #alias PokerPotion.Repo
    alias PokerPotion.Accounts.{User, Auth}

    def new(conn, _params) do
        render conn, "new.html"
    end

    def create(conn, params) do
        case Auth.login(params) do
            {:ok, user} -> 
                conn
                |> put_session(:user, user.name)
                |> put_flash(:info, "Congrats You Logged in")
                |> redirect(to: "/")
            :error ->
                conn
                |> put_flash(:error, "Incorrect email or password")
                |> render("new.html")    
        end
    end

    def delete(conn, _params) do
        conn
        |> delete_session(:user)
        |> put_flash(:info, "Logged Out GTFO")
        |> redirect(to: "/")
    end
end