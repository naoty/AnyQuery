# AnyQuery

[![Build Status](https://travis-ci.org/naoty/AnyQuery.svg?branch=master)](https://travis-ci.org/naoty/AnyQuery)

## Usage

### AnyQuery

`AnyQuery` is a representation of queries for anything. A `AnyQuery` can be transformed into a `NSPredicate` and a `Dictionary`.

```swift
let query = AnyQuery.equal(key: "id", value: 1)
query.predicate   //=> NSPredicate(format: "id == 1")
query.dictionary  //=> ["id": 1]
```

`AnyQuery` has below types. Each types can be transformed into proper objects

* `equal(key:value:)`
* `notEqual(key:value:)`
* `greaterThan(key:value:)`
* `greaterThanOrEqual(key:value:)`
* `lessThan(key:value:)`
* `lessThanOrEqual(key:value:)`
* `in(key:values:)`
* `between(key:lhs:rhs:)`

`AnyQuery` also can be combined with another one with `&&` or `||` operator.

```swift
let query: AnyQuery = .equal(key: "id", value: 1) && .equal(key: "name", value: "naoty")
query.predicate   //=> NSPredicate(format: "id == 1 AND name == naoty")
query.dictionary  //=> ["id": 1, "name": "naoty"]
```

### AnySort

`AnySort` is a representation of sorts for anything. A `AnySort` can be transformed into `[NSSortDescriptor]` and a dictionary.

```swift
let sort = AnySort.ascending(key: "id")
sort.sortDescriptors  //=> [NSSortDescriptor(key: "id", ascending: true)]
sort.dictionary       //=> ["sort": ["id"]]
```

Like `AnyQuery`, `AnySort` also can be combined with another one with `>` operator.

```swift
let sort: AnySort = .ascending(key: "name") > .descending(key: "age")
sort.sortDescriptors  //=> [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "age", ascending: false)]
sort.dictionary       //=> ["sort": ["name", "-age"]]
```

## Installation

### Carthage

```rb
github "naoty/AnyQuery"
```

### CocoaPods

```rb
pod "AnyQuery"
```

## Author

[naoty](https://github.com/naoty)

