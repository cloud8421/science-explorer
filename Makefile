import:
	dropdb science-explorer-items && createdb science-explorer-items && mix ecto.migrate ScienceExplorer.Repo && mix import
