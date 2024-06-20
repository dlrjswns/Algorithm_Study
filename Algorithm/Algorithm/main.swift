//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/18/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

/// n은 행의 개수, m은 열의 개수
let n = nm[0], m = nm[1]

var icemountainInfo: [[Int]] = []

for _ in 0..<n {
    icemountainInfo.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
//var queue: [(Int, Int)] = []

func bfs(x: Int, y: Int, visited: inout [[Bool]]) {
    
    var queue: [(Int, Int)] = [(x, y)]
    var index = 0
    
    visited[x][y] = true
    
    while queue.count > index {
        
        let (xDir, yDir) = queue[index]
        
        for i in 0..<4 {
            let rx = dx[i] + xDir
            let ry = dy[i] + yDir
            
            if 0..<n ~= rx && 0..<m ~= ry && !visited[rx][ry] && icemountainInfo[rx][ry] > 0 {
                queue.append((rx, ry))
                visited[rx][ry] = true
            }
        }
        
        index += 1
    }
    
}

/// 빙하가 몇개로 나누어져있는지 카운팅
func countIce() -> Int {
    
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var count = 0
    
    for r in 0..<n {
        for c in 0..<m {
            if icemountainInfo[r][c] != 0 && !visited[r][c] {
                bfs(x: r, y: c, visited: &visited)
                count += 1
            }
        }
    }
    return count
    
}

func meltIce() {
    
    var newMap = icemountainInfo
        
        for r in 0..<n {
            for c in 0..<m {
                if icemountainInfo[r][c] > 0 {
                    var count = 0
                    for i in 0..<4 {
                        let nx = dx[i] + r
                        let ny = dy[i] + c
                        
                        if 0..<n ~= nx && 0..<m ~= ny && icemountainInfo[nx][ny] == 0 {
                            count += 1
                        }
                    }
                    newMap[r][c] = max(0, icemountainInfo[r][c] - count)
                }
            }
        }
        icemountainInfo = newMap
    
}

var year = 0

while true {
    
    var answer = countIce()
    
    if answer == 0 {
        print(0)
        break
    }
    
    if answer >= 2 {
        print(year)
        break
    }
    
    meltIce()
    
    year += 1
    
}
