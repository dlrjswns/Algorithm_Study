import Foundation

func numberCardGame(example: [[Int]]) -> Int {
    var arr = [Int]()
    example.forEach { exArr in
        arr.append(exArr.min()!)
    }
    return arr.max()!
    }
    


numberCardGame(example: [
    [3, 1, 2],
    [4, 1, 4],
    [2, 2, 2]
])


