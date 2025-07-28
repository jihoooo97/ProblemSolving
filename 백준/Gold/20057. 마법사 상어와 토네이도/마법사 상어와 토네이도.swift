let n = Int(readLine()!)!
var map: [[Int]] = []

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

let spreadX: [[Int]] = [
    [-2, -1, -1, 0, 0, 0, 0, 1, 1],
    [0, -1, 1, -2, 2, -1, 1, -1, 1],
    [2, 1, 1, 0, 0, 0, 0, -1, -1],
    [0, 1, -1, 2, -2, 1, -1, 1, -1]
]

let spreadY: [[Int]] = [
    [0, -1, 1, -2, 2, -1, 1, -1, 1],
    [2, 1, 1, 0, 0, 0, 0, -1, -1],
    [0, 1, -1, 2, -2, 1, -1, 1, -1],
    [-2, -1, -1, 0, 0, 0, 0, 1, 1]
]

let per: [Int] = [5, 10, 10, 2, 2, 7, 7, 1, 1]

var (x, y, d) = (n / 2, n / 2, 0)
var l = 1
var out = 0

while x >= 0 && x < n && y >= 0 && y < n {
    for _ in 0..<l {
        x += dx[d]
        y += dy[d]

        if x < 0 || y < 0 { break }
        
        let aX = x + dx[d]
        let aY = y + dy[d]
        var sand = map[y][x]
        
        if map[y][x] == 0 {
            continue
        } else if map[y][x] >= 10 {
            for i in 0..<9 {
                let sX = x + spreadX[d][i]
                let sY = y + spreadY[d][i]
                let sandPer = map[y][x] * per[i] / 100
                
                if sX < 0 || sX >= n || sY < 0 || sY >= n {
                    out += sandPer
                } else {
                    map[sY][sX] += sandPer
                }
                
                sand -= sandPer
            }
            
            if aX < 0 || aX >= n || aY < 0 || aY >= n {
                out += sand
            } else {
                map[aY][aX] += sand
            }
        } else {
            if aX < 0 || aX >= n || aY < 0 || aY >= n {
                out += sand
            } else {
                map[aY][aX] += sand
            }
        }
        
        map[y][x] = 0
    }
    
    if d % 2 == 1 { l += 1 }
    d = (d + 1) % 4
}

print(out)