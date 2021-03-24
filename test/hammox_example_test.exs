defmodule HammoxExampleTest do
  use ExUnit.Case

  import Hammox

  test "get" do
    defmock(HTTPClientMock, for: HammoxBehaviour)

    expect(HTTPClientMock, :get, fn _ ->
      {:ok, mock_response()}
    end)

    assert {:ok, response} = HammoxExample.get("https://google.com", HTTPClientMock)
    assert response == mock_response()
  end

  def mock_response do
    %Finch.Response{
      body:
        "<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>301 Moved</TITLE></HEAD><BODY>\n<H1>301 Moved</H1>\nThe document has moved\n<A HREF=\"https://www.google.com/\">here</A>.\r\n</BODY></HTML>\r\n",
      headers: [],
      status: 301
    }
  end
end

defmodule RealHTTPClientTest do
  use ExUnit.Case

  import Hammox

  test "get/1 returns Finch Response" do
    get_1 = Hammox.protect({HTTPClient, :get, 1}, HammoxBehaviour)
    assert {:ok, %Finch.Response{}} = get_1.("https://google.com")
  end
end
