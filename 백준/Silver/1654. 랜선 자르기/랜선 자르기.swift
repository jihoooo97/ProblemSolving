let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (k, n) = (input[0], input[1])
var lengths: [Int] = []

for _ in 0..<k {
    lengths.append(Int(readLine()!)!)
}

var start = 1
var end = lengths.max()!
var maxLength = 0

while start <= end {
    let mid = (start + end) / 2
    var count = 0
    
    for l in lengths {
        count += l / mid
    }
    
    if count >= n {
        maxLength = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(maxLength)