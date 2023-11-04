defmodule MetricsHunter.Worker do
  alias HTTPoison.Base
  require Logger


  def scrape_metrics(base_url) do
    url = "#{base_url}/metrics"

    case Base.request(:get,url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Logger.info("Metrics successfully scraped.")

      {:ok, %HTTPoison.Response{status_code: code}} ->
        Logger.warn("Received status code #{code} while scraping metrics.")
        {:error, "Received status code #{code}"}

      {:error, reason} ->
        Logger.error("Error while scraping metrics: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
