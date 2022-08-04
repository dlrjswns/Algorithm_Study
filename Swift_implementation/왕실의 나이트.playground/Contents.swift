import Foundation

func kingkomOfKnite(position: String) -> Int {
    var canMoves = [(-2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2)]
    var result = 0
    var rowPosition = Int(String(position.last!))!
    var columnPosition = Int(exactly: UnicodeScalar(String(position.first!))!.value)! - Int(exactly: UnicodeScalar("a").value)! + 1
    var newRow = 0
    var newColumn = 0
    
    for canMove in canMoves {
        newRow = rowPosition + canMove.0
        newColumn = columnPosition + canMove.1
        
        if newRow > 0 && newRow < 9 && newColumn > 0 && newColumn < 9 {
            result += 1
        }
    }
    
    return result
}

kingkomOfKnite(position: "a1")

