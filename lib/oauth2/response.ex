defmodule ExOauth2.Response do

  defstruct status_code: nil, body: nil, headers: %{}

  @type t :: %__MODULE__{status_code: integer, body: binary, headers: map}

  def new(status_code, headers, body) do
    content_type = ExOauth2.Util.content_type(headers)
    %__MODULE__{
      status_code: status_code,
      headers: headers,
      body: decode_response_body(body, content_type)
    }
  end

  defp decode_response_body(body, "application/json"), do:
    Poison.decode!(body)
  defp decode_response_body(body, "application/x-www-form-urlencoded"), do:
    Plug.Conn.Query.decode(body)
  defp decode_response_body(body, _), do: body
end
