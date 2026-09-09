# swift-map

A typed transformation with consuming input and typed errors, independent of parsing.

```swift
import Map
let increment = Map<Int, Int, Never> { $0 + 1 }
```
