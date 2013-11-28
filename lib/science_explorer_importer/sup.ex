defmodule ScienceExplorerImporter.Sup do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [ worker(ScienceExplorerImporter.Dynamo, []), worker(ScienceExplorerImporter.Repo, []) ]
    supervise(tree, strategy: :one_for_all)
  end
end
