defmodule PopulatorWeb.MetricControllerTest do
  use PopulatorWeb.ConnCase

  alias Populator.Metrics
  alias Populator.Metrics.Metric

  @create_attrs %{
    name: "some name",
    value: 42
  }
  @update_attrs %{
    name: "some updated name",
    value: 43
  }
  @invalid_attrs %{name: nil, value: nil}

  def fixture(:metric) do
    {:ok, metric} = Metrics.create_metric(@create_attrs)
    metric
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all metrics", %{conn: conn} do
      conn = get(conn, Routes.metric_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create metric" do
    test "renders metric when data is valid", %{conn: conn} do
      conn = post(conn, Routes.metric_path(conn, :create), metric: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.metric_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "value" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.metric_path(conn, :create), metric: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update metric" do
    setup [:create_metric]

    test "renders metric when data is valid", %{conn: conn, metric: %Metric{id: id} = metric} do
      conn = put(conn, Routes.metric_path(conn, :update, metric), metric: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.metric_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "value" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, metric: metric} do
      conn = put(conn, Routes.metric_path(conn, :update, metric), metric: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete metric" do
    setup [:create_metric]

    test "deletes chosen metric", %{conn: conn, metric: metric} do
      conn = delete(conn, Routes.metric_path(conn, :delete, metric))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.metric_path(conn, :show, metric))
      end
    end
  end

  defp create_metric(_) do
    metric = fixture(:metric)
    %{metric: metric}
  end
end
