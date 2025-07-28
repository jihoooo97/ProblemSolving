let n = Int(readLine()!)!
let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

var map: [[Bool]] = Array(repeating: [Bool](repeating: false, count: 101), count: 101)
var result = 0

for _ in 0..<n {
    let curve = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y, d, g) = (curve[0], curve[1], curve[2], curve[3])

    var direction: [Int] = []
    map[y][x] = true
    
    let endX = x + dx[d]
    let endY = y + dy[d]
    
    map[endY][endX] = true
    direction.append(d)
    dragonCurve(&direction, endX, endY, g, 0)
}

for i in 0..<100 {
    for j in 0..<100 {
        if map[i][j] && map[i][j + 1] && map[i + 1][j] && map[i + 1][j + 1] {
            result += 1
        }
    }
}

print(result)


func dragonCurve(_ direction: inout [Int], _ endX: Int, _ endY: Int, _ g: Int, _ currentG: Int) {
    if currentG >= g { return }
    
    var nextEndX = endX
    var nextEndY = endY
    
    for i in (0..<direction.count).reversed() {
        let d = (direction[i] + 1) % 4
        nextEndX += dx[d]
        nextEndY += dy[d]
        
        map[nextEndY][nextEndX] = true
        direction.append(d)
    }
    
    dragonCurve(&direction, nextEndX, nextEndY, g, currentG + 1)
}