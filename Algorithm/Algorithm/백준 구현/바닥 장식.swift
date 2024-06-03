//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/3/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]

var room: [[Character]] = []

for _ in 0..<n {
    let input = Array(readLine()!)
    room.append(input)
}

private func checkRowPanja() -> Int {
    var count = 0
    var before = ""
    
    for r in 0..<n {
        count += room[r].split(separator: "|").count
    }
    
    return count
}

private func checkColumnPanja() -> Int {
    var count = 0
    var columnList: [Character] = []
    
    for c in 0..<m {
        columnList = []
        for r in 0..<n {
            columnList.append(room[r][c])
        }
        count += columnList.split(separator: "-").count
    }
    
    return count
}

print(checkRowPanja() + checkColumnPanja())
