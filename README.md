SwiftCase
===

SwiftCase provides Scala like constructor pattern matching DSL.
This module includes `match` function and SwiftCase.

## How to use

```swift

class User: SwiftCase {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func unapply() -> Array<NSObject> {
        return [self.name, self.age]
    }
}

class OtherUser: SwiftCase {
    let name: String
    let age: Int
    let address: String
    init(name: String, age: Int, address: String) {
        self.name = name
        self.age = age
        self.address = address
    }

    func unapply() -> Array<NSObject> {
	        return [self.name, self.age, self.address]
    }
}

let user = User(name: "NOBITA", age: 12)
let ret : AnyObject? = match(user)(arr: [
    User(name: "TAKESHI", age: 12) ~> 1,
    User(name: "NOBITA", age: 32) ~> 2,
    User(name: "NOBITA", age: 12) ~> 3,
    OtherUser(name: "NOBITA", age: 20, address: "TOKYO") ~> 4
])

// ret is 3
```


## License

MIT License. Please see the LICENSE file for details.
