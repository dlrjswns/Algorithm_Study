//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/19/24.
//

import Foundation
/*
 우리 병사는 흰색
 적국 병사는 파란색
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1] // 가로크기 N, 세로크기 M

var soldiers: [[Character]] = []

for _ in 0..<M {
  let soldier = Array(readLine()!)
  soldiers.append(soldier)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: M)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var answer: (myCount: Int, enemyCount: Int) = (0, 0) // 정답
var count = 0

func dfs(x: Int, y: Int, who: Character) {
  
  visited[x][y] = true
  count += 1
  
  for i in 0..<4 {
    let rx = dx[i] + x
    let ry = dy[i] + y
    
    if 0..<M ~= rx && 0..<N ~= ry && !visited[rx][ry] && soldiers[rx][ry] == who {
      dfs(x: rx, y: ry, who: who)
    }
  }
  
}

for r in 0..<M {
  for c in 0..<N {
    if !visited[r][c] {
      dfs(x: r, y: c, who: soldiers[r][c])
      if soldiers[r][c] == "W" {
        answer.0 += count * count
      } else {
        answer.1 += count * count
      }
      count = 0
    }
  }
}

print("\(answer.0) \(answer.1)")
