import UIKit
import CoreGraphics

// MARK: CHALLENGE 1
let celsius = 10.5

let fahrenheit = (celsius * 9.0 / 5.0) + 32.0
print("Celsius: \(celsius)°C = \(fahrenheit)°F in Fahrenheit")




var array = [1,3,5,23,12]
print(array[2])
array.append(50)
print(array)

if array.contains(23) {
    print("Yes")
}

var sortedArray = array.sorted()
sortedArray.reverse()
print(sortedArray)


let employee = [
    "Name": "Taylor Swift",
    "Job": "Singer",
    "Location": "Nashville"
]

print(employee["Name", default: "Unknown"])

var dictionary = [Int : String]()
dictionary [100] = "The Joker"
dictionary [200] = "The penguin"

print(dictionary)
dictionary.removeAll()
print(dictionary)


var actors = Set(["Tom Cruise", "Nic Cage", "S Jackson"])
print(actors)
actors.insert("Tom Hardy")
print(actors)



enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
print(day)


// MARK: CHALLENGE 2
let albums = ["Red", "Fearless", "Metropolis", "Scenes from a Memory", "Metropolis"]
let numberOfAlbums = albums.count
print("Total number of albums = \(numberOfAlbums)")

let setOfAlbums = Set(albums)
let numberOfUniqueAlbums = setOfAlbums.count
print("Total number of unique albums = \(numberOfUniqueAlbums)")


// MARK: IF STATEMENTS
var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)


// MARK: ENUMS
enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun


switch forecast {
    
case .sun :
    print("Its sunny")
case .rain :
    print("Its raining")
case .wind :
    print("Its windy")
case .snow :
    print("Its snowing")
case .unknown :
    print("Its unknown")
}

let weekDay = 5

switch weekDay {
case 5 :
    print("Number 5")
    fallthrough
case 4 :
    print("Number 4")
    fallthrough
case 3 :
    print("Number 3")
    fallthrough
case 2 :
    print("Number 2")
    fallthrough
default:
    print("Number 1")
}


// MARK: TERNARY CONDITIONAL OPERATOR
let age = 18
let canVote = age >= 18 ? true : false

enum Theme {
    case dark, light
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)


// MARK: FOR LOOPS
let platforms = ["iOS", "macOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os).")
}

var numberToTimes = 12

for i in 1...numberToTimes {
    print("5 x \(i) = \(5 * i)")
    
    for j in 1...12 {
        print("     \(j) x \(i) = \(j * i)")
    }
}



// MARK: WHILE LOOPS

var countdown = Int.random(in: 1...100)

while countdown > 0 {
    print("\(countdown)")
    countdown -= 1
}
print("Blast off!!!")

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical Hit")


// MARK: CHECKPOINT 3
var number = 15

if number % 3 == 0 && number % 5 == 0 {
    print("FizzBuzz")
} else if number % 5 == 0 {
        print("Buzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else {
        print(number)
    }

if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz2")
} else if number.isMultiple(of: 5) {
    print("Buzz2")
} else if number.isMultiple(of: 3) {
    print("Fizz2")
} else {
    print(number)
}


// MARK: FUNCTIONS - added a default parameter.
func printTimesTables(number: Int, amount: Int = 10) {
    for i in 1...amount {
        print("\(i) * \(number) is \(i * number)")
    }
}
printTimesTables(number: 10, amount: 12)


let root = sqrt(169)
print(root)


func compareString(word1: String, word2: String ) -> Bool {
    let sorted1 = word1.sorted()
    let sorted2 = word2.sorted()
    
    if sorted1 == sorted2 {
        return true
    } else {
        return false
    }
}
compareString(word1: "acdc", word2: "dcac")


func pythagoras(side1: Double, side2: Double) -> Double {
   let hSqr = (side1 * side1) + (side2 * side2)
    return sqrt(hSqr)
}
pythagoras(side1: 3, side2: 4)



// FUNCTIONS WITH MULTIPLE RETURNS - use tuples as the return type
let tuple = (firstName: "John", lastName: "Pill")
print(tuple.firstName)


// MARK: FUNCTIONS - ERROR HANDLING
let password = "1234"
enum PasswordError: Error {
    case short, obvious
}

func errorHandling() throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

do {
    let result = try errorHandling()
    print("Password")
} catch {
    print("Error")
}


