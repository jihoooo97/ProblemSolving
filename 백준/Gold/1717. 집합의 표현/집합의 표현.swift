let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (input[0], input[1])
var roots = [Int](0...n)
var answer = ""

for _ in 0..<m {
    let op = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    if op[0] == 0 {
        union(op[1], op[2])
    } else {
        answer += (find(op[1]) == find(op[2]) ? "YES\n" : "NO\n")
    }
}

print(answer)


func find(_ node: Int) -> Int {
    if roots[node] == node {
        return node
    } else {
        roots[node] = find(roots[node])
        return roots[node]
    }
}

func union(_ node1: Int, _ node2: Int) {
    let root1 = find(node1)
    let root2 = find(node2)
        
    if root1 == root2 {
        return
    } else if root2 > root1 {
        roots[root1] = root2
    } else {
        roots[root2] = root1
    }
}