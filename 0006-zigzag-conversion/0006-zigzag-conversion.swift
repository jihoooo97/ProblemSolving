class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || s.count <= numRows {
            return s
        }

        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var isDown = false

        for char in s {
            rows[currentRow] += "\(char)"

            if currentRow == 0 || currentRow == numRows - 1 {
                isDown.toggle()
            }

            currentRow += isDown ? 1 : -1
        }

        return rows.joined()
    }
}