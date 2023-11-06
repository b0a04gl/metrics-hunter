defmodule PopulatorWeb.MetricView do
  use PopulatorWeb, :view
  alias PopulatorWeb.MetricView

  def render("index.json", %{metrics: metrics}) do
    %{data: render_many(metrics, MetricView, "metric.json")}
  end

  def render("show.json", %{metric: metric}) do
    %{data: render_one(metric, MetricView, "metric.json")}
  end

  def render("metric.json", %{metric: metric}) do
    %{id: metric.id,
      name: metric.name,
      value: metric.value}
  end
end
