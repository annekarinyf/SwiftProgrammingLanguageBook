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
print(shape.simpleDescription()) // Prints "A shape with 7 sides."
print(shape.sides(multipiedBy: 3)) // Prints "If we multiply the sides * 3, we have a total of 21 sides."
