//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/17/24.
//

import Foundation

let mnh = readLine()!.split(separator: " ").map { Int(String($0))! }

/// 상자 크기 m, n
/// 상자의 수 h
let m = mnh[0], n = mnh[1], h = mnh[2]
var tomatoBox: [[[Int]]] = Array(repeating: Array(repeating: [Int](), count: n), count: h)

for i in 0..<h {
    for j in 0..<n {
        let tomato = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomatoBox[i][j] = tomato
    }
}

// TODO: 그래프탐색 상하좌우위아래 좌표
let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

var queue: [(Int, Int, Int, Int)] = []

func bfs() -> Int {
    
    var index = 0
    var answer = 0
    
    while queue.count > index {
        
        let (dirX, dirY, dirZ, day) = queue[index]
        
        for i in 0..<6 {
            let rx = dx[i] + dirX
            let ry = dy[i] + dirY
            let rz = dz[i] + dirZ
            
            if 0..<n ~= rx && 0..<m ~= ry && 0..<h ~= rz && tomatoBox[rz][rx][ry] == 0 {
                queue.append((rx, ry, rz, day + 1))
                tomatoBox[rz][rx][ry] = 1
                answer = day + 1
            }
        }
        
        index += 1
    }
    return answer
}

for k in 0..<h {
    for i in 0..<n {
        for j in 0..<m {
            if tomatoBox[k][i][j] == 1 {
                queue.append((i, j, k, 0))
            }
        }
    }
}

//if tomatoBox.flatMap { $0 }.flatMap { $0 }.filter { $0 == 0 }.count == 0 {
//    print(0)
//}

var answer = bfs()

if tomatoBox.flatMap { $0 }.flatMap { $0 }.filter { $0 == 0 }.count != 0 {
    print(-1)
} else {
    print(answer)
}
