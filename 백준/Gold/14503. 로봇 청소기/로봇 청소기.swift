import Foundation

let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

let rcd = readLine()!.split(separator: " ").map { Int($0)! }
let r = rcd[0]
let c = rcd[1]
let d = rcd[2]

var count = 1
var map: [[Int]] = []

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

map[r][c] = 2
dfs(count, d, c, r)

func leftTurn(_ now: Int, _ i: Int) -> Int {
   return (now + 3 - i) % 4
}

func dfs(_ cnt: Int, _ now: Int, _ x: Int, _ y: Int) {
    for i in 0..<4{
        let nextD = leftTurn(now, i)
        let nextX = x + dx[nextD]
        let nextY = y + dy[nextD]
        
        if nextY < 0 || nextY >= n || nextX < 0 || nextX >= m { continue }
        if map[nextY][nextX] != 0 { continue }
        
        map[nextY][nextX] = 2
        dfs(cnt + 1, nextD, nextX, nextY)
    }
    
    let backD = now > 1 ? now - 2: now + 2
    let backX = x + dx[backD]
    let backY = y + dy[backD]

    if map[backY][backX] == 1 {
        print(cnt)
        exit(0)
    } else {
        dfs(cnt, now, backX, backY)
    }
}