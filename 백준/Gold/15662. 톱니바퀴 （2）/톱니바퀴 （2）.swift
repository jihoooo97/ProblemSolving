import Foundation

var gears: [[Int]] = []
var score = 0

let t = Int(readLine()!)!

for _ in 0..<t {
    gears.append(readLine()!.map { Int("\($0)")! })
}

let k = Int(readLine()!)!

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, d) = (input[0] - 1, input[1])
    
    turn(i, true, d)
    turn(i, false, d)
    turnGear(&gears[i], d)
}

print(gears.filter { $0[0] == 1 }.count)


func turnGear(_ gear: inout [Int], _ d: Int) {
    if d == 1 {
        gear = Array(Array(gear + gear)[7...14])
    } else {
        gear = Array(Array(gear + gear)[1...8])
    }
}

func turn(_ i: Int, _ increase: Bool, _ d: Int) {
    if i < 0 || i > t - 1 { return }
    
    if increase && i < t - 1 && gears[i][2] != gears[i + 1][6] {
        turn(i + 1, true, d * -1)
        turnGear(&gears[i + 1], d * -1)
    }
    
    if !increase && i > 0 && gears[i][6] != gears[i - 1][2] {
        turn(i - 1, false, d * -1)
        turnGear(&gears[i - 1], d * -1)
    }
}