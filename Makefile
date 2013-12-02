dev_setup:
	dropdb --if-exists science-explorer-items-dev && createdb science-explorer-items-dev && mix ecto.migrate ScienceExplorer.Repo
test_setup:
	dropdb --if-exists science-explorer-items-test && createdb science-explorer-items-test && MIX_ENV=test mix ecto.migrate ScienceExplorer.Repo
prod_setup:
	dropdb --if-exists science-explorer-items-prod && createdb science-explorer-items-prod && mix ecto.migrate ScienceExplorer.Repo
