defmodule MetricsHunter.Worker do
  use HTTPoison.Base
  require Logger

  @spec scrape_metrics(binary()) :: {:error, <<_::64, _::_*8>>} | {:ok, any()}
  def scrape_metrics(endpoint) do
    response = get(endpoint)
    handle_response(response)
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    case Poison.decode(body) do
      {:ok, data} ->
        data

      {:error, reason} ->
        Logger.error("JSON decoding error: #{inspect(reason)}")
        []
    end
  end

  defp handle_response({:ok, %{status_code: status_code, body: body}}) do
    {:error, "API request failed with status #{status_code}: #{body}"}
  end

  defp handle_response({:error, reason}) do
    {:error, "API request failed: #{inspect(reason)}"}
  end
end


#MetricsHunter.Producer.server_actuators(["http://localhost:4000/metrics"])
