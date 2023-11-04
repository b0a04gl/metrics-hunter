defmodule MetricsHunter.Producer do
  use GenStage

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

# Update the init function with 5-Changing the buffer size here
  def init(initial_state) do
    {:producer, initial_state}
  end

  def handle_demand(_demand, state) do
    events = []
    {:noreply, events, state}
  end

  def scrape_pages(pages) when is_list(pages) do
    GenStage.cast(__MODULE__, {:pages, pages})
  end

  def handle_cast({:pages, pages}, state) do
    {:noreply, pages, state}
  end
end
