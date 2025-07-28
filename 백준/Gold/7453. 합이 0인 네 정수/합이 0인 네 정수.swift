solution()

func solution() {
    let n = Int(readLine()!)!
    var a = [Int](repeating: 0, count: n)
    var b = [Int](repeating: 0, count: n)
    var c = [Int](repeating: 0, count: n)
    var d = [Int](repeating: 0, count: n)

    for i in 0..<n {
        let input = readLine()!.split { $0 == " "}.map { Int("\($0)")! }
        a[i] = input[0]
        b[i] = input[1]
        c[i] = input[2]
        d[i] = input[3]
    }

    var ab = [Int]()
    var cd = [Int]()

    for i in 0..<n {
        for j in 0..<n {
            ab.append(a[i] + b[j])
            cd.append(c[i] + d[j])
        }
    }

    ab.sort()
    cd.sort()

    let length = n * n
    var start = 0
    var end = length - 1
    var count = 0

    while start < length && end >= 0 {
        let left = ab[start]
        let right = cd[end]
        let sum = left + right
    
        if sum < 0 {
            start += 1
        } else if sum > 0 {
            end -= 1
        } else {
            var abCount = 1
            var cdCount = 1
            start += 1
            end -= 1
        
            while start < length && ab[start] == left {
                abCount += 1
                start += 1
            }
        
            while end >= 0 && cd[end] == right {
                cdCount += 1
                end -= 1
            }
        
            count += abCount * cdCount
        }
    }

    print(count)
}