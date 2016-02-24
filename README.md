# AnyQuery

## Usage

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
* `Between(key:lhs:rhs:)`

`AnyQuery` also can be combined with another one using `&&` and `||` operator.

```swift
let equal1 = AnyQuery.Equal(key: "id", value: 1)
let equal2 = AnyQuery.Equal(key: "name", value: "naoty")
let query = equal1 && equal2
query.predicate   //=> NSPredicate(format: "id == 1 AND name == naoty")
query.dictionary  //=> ["id": 1, "name": "naoty"]
```

## Installation

### CocoaPods

```rb
pod "AnyQuery"
```

## Author

[naoty](https://github.com/naoty)

