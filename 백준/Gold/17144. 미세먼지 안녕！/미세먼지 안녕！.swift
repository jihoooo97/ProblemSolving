let rct = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, t) = (rct[0], rct[1], rct[2])
var map: [[Int]] = []

for _ in 0..<r {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]
let cdx = [0, 1, 0, -1]
let cdy = [-1, 0, 1, 0]
var cleanerY: [Int] = []
var dust = map

for _ in 0..<t {
    spread()
    clean()
}

print(dust.reduce(0) { $0 + $1.reduce(0, +) } + 2)


func spread() {
    for y in 0..<r {
        for x in 0..<c {
            if map[y][x] == -1 {
                cleanerY.append(y)
            } else if map[y][x] < 5 {
                continue
            } else {
                for i in 0..<4 {
                    let nextX = x + dx[i]
                    let nextY = y + dy[i]
                    
                    if nextX >= 0 && nextX < c && nextY >= 0 && nextY < r && map[nextY][nextX] != -1 {
                        dust[y][x] -= (map[y][x] / 5)
                        dust[nextY][nextX] += (map[y][x] / 5)
                    }
                }
            }
        }
    }
    
    map = dust
}

func clean() {
    var x = 0
    var y = cleanerY[0] - 1
    var d = 0
    
    while x != 0 || y != cleanerY[0] {
        var nextX = x + cdx[d]
        var nextY = y + cdy[d]
        
        if dust[nextY][nextX] != -1 {
            dust[y][x] = dust[nextY][nextX]
            dust[nextY][nextX] = 0
        }
        
        x = nextX
        y = nextY
        
        nextX += cdx[d]
        nextY += cdy[d]
        
        if nextX < 0 || nextX >= c || nextY < 0 || nextY > cleanerY[0] {
            d += 1
        }
    }
    
    y = cleanerY[1] + 1
    d = 0
    
    while x != 0 || y != cleanerY[1] {
        var nextX = x + cdx[d]
        var nextY = y - cdy[d]
        
        if dust[nextY][nextX] != -1 {
            dust[y][x] = dust[nextY][nextX]
            dust[nextY][nextX] = 0
        }
        
        x = nextX
        y = nextY
        
        nextX += cdx[d]
        nextY -= cdy[d]
        
        if nextX < 0 || nextX >= c || nextY < cleanerY[1] || nextY >= r {
            d += 1
        }
    }
    
    map = dust
}