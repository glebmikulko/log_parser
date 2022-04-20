# Log parser

## Tests and installation

This app uses Ruby 3.1.2 so make sure you have it on your machine. To run script

```sh
bundle
./parser.rb webserver.log
```

To run unit and integration tests

```sh
rspec
```

Finally, to check compliance with linters

```
rubocop
reek
```

## Design

The design is based on a Presentation, Domain, and Data approach. Each layer will be described separately. Let's start with Data Layer.

### Data layer

To store statistics about page views `Hash` structure looks like the best choice. Hash supports the uniqueness of its keys. Lookup and insert operations are very cheap on hash, so we can take advantage of that. We store pages (strings) as hash keys.

For the first part of the task (list of pages with total views), the hash values are integers. Here we only need to save the total number of visits for each page. This structure is represented by `HashOfIntegers` Ruby class.

For the second part of the task (unique page views), the hash values are Sets. `Set` also supports the uniqueness of its elements and quickly inserts new items. We store unique IP addresses in `Set` (check `HashOfSets` class).

On this layer, we also have statistics collectors `StatCollector` that use one of the above-described structures to gather necessary information. It provides a unified interface to store statistics regardless of the underlying data structure.

### Domain layer

On this layer, we have our business logic. The main entity here is `LogProcessor` class that iterates over log lines and fills in statistics collectors with data. Under the hood, it uses `LogReader` to validate, access, and read a file.

### Presentation layer

Here we have several classes (end with `Presenter`) that know how to display statistics or errors to the end user.

![DESIGN][design]

[design]: docs/design.drawio.png "DESIGN"