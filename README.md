# AnyEquatable

Provide `func isEqual(_: Any, _: Any) -> Bool` function which compares values even if they are not `Equatable`.

```swift
AnyEquatable.isEqual("abc", "abc") // true
AnyEquatable.isEqual(1, 3) // false

// Compare not Equatable types
struct NotEquatable {}
AnyEquatable.isEqual(NotEquatable(), NotEquatable()) // false

// Compare different types
AnyEquatable.isEqual(1, "abc") // false
```
