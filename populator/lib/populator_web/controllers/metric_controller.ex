defmodule PopulatorWeb.MetricController do
  use PopulatorWeb, :controller

  def index(conn, _params) do
    # Generate random metrics data (you can customize this as needed)
    random_metrics = [
      %{"name" => "response_time", "value" => :rand.uniform(100)},
      %{"name" => "throughput", "value" => :rand.uniform(100)},
      %{"name" => "cpu_usage", "value" => :rand.uniform(100)*2.2}
    ]

    json(conn, random_metrics)
  end

end
