defmodule PokerPotion.Accounts.Encrypter do
  alias Comeonin.Bcrypt

  def hash(passowrd), do: Bcrypt.hashpwsalt(passowrd)
  def validate(passowrd), do: Bcrypt.checkpw(passowrd)

end