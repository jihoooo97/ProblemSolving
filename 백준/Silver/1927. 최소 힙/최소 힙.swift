let n = Int(readLine()!)!
var heap = Heap<Int>(sort: <)

for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x > 0 {
        heap.insert(x)
    } else {
        print(heap.remove() ?? 0)
    }
}

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let areSorted: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    init(sort: @escaping (T, T) -> Bool) {
        self.areSorted = sort
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        
        let removed = elements.removeLast()
        siftDown(from: 0)
        return removed
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && areSorted(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < elements.count && areSorted(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < elements.count && areSorted(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
