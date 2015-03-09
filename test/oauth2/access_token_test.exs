defmodule ExOauth2.AccessTokenTest do
  use ExUnit.Case, async: true

  alias ExOauth2.AccessToken

  test "expires?" do
    assert AccessToken.expires?(%AccessToken{expires_at: 0})
    refute AccessToken.expires?(%AccessToken{expires_at: nil})
  end

  test "expired?" do
    assert AccessToken.expired?(%AccessToken{expires_at: 0})
    refute AccessToken.expired?(%AccessToken{expires_at: nil})
  end

  test "expires_in" do
    assert AccessToken.expires_at(nil) == nil
    assert AccessToken.expires_at(3600) == ExOauth2.Util.unix_now + 3600
  end
end
