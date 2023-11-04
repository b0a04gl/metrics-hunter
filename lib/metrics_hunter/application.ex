defmodule MetricsHunter.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do

    children = [
      MetricsHunter.Producer,
      Supervisor.child_spec(MetricsHunter.Consumer, id: :consumer_a),
      Supervisor.child_spec(MetricsHunter.Consumer, id: :consumer_b)
    ]

    opts = [strategy: :one_for_one, name: MetricsHunter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
