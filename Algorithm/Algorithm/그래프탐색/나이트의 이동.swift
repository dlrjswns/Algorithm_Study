//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/7/24.
//

import Foundation

let dx = [-1, -2, -2, -1, 1, 2, 2, 1]
let dy = [-2, -1, 1, 2, 2, 1, -1, -2]

let testcase = Int(readLine()!)!

func bfs(x: Int, y: Int, l: Int, purpose:(Int, Int)) {
    var visited = Array(repeating: Array(repeating: false, count: l), count: l)
    var index = 0
    
    /// (x좌표, y좌표, 몇번 이동했는지)
    var queue: [(Int, Int, Int)] = [(x, y, 0)]
    
    while queue.count > index {
        
        let (xDir, yDir, count) = queue[index]
        
        if xDir == purpose.0 && yDir == purpose.1 {
            print(count)
            break
        }
        
        for i in 0..<8 {
            
            let rx = dx[i] + xDir
            let ry = dy[i] + yDir
            
            if 0..<l ~= rx && 0..<l ~= ry && !visited[rx][ry] {
                queue.append((rx, ry, count + 1))
                visited[rx][ry] = true
            }
            
        }
        
        index += 1
    }
}

for _ in 0..<testcase {
    let l = Int(readLine()!)!
    
    /// 나이트가 현재 있는 칸
    let knightPosition = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    /// 이동하려고 하는 칸
    let purposePosition = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    bfs(x: knightPosition[0], y: knightPosition[1], l: l, purpose: (purposePosition[0], purposePosition[1]))
}
