SwiftCase
===

SwiftCase provides Scala like constructor pattern matching DSL.
This module includes `match` function and SwiftCase which you should inherit in order to match this class.

## How to use

```swift
class User: SwiftCase {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init(name, age)
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
        super.init(name, age, address)
    }
}

class TwoUsers: SwiftCase {
    let user1: User
    let user2: User
    init(user1: User, user2: User) {
        self.user1 = user1
        self.user2 = user2
        super.init(user1, user2)
    }
}

let user1 = User(name: "NOBITA", age: 34)
let user2 = User(name: "TAKESHI", age: 14)

let twoUsers = TwoUsers(user1: user1, user2: user2)
switch twoUsers {
    case User(name: "NOBITA", age: 23):
             println("This is 3")
    case User(name: "TAKESHI", age: 32):
             println("This is 2")
    case User(name: "NOBITA", age: 34):
             println("This is 1")
    case OtherUser(name: "NOBITA", age: 23, address: "TOKYO"):
             println("This is other user")
    case TwoUsers(user1: User(name: "NOBITA", age: 34), user2: User(name: "TAKESHI", age: 14)):
             println("This is two user")
    default:
             println("This is default")
}

// -> "This is two user"
```


## License

MIT License. Please see the LICENSE file for details.
