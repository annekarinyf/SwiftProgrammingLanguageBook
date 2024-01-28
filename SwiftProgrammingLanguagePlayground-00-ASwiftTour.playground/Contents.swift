/// The Swift Programming Language (Swift 5.7) by Apple
/// 15, August, 2023
///
/// Chapter 00: A Swift Tour
///

import Foundation

/// Simple Values
// Create a constant with an explicit type of Float and a value of 4.
let myFloat: Float = 4
print(type(of: myFloat)) // Prints "Float"

print("-----")

// Try removing the conversion to String from the last line. What error do you get?
let label = "The width is"
let width = 94
let widthLabel = label + String(width)
print(widthLabel)
// let widthLabel = label + width
// Error: Binary operator '+' cannot be applied to operands of type 'String' and 'Int'

print("-----")

// Use \() to include a floating-point calculation in a string and to include someone's name in a greeting.
let result = 7.5 + 2.5
print("The result is \(result)") // Prints "The result is 10.0"
let someonesName = "Anne"
print("Hello, \(someonesName)") // Prints "Hello, Anne"

print("-----")


/// Control Flows
// Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, unknown person!"
}
print(greeting)
// When optionalName is nil, the greeting is "Hello!"

print("-----")

//Try removing the default case. What error do you get?
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?"
// When remove default case, the error is: Switch must be exhaustive

print("-----")

// Replace the _ with a variable name, and keep track of which kind of number was the largest.
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]
var largest = 0
var kindOfLargest = ""
for(key, numbers) in interestingNumbers { // It was `for(_, numbers) in interestingNumbers `
    for number in numbers {
        if number > largest {
            largest = number
            kindOfLargest = key
        }
    }
}
print(largest)
// Prints "25"
print("\(largest) is \(kindOfLargest)")
// Prints "25 is Square"

print("-----")

/// Functions and Closures
// Remove the day parameter. Add a parameter to include today's lunch special in the greeting.
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
print(greet(person: "Bob", day: "Tuesday"))

func greet(person: String, todaysLunch: String) -> String {
    return "Hello \(person), today's lunch special is \(todaysLunch)"
}
print(greet(person: "Bob", todaysLunch: "Pizza"))

print("-----")

// Rewrite the closure to return zero for all odd numbers.
var numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map ({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print("Numbers multiplied by 3: \(mappedNumbers)") // Prints "Numbers multiplied by 3: [60, 57, 21, 36]"
let mappedOddNumbers = numbers.map ({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    } else {
        return number
    }
})
print("Numbers replacing odds with 0: \(mappedOddNumbers)") // Prints "Numbers replacing odds with 0: [20, 0, 0, 12]"

print("-----")

/// Objects and Classes
// Add a constant property with let, and add another method that takes an argument
class Shape {
    let hasSides = true
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func sides(multipiedBy multiplier: Int) -> String {
        return "If we multiply the sides * \(multiplier), we have a total of \(multiplier * numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription()) // "A shape with 7 sides."
print(shape.sides(multipiedBy: 3)) // "If we multiply the sides * 3, we have a total of 21 sides."

// Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    let radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        .pi * sqrt(radius)
    }
    override func simpleDescription() -> String {
        "A circle with area equals to \(area())"
    }
}

let circle = Circle(radius: 2, name: "Circle")
print(circle.simpleDescription()) // Prints "A circle with area equals to 4.442882938158366"

print("-----")

/// Enumerations and Structures
// Write a function that compares two Rank values by comparing their raw values.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    func isEqual(to other: Rank) -> Bool {
        self.rawValue == other.rawValue
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace.isEqual(to: .ace)) // True
print(ace.isEqual(to: .king)) // False

// Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// Add a third case to ServerResponse and to the switch.
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case unknown
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let unknown = ServerResponse.unknown

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case .unknown:
    print("Unknown state")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."

// Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func fullDeck() -> [Card] {
    let allRanks: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    let allSuits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
    let deck = allSuits.flatMap { suit in
        allRanks.map { Card(rank: $0, suit: suit) }
    }
    return deck
}
fullDeck()

print("-----")

/// Concurrency

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

// Use Task to call asynchronous functions from synchronous code, without waiting for them to return.
Task {
    await connectUser(to: "primary")
}
// Prints "Hello Guest, user ID 97”


print("-----")

// Protocols and Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    var simplePurpose: String { get set }
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    var simplePurpose: String = "The purpose is to be simple class."
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var simplePurpose: String = "The purpose is to be simple struct."
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// Add another requirement to ExampleProtocol. What changes do you need to make to SimpleClass and SimpleStructure so that they still conform to the protocol?
// Answer: Add the new requirement on both class and struct to conform to protocol.

// Write an extension for the Double type that adds an absoluteValue property.

extension Double {
    var absoluteValue: Double {
        abs(self)
    }
}
print(Double(-1.5).absoluteValue) // Prints "1.5"

print("-----")

// Error handling

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    switch printerName {
    case "Never Has Toner":
        throw PrinterError.noToner
    case "Out Of Paper":
        throw PrinterError.outOfPaper
    case "On Fire":
        throw PrinterError.onFire
    case "Unknown":
        throw NSError(domain: "Unknow Error", code: 0)
    default:
        return "Job sent"
    }
}
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "noToner”

// Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?
// Answer: The first catch block needs the error to be "PrintedError.onFire". The second catched any PrintedError. The third catched any onther kind of error.
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
    // try send(job: 123, toPrinter: "On Fire")
    // try send(job: 124, toPrinter: "Out Of Paper")
    // try send(job: 0, toPrinter: "Unknown")
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

print("-----")

// Generics

// Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> T where T.Element: Equatable, T.Element == U.Element {
    lhs.filter { rhs.contains($0) } as! T
}
print(anyCommonElements([1, 2, 3], [1, 3])) // Prints "[1, 3]"



