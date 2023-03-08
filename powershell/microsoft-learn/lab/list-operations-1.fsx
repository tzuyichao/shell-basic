let cards = [ 1 .. 5 ]

printfn "== iter() =="
List.iter (fun i -> printfn "%i" i) cards

// method 2: 
// for i in cards do printfn "%i" i

printfn "== map() =="
type person = { FirstName: string; LastName: string }
let people = [
    { FirstName = "Albert"; LastName = "Einstein" }
    { FirstName = "Marie"; LastName = "Curie" }
]

let nobelPrizeWinners = List.map (fun person -> person.FirstName + " " + person.LastName) people
printfn "%A" nobelPrizeWinners 

printfn "== filter() =="
let filteredList = List.filter (fun i -> i % 2 = 0) cards
List.iter (fun i -> printfn "item %i" i) filteredList

printfn "== sort() =="
let list = [2; 1; 5; 3]
let sortedList = List.sort list
// List.iter (fun i -> printfn "%i" i) sortedList
printfn "%A" sortedList

let fruits = ["Banana"; "Apple"; "Pineapple"]
let sortedFruits = List.sortBy (fun (fruit: string) -> fruit.Length) fruits
// List.iter (fun s -> printfn "%s" s) sortedFruits
printfn "%A" sortedFruits

type MagicCreature = { Name: string; Level: int; Attack: int }
let creatures = [
    { Name = "Dragon"; Level = 2; Attack = 20 }
    { Name = "Orc"; Level=1; Attack = 5 }
    { Name = "Demon"; Level=2; Attack = 10 }
]
let compareCreatures c1 c2 =
    if c1.Level < c2.Level then -1
    else if c1.Level > c2.Level then 1
    else if c1.Attack < c2.Attack then -1
    else if c1.Attack > c2.Attack then 1
    else 0

let sortedCreatures = List.sortWith compareCreatures creatures
printfn "%A" sortedCreatures

printfn "== search() =="
let found = List.find (fun x -> x % 2 = 1) list
printfn "%A" found

let findValue aValue aList =
    let found = aList |> List.tryFind (fun item -> item = aValue)

    match found with
    | Some value -> printfn "%i" value
    | None -> printfn "Not found"

findValue 1 list
findValue 100 list

let foundIndex = List.tryFindIndex (fun x -> x = 5) list
match foundIndex with
    | Some index -> printfn "index of 5 is %i" index
    | None -> printfn "Not found"

printfn "== sum() =="
let sum = List.sum [1..10]
printfn "%i" sum

printfn "== sumBy() =="
type OrderItem = {Name: string; Cost: int}
let orderItems = [
    { Name = "XBox"; Cost = 500 }
    { Name = "Book"; Cost = 10 }
    { Name = "Movie ticket"; Cost = 7 }
]
let sumby = List.sumBy (fun item -> item.Cost) orderItems
printfn "%i" sumby

printfn "== average() =="
let numbers = [1.0; 2; 3; 4; 5]
let avg = List.average numbers
printfn "%f" avg

printfn "== averageBy() =="
type WeatherMeasurement = { Date: string; Temperature: float}
let measurements = [
    { Date = "07/20/2021"; Temperature = 21.3 }
    { Date = "07/21/2021"; Temperature = 23.2 }
    { Date = "07/22/2021"; Temperature = 20.7 }
]
let avgby = List.averageBy (fun m -> m.Temperature) measurements
printfn "%f" avgby