let nwl = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w, l) = (nwl[0], nwl[1], nwl[2])

var trucks = readLine()!.split(separator: " ").map { Int($0)! }
var sum = trucks[0]
var time = 0
var queue: [(Int, Int)] = [(trucks.removeFirst(), 1)]

while !queue.isEmpty {
    time += 1
    
    if queue[0].1 + w <= time {
        sum -= queue.removeFirst().0
    }
    
    if !trucks.isEmpty && sum + trucks[0] <= l {
        sum += trucks[0]
        queue.append((trucks.removeFirst(), time))
    } else {
        continue
    }
}

print(time)