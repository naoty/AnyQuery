# AnyQuery

[![Build Status](https://travis-ci.org/naoty/AnyQuery.svg?branch=master)](https://travis-ci.org/naoty/AnyQuery)

## Usage

### AnyQuery

`AnyQuery` is a representation of queries for anything. A `AnyQuery` can be transformed into a `NSPredicate` and a `Dictionary`.

```swift
let query = AnyQuery.Equal(key: "id", value: 1)
query.predicate   //=> NSPredicate(format: "id == 1")
query.dictionary  //=> ["id": 1]
```

`AnyQuery` has below types. Each types can be transformed into proper objects

* `Equal(key:value:)`
* `NotEqual(key:value:)`
* `GreaterThan(key:value:)`
* `GreaterThanOrEqual(key:value:)`
* `LessThan(key:value:)`
* `LessThanOrEqual(key:value:)`
* `In(key:values:)`
* `Between(key:lhs:rhs:)`

`AnyQuery` also can be combined with another one with `&&` or `||` operator.

```swift
let equal1 = AnyQuery.Equal(key: "id", value: 1)
let equal2 = AnyQuery.Equal(key: "name", value: "naoty")
let query = equal1 && equal2
query.predicate   //=> NSPredicate(format: "id == 1 AND name == naoty")
query.dictionary  //=> ["id": 1, "name": "naoty"]
```

### AnySort

`AnySort` is a representation of sorts for anything. A `AnySort` can be transformed into `[NSSortDescriptor]` and a dictionary.

```swift
let sort = AnySort.Ascending(key: "id")
sort.sortDescriptors  //=> [NSSortDescriptor(key: "id", ascending: true)]
sort.dictionary       //=> ["sort": ["id"]]
```

Like `AnyQuery`, `AnySort` also can be combined with another one with `+` operator.

```swift
let sort1 = AnySort.Ascending(key: "name")
let sort2 = AnySort.Descending(key: "age")
let sort = sort1 + sort2
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

