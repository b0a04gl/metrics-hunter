defmodule MetricsHunter.Consumer do
  alias MetricsHunter.Producer
  alias MetricsHunter.Worker
  alias MetricsHunter.Myconnection

  use GenStage
  require Logger


  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state)
  end

  def init(initial_state) do
    Logger.info("PageConsumer init")
    sub_opts = [{Producer, min_demand: 0, max_demand: 1}]
    {:consumer, initial_state, subscribe_to: sub_opts}
  end

  def handle_events(events, _from, state) do
    Logger.info("PageConsumer received #{inspect(events)}")

    response =
      events
      |> Enum.map(fn source ->
        Worker.scrape_metrics(to_string(source))
      end)
    update_metrics(response)
    {:noreply, [], state}
  end

  defp update_metrics(_data) do
      

  end
end

### MetricsHunter.Producer.server_actuators(["http://localhost:4000/metrics"])
