let n = Int(readLine()!)!

printStar(n, ["*"])

func printStar(_ n: Int, _ star: [String]) {
    if n == 1 {
        star.forEach {
            print($0)
        }
        return
    }
    
    let full = star.map { $0 + $0 + $0 }
    let empty = star.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    printStar(n / 3, full + empty + full)
}