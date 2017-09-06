# Formulae
> An API for building custom forms.

## Installing

- Clone this repo
- Install [rbenv](https://github.com/rbenv/rbenv/blob/master/README.md#installation)
- `bundle install`

## Running the tests

```sh
bundle exec rspec
```

## API Documentation

### Generating it

We use
[rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation) to
write acceptance tests for the API. It auto-generates documentation in JSON
format for each test, to build a documentation suite for the API. To generate
these JSON files, run:

```sh
rake docs:generate
```

We're using [apitome](https://github.com/jejacks0n/apitome) to provide the
ability to view the API documentation in a nice fashion. You can see it by
visiting <http://localhost:3000/api/docs>.

### Viewing it

## Linter

We are using [rubocop](https://github.com/bbatsov/rubocop), to see all the rules we are using, please check the [.rubocop.yml](.rubocop.yml) file.

## License

Formulae is MIT Licensed.