// MARK: CHECKPOINT 4
enum SqrtError: Error {
    case outOfBounds, noRoot
}

func sqrt(number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SqrtError.outOfBounds
    }
    
    for i in 0...100 {
        if i * i == number {
            return i
        }
    }
    throw SqrtError.noRoot
}

do {
    let sqrtAnswer = try sqrt(number: 25)
    print(sqrtAnswer)
} catch SqrtError.outOfBounds {
    print("Out of Bounds")
} catch SqrtError.noRoot {
    print("No Root")
}


// MARK: CLOSURES
let team = ["John", "Rachel", "Charlie", "Max"]
let sortedTeam = team.sorted()

let captainFirst = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "John" {
        return true
} else if name2 == "John" {
    return false
}
        return name1 < name2
})



// TRAILING CLOSURES & SHORT HAND SYNTAX
let newCaptainFirst = team.sorted {
    if $0 == "Rachel" {
        return true
} else if $1 == "Rachel" {
    return false
}
        return $0 < $1
}

let revTeam = team.sorted {
    return $0 > $1
}
// CLOSURES - FILTER
let rOnly = team.filter {$0.hasPrefix("R")}

print(captainFirst)
print(newCaptainFirst)
print(revTeam)
print(rOnly)

// CLOSURES - MAP - Very important!!!!!
let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)


// CLOSURES - Functions as Parameters
func doImportantWork( first: () -> Void, second: () -> Void, third: () -> Void  ) {
    print("About to do first")
    first()
    print("About to do second")
    second()
    print("About to do third")
    third()
    print("Done")
}

doImportantWork {
    print("First Work")
} second: {
    print("Second Work")
} third: {
    print("Third Work")
}


// CHECKPOINT 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
var newArray = luckyNumbers.filter {$0 % 2 != 0}
newArray.sort()
var answer = newArray.map {"\($0) is a lucky number"}
print(answer)



// MARK: STRUCTS - mutating func can change data in struct.

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
   // var vacationRemaining: Int
    
    // For Computed Properties
    var vacationAllocated = 14
    var vacationTaken = 0
    
    
    // Get (read) & Set (write)
    var vacationRemaining: Int {
        get {vacationAllocated - vacationTaken}
        set {vacationAllocated = vacationTaken + newValue }
    }
    
//   mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("Im going on vacation")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There arent enough days left.")
//        }
//    }
}


//var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)

// Computed Properties


var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)



// MARK: PROPERTY OBSERVERS - didSet and willSet (used before the change)

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


// MARK: CUSTOM INITIALIZERS

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "John")
print(player.number)


// MARK: ACCESS CONTROL - LIMIT ACCESS TO DATA

// private - can't be accessed outside the struct
// fileprivate - can't be used outside the current file.
// public - anyone, anywhere.
// private(set) - anyone can read, but only internal methods can write.

private var funds = 0



// MARK: STATIC PROPERTIES & METHODS

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}

struct AppData {
    static let version = "1.2"
    static let saveFilename = "settings.json"
    static let homeURL = "www.askjdhaks.com"
}
// Read info anywhere in the app.
AppData.version

// Create sample data for your preview in SwiftUI - available everywhere
struct NewEmployee {
    let username: String
    let password: String
    
    static let example = NewEmployee(username: "asdasd", password: "asdaskh")
}

var exampleForPreview = NewEmployee.example


// MARK: CHECKPOINT 6 - Create a Struct

enum gearSelector {
    case up, down
}

struct Car {
    let model: String
    let numberOfSeats: Int
    var currentGear = 0
    
    
    mutating func gearChange(selector: gearSelector) {
        if selector == .down && currentGear == 0 {
            return
        } else if selector == .up && currentGear == 6 {
            return
        } else if selector == .up {
            currentGear += 1
        } else if selector == .down {
            currentGear -= 1
        }
        print("You are in gear \(currentGear)")
    }
}


var car = Car(model: "Ford", numberOfSeats: 5)
car.gearChange(selector: .up)
car.gearChange(selector: .up)
car.gearChange(selector: .down)
car.gearChange(selector: .down)



// MARK: Classes

class Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game2()
newGame.score += 10

var anotherGame = Game2()
newGame.score -= 5
// See how the original class score is changed as the data isn't copied.

// Sharing Properties and Methods
class Employee3 {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) a day")
    }
}

class Manager: Employee3 {
    func work() {
        print("I'm going to meetings for \(hours) hours")
    }
}

