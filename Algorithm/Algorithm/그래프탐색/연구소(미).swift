//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/9/24.
//

import Foundation

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var map: [[Int]] = []
//var visited = Array(repeating: Array(repeating: false, count: nm[0]), count: nm[1])

for _ in 0..<nm[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func bfs(x: Int, y: Int) {
  
    var visited = Array(repeating: Array(repeating: false, count: nm[0]), count: nm[1])
    var temp = map
    var queue: [(Int, Int)] = [(x, y)]
    visited[x][y] = true
    var index = 0
    
    while queue.count > index {
        
        let (xDir, yDir) = queue[index]
        
        for i in 0..<4 {
            
            let rx = dx[i] + xDir
            let ry = dy[i] + yDir
            
            if 0..<nm[0] ~= rx && 0..<nm[1] ~= ry && !visited[rx][ry] && temp[rx][ry] == 0 {
                queue.append((rx, ry))
                visited[rx][ry] = true
                temp[rx][ry] = 2
            }
            
        }
        
        index += 1
    }
    
}

var answer = Int.min

func makeWall(count: Int) {
    
    if count == 3 {
        // TODO: -visited, map 초기화
        
//        visited = Array(repeating: Array(repeating: false, count: nm[0]), count: nm[1])
        
        for i in 0..<nm[0] {
            for j in 0..<nm[1] {
                if map[i][j] == 2 {
                    bfs(x: i, y: j)
                }
            }
        }
        
        answer = max(answer, map.flatMap { $0 }.filter { $0 == 0 }.count)
        
        return
    }
    
    for r in 0..<nm[0] {
        for c in 0..<nm[1] {
            if map[r][c] == 0 {
                map[r][c] = 2
                makeWall(count: count + 1)
                map[r][c] = 0
            }
        }
    }
}

makeWall(count: 0)

print(answer)
