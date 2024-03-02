//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/25/24.
//

import Foundation

/*
 0은 빈 칸, 1은 벽, 2는 바이러스
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var map: [[Int]] = []

for _ in 0..<N {
  map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var queue: [(x: Int, y: Int, safeAreaSize: Int)] = []
var index = 0
var result = 0

// 바이러스가 퍼짐
func bfs() {
  var map = map
  var visited = Array(repeating: Array(repeating: false, count: M), count: N)
  let (x, y, safeAreaSize) = queue[index]
  
  while queue.count > index {
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      
      if 0..<N ~= rx && 0..<M ~= ry && !visited[rx][ry] && map[rx][ry] == 0 {
        queue.append((rx, ry, safeAreaSize + 1))
        visited[rx][ry] = true
      }
    }
    
    index += 1
  }
  
  var count = 0
  for r in 0..<N {
    for c in 0..<M {
      if map[r][c] == 0 {
        count += 1
      }
    }
  }
  result = max(result, count)
}

// 반드시 3개의 벽이 세워져야함
func makeWall(count: Int) {
  
  if count == 3 {
    bfs()
    return
  }
  
  for r in 0..<N {
    for c in 0..<M {
      if map[r][c] == 0 {
        map[r][c] = 2
        makeWall(count: count + 1)
        map[r][c] = 0
      }
    }
  }
  
}

for r in 0..<N {
  for c in 0..<M {
    if map[r][c] == 2 {
      // 바이러스 처음 위치를 찾아서 퍼트림
      queue.append((r, c, 0))
    }
  }
}

makeWall(count: 0)

print(result)
