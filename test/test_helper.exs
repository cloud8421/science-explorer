Dynamo.under_test(ScienceExplorer.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule ScienceExplorer.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end

defmodule ScienceExplorer.RepoTestCase do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.Postgres
  alias ScienceExplorer.Repo

  setup do
    :ok = Postgres.begin_test_transaction(Repo)
  end

  teardown do
    :ok = Postgres.rollback_test_transaction(Repo)
  end
end

