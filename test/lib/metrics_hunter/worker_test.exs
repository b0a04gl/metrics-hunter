defmodule MetricsHunter.WorkerTest do
  use ExUnit.Case
  alias MetricsHunter.Worker
  import Mox

  setup do
    {:ok, scraper} = Mox.start_link([])
    {:ok, scraper: scraper}
  end

  test "scrape_metrics successfully retrieves and logs metrics", %{scraper: scraper} do
    base_url = "http://localhost:9090"

    response_body = [%{metric1: 2992.1}]
    response = %HTTPoison.Response{status_code: 200, body: response_body}
    Mox.expect(scraper, :request, fn(:get, unquote(base_url <> "/metrics")) ->
      {:ok, response}
    end)

    {captured_log, _} = capture_log(fn ->
      assert {:ok, _} = Worker.scrape_metrics(base_url)
    end)

    assert String.contains?(captured_log, "Metrics successfully scraped")
  end


end