// final class - can inherit, but nothing can inherit from it.
final class Developer: Employee3 {
    func work() {
        print("I'm going to code for \(hours) hours")
    }
// Use override func to change a method in the superclass.
    override func printSummary() {
        print("I work \(hours * 2) hours a day")
    }
}

let chris = Developer(hours: 8)
let john = Manager(hours: 10)
chris.work()
john.work()
john.printSummary()
chris.printSummary()


// Adding initializers for classes.

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Need to super.init properties from the super class.
class Car2: Vehicle {
    let isConvertible: Bool
  
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car2(isElectric: true, isConvertible: false)

// How to copy class data rather than share.
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)


// MARK: Challenge 7

class Animal {
    let legs: Int
       
    init(legs: Int) {
        self.legs = legs
}

class Dog: Animal {
    func speak() {
        print("Woof Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof Wooooof!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yap Yap!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meaow")
    }
        
    init(legs: Int, isTame: Bool) {
         self.isTame = isTame
         super.init(legs: legs)
    }
}
}


// MARK: PROTOCOLS (get - read) (get set - read and write)

protocol Transport {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTeme(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car3: Transport {
    let name = "Car"
    var currentPassengers = 2
    
    
    func estimateTeme(for distance: Int) -> Int {
                distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")}
    }
    
    
struct Bike: Transport {
    let name = "Bike"
    var currentPassengers = 1
    
    func estimateTeme(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")}
}

func commute(distance: Int, using vehicle: Transport) {
    if vehicle.estimateTeme(for: distance) > 100 {
        print("Thats too slow")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car3 = Car3()
commute(distance: 100, using: car3)
    
let bike = Bike()
commute(distance: 50, using: bike)


// MARK: CREATE AND USE EXTENSIONS - add . functionality to Types

var quote = "   The truth is rarely pure and never simple   "
//let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
let trimmed = quote.trimmed()
quote.trim()


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
       self = self.trimmed()
    }

}

// MARK PROTOCOL EXTENSIONS - Collection means, arrays, dictionaries, sets etc.
// Protocal Orientated Programming - Pop

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guests count: \(guests.count)")
}

protocol Person {
    var name: String {get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee4: Person {
    let name: String
}

let taylor = Employee4(name: "Taylor Swift")
taylor.sayHello()


// Another Protocal / Extension example
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())


// MARK: CHECKPOINT 8

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var estateAgent: String { get set }
    func summary(rooms: Int, cost: Int, estateAgent: String) -> String
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    func summary(rooms: Int, cost: Int, estateAgent: String) -> String {
        return "The building has \(rooms) and cost \(cost). It is sold by \(estateAgent)"
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    func summary(rooms: Int, cost: Int, estateAgent: String) -> String {
        return "The building has \(rooms) and cost \(cost). It is sold by \(estateAgent)"
        
    }
}

var house = House(rooms: 5, cost: 230, estateAgent: "Clarks")
house.summary


// MARK: OPTIONALS

let opposites = ["Mario" : "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// Declare an optional data type
var username: String? = nil
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("No user")
}

//Another example - use the same names temporarily in the if let.
func square(number: Int) -> Int {
    number * number
}

var optionalNumber: Int? = nil
if let optionalNumber = optionalNumber {
    print(square(number: optionalNumber))
} else {
    print("The number must be nil?")
}



// MARK: GUARD

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing number - use return to exit the function")
        return
    }
    let answer = number * number
   print(answer)
}

printSquare(of: nil)
printSquare(of: 12)



// MARK: NIL COALESCING

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Ted Lasso"]
let favourite = tvShows.randomElement() ?? "None"

// Or
struct Book {
    let title: String
    let author: String?
    let year: Int?
}

let book = Book(title: "Book Title", author: nil, year: nil)

let author = book.author ?? "Anonymous"
let year = book.year ?? 0
print("\(author) in \(year)")


//MARK: Optional Chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print(chosen)

var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)



// MARK: Function failure with optionals.

enum UserError: Error {
    case badID, networkFailed
}


func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
 
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// MARK: CHECKPOINT 9 - Optionals


//func optionalArray(input: [Int]?) -> Int {
//    return input?.randomElement() ?? 5
//}
//
//optionalArray(input: [1,2,3,4,5])
//var optArray: [Int]?
//optionalArray(input: optArray)



