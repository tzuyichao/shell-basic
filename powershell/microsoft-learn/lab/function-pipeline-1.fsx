let list = [4; 3; 1]
let sort (list: int list) = List.sort list
let print (list: int list) = List.iter (fun x -> printfn "item %i" x) list

list |> sort |> print