# Backend

Backend repo for the [Menu app](https://github.com/Beyarz/Menu-frontend), using rails api mode.
The data loaded into the db is not real and only used for prototyping.
The indexing is done through Searchkick & Opensearch (fork of Elasticsearch).

## Requirements

- Ruby 3.1.2
- Rails 7
- Docker

## Getting started

`chmod +x bin/docker-entrypoint.sh`

### Local rails development

```
bundle
rails db:migrate
rails db:seed
rails server
```

### Remote container development (recommended for Windows)

`docker compose -f docker-compose.dev.yml up`

### Development notes

See [dev.md](dev.md)

## Troubleshoot

`exception": "#<Searchkick::MissingIndexError: Index missing - run Menu.reindex>"`

Run: `rake searchkick:reindex CLASS=Menu` inside the container or in your terminal

## Improvement

- Add compose service for production
- Write proper tests
