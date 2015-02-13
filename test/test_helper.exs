defmodule EdgeBuilder.Test do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExSpec
    end
  end

  setup do
    Ecto.Adapters.SQL.restart_test_transaction(EdgeBuilder.Repo)
    :ok
  end

  setup_all do
    Ecto.Adapters.SQL.begin_test_transaction(EdgeBuilder.Repo, [])
    on_exit fn -> Ecto.Adapters.SQL.rollback_test_transaction(EdgeBuilder.Repo, []) end
    :ok
  end
end

defmodule EdgeBuilder.ControllerTest do
  use ExUnit.CaseTemplate

  using do
    quote do
      use EdgeBuilder.Test
      use Plug.Test

      def request(verb, path) do
        conn(verb, path) |> EdgeBuilder.Endpoint.call([])
      end
    end
  end
end

ExUnit.start
