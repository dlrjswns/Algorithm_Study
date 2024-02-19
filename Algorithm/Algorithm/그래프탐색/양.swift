//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/17/24.
//

import Foundation
/*
 .은 빈 필드
 #은 울타리
 o는 양
 v는 늑대
 
 영약안의 양의 수 > 늑대의 수 양이 이기고 늑대를 우리에서 쫓아냄
 늑대의 수 > 양의 수인 경우 늑대가 그 지역안의 모든 양을 잡아먹음
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = input[0], C = input[1] // R은 행의 수, C는 열의 수

var area: [[String]] = []
var visited = Array(repeating: Array(repeating: false, count: C), count: R)


for _ in 0..<R {
  area.append(readLine()!.map { String($0) })
}

//var index = 0
//var queue: [(sheepCount: Int, wolfCount: Int)] = []

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func bfs(x: Int, y: Int) -> (sheepCount: Int, wolfCount: Int) {
  
  var index = 0
  var queue: [(x: Int, y: Int)] = [(x, y)]
  
  var sheepCount = area[x][y] == "o" ? 1 : 0
  var wolfCount = area[x][y] == "v" ? 1 : 0
  
  while queue.count > index {
    
    let (x, y) = queue[index]
    
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      
      if 0..<R ~= rx && 0..<C ~= ry && area[rx][ry] != "#" && !visited[rx][ry] {
        if area[rx][ry] == "v" { // 늑대라면
          wolfCount += 1
          queue.append((rx, ry))
          visited[rx][ry] = true
        } else if area[rx][ry] == "o" { // 양이라면
          sheepCount += 1
          queue.append((rx, ry))
          visited[rx][ry] = true
        } else { // 빈 필드라면
          queue.append((rx, ry))
          visited[rx][ry] = true
        }
      }
    }
    
    index += 1
  }

  return (sheepCount, wolfCount)
}


var totalWolfCount = 0
var totalSheepCount = 0

for r in 0..<R {
  for c in 0..<C {
    if !visited[r][c] && (area[r][c] == "v" || area[r][c] == "o") {
      visited[r][c] = true
      let (sheepCount, wolfCount) = bfs(x: r, y: c)
      totalWolfCount += sheepCount > wolfCount ? 0 : wolfCount
      totalSheepCount += sheepCount > wolfCount ? sheepCount : 0
    }
  }
}

print(totalSheepCount, terminator: " ")
print(totalWolfCount)
