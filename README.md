# ScienceExplorer

Small webapp to browse the London Science Museum items collection.

Data is available at: <http://api.sciencemuseum.org.uk/documentation/collections/> in csv format.

Being built with Elixir, Dynamo and Postgresql.

Assuming all dependencies are met:

    cp .envrc.sample .envrc

Customize `.envrc` with your database connection data.

    source .envrc
    mix deps.get
    make dev_setup
    mix server

Alternatively, your env can be better managed with [Direnv](https://github.com/zimbatm/direnv).

## Running tests

    make test_setup
    MIX_ENV=test mix test

## Converting the original files

Place any file in `data/` and rename it `items1.csv` (hardcoded for now).

The original dataset is in Latin1, so it needs to be converted to utf-8 before being
imported.

    iconv -f ISO-8859-1 -t UTF-8 data/items1.csv > data/items1-utf8.csv

Resources:

* [Elixir website](http://elixir-lang.org/)
* [Elixir getting started guide](http://elixir-lang.org/getting_started/1.html)
* [Elixir docs](http://elixir-lang.org/docs)
* [Dynamo source code](https://github.com/elixir-lang/dynamo)
* [Dynamo guides](https://github.com/elixir-lang/dynamo#learn-more)
* [Dynamo docs](http://elixir-lang.org/docs/dynamo)
