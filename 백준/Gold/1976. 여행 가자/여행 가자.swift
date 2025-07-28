let n = Int(readLine()!)!
let m = Int(readLine()!)!
var roots = Array(0..<n)


for i in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    for j in 0..<n {
        if input[j] == 1 {
            merge(i, j)
        }
    }
}

let plan = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = Set<Int>()

for p in plan {
    result.insert(find(p - 1))
}

print(result.count == 1 ? "YES" : "NO")


func find(_ node: Int) -> Int {
    if roots[node] == node {
        return node
    }
    
    roots[node] = find(roots[node])
    return roots[node]
}

func merge(_ node1: Int, _ node2: Int) {
    let root1 = find(node1)
    let root2 = find(node2)
    roots[root2] = root1
}