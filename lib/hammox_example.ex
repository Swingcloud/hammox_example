defmodule HammoxBehaviour do
  alias Finch.Response
  @callback get(url :: String.t()) :: {:ok, %Response{}}
end

defmodule HTTPClient do
  def get(url) do
    :get
    |> Finch.build(url)
    |> Finch.request(HTTPClient)
  end
end

defmodule HammoxExample do
  @behaviour HammoxBehaviour

  @impl true
  def get(url, http_client \\ HTTPClient) do
    http_client.get(url)
  end
end
