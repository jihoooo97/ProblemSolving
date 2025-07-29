let hw = readLine()!.split(separator: " ").map { Int($0)! }
let wall = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0

for i in 0..<hw[1] - 1 {
    let h = min(wall[...i].max()!, wall[(i + 1)...].max()!)
    
    if wall[i] < h {
        sum += h - wall[i]
    }
}

print(sum)
