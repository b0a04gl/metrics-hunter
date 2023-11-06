defmodule MetricsHunter.Producer do
  use GenStage
  require Logger

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

# Update the init function with 5-Changing the buffer size here
  def init(initial_state) do
    Logger.info("PageProducer init")
    {:producer, initial_state}
  end

  def handle_demand(demand, state) do
    Logger.info("PageProducer received demand for #{demand} pages")
    events = []
    {:noreply, events, state}
  end

  def server_actuators(actuators) when is_list(actuators) do
    GenStage.cast(__MODULE__, {:actuators, actuators})
  end

  def handle_cast({:actuators, actuators}, state) do
    {:noreply, actuators, state}
  end
end
