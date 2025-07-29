let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

var distance = Array(repeating: -1, count: 100001)
var queue = [n]
var head = 0

distance[n] = 0

while head < queue.count {
    let now = queue[head]
    head += 1
    
    if now == k {
        break
    }
    
    if now * 2 <= 100000 && distance[now * 2] == -1 {
        distance[now * 2] = distance[now]
        queue.append(now * 2)
    }
    
    if now - 1 >= 0 && distance[now - 1] == -1 {
        distance[now - 1] = distance[now] + 1
        queue.append(now - 1)
    }
    
    if now + 1 <= 100000 && distance[now + 1] == -1 {
        distance[now + 1] = distance[now] + 1
        queue.append(now + 1)
    }
}

print(distance[k])