# ScienceExplorer

Small webapp to browse the London Science Museum items collection.

Data is available at: <http://api.sciencemuseum.org.uk/documentation/collections/>.

Being built with Elixir, Dynamo and Postgresql.

Assuming all dependencies are met:

    cp .envrc.sample .envrc

Customize `.envrc` with your database connection data.

    source .envrc
    mix deps.get
    make import
    enmix server

Alternatively, your env can be better managed with [Direnv](https://github.com/zimbatm/direnv).

## Converting the original files

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
