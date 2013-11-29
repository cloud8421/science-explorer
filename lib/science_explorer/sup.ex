defmodule ScienceExplorer.Sup do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [ worker(ScienceExplorer.Dynamo, []), worker(ScienceExplorer.Repo, []) ]
    supervise(tree, strategy: :one_for_all)
  end
end
