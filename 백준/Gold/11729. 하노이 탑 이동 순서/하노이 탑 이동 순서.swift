import Foundation

let n = Int(readLine()!)!

print(pow(2, n) - 1)
hanoi(n, 1, 2 ,3)


func hanoi(_ n: Int, _ l: Int, _ m: Int, _ r: Int) {
    if n == 1 {
        print("\(l) \(r)")
    } else {
        hanoi(n-1, l, r ,m)
        print("\(l) \(r)")
        hanoi(n-1, m, l, r)
    }
}
