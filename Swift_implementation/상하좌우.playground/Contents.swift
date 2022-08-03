import Foundation

func leftRightUpDown(n: Int, moves: [String]) {
    let moveTypes = ["L", "R", "U", "D"]
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    var x = 1
    var y = 1
    var nx: Int = 0
    var ny: Int = 0
    
    for move in moves {
        for i in 0..<moveTypes.count {
            if move == moveTypes[i] {
                nx = x + dx[i]
                ny = y + dy[i]
            }
        }
        
        if nx > n || ny > n || nx < 1 || ny < 1 {
            continue
        }
        x = nx
        y = ny
    }
    
    print("x, y = \(x) \(y)")
}

leftRightUpDown(n: 5, moves: ["R", "R", "R", "U", "D", "D"])
