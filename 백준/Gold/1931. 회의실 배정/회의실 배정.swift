let n = Int(readLine()!)!
var meetings: [(Int, Int)] = []
var end = 0
var count = 0

for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    meetings.append((input[0], input[1]))
}

meetings.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

for meeting in meetings {
    if meeting.0 >= end {
        end = meeting.1
        count += 1
    }
}

print(count)