defmodule MetricsHunter.Consumer do
  alias MetricsHunter.Producer
  alias MetricsHunter.Worker
  use GenStage

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state)
  end

  def init(initial_state) do
    sub_opts = [{Producer, min_demand: 0, max_demand: 1}]
    {:consumer, initial_state, subscribe_to: sub_opts}
  end

  def handle_events(events, _from, state) do
    Enum.each(events, fn source ->
      Worker.scrape_metrics(to_string(source))
    end)

    {:noreply, [], state}
  end
end
