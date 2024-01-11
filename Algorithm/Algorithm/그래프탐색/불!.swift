//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/10/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = input[0], C = input[1] // R은 미로 행의 개수, C는 미로 열의 개수

var miro: [[Character]] = []

for _ in 0..<R {
  miro.append(Array(readLine()!))
}

var currentPosition: (Int, Int) = (-1, -1)
var firePosition: (Int, Int) = (-1, -1)

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var queue: [(Int, Int, Int)] = [] // 현재x좌표, y좌표, 걸린 시간
var index = 0
var visited = Array(repeating: Array(repeating: false, count: C), count: R)

var fireCount = Array(repeating: Array(repeating: 0, count: C), count: R)
var index1 = 0
var queue1: [(Int, Int, Int)] = [] // 어디에 불이 있는지

for i in 0..<R {
  for k in 0..<C {
    if miro[i][k] == "J" {
      currentPosition = (i, k)
      continue
    }
    
    if miro[i][k] == "F" {
      firePosition = (i, k)
      continue
    }
  }
}

func fire() {
  queue1.append((firePosition.0, firePosition.1, 0))
  fireCount[firePosition.0][firePosition.1] = 1
  
  while queue1.count > index1 {
    
    let (x, y, time) = queue1[index1]
    
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      
      if 0..<R ~= rx && 0..<C ~= ry && fireCount[rx][ry] == 0 && miro[rx][ry] != "#" {
        fireCount[rx][ry] = time + 1
        queue1.append((rx, ry, time + 1))
      }
    }
    
    index1 += 1
  }
}

func bfs() -> Bool {
  
  queue.append((currentPosition.0, currentPosition.1, 0))
  visited[currentPosition.0][currentPosition.1] = true
  
  while queue.count > index {
    
    let (x, y, time) = queue[index]
    
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      
      if (rx < 0 || ry < 0 || rx >= R || ry >= C) {//범위를 넘어가면 탈출 성공
        print(time + 1)
        return true
      }
      
      if 0..<R ~= rx && 0..<C ~= ry && !visited[rx][ry] && fireCount[rx][ry] > time + 1 {
        if miro[rx][ry] == "." {
          queue.append((rx, ry, time + 1))
          visited[rx][ry] = true
        }
      }
    }
    
    index += 1
  }
  return false
}

fire()
if !bfs() {
  print("IMPOSSIBLE")
}
//[[9223372036854775807, 9223372036854775807, 9223372036854775807, 9223372036854775807], [9223372036854775807, 1, 0, 9223372036854775807], [9223372036854775807, 2, 1, 9223372036854775807], [9223372036854775807, 3, 2, 9223372036854775807]]
//import Foundation
//
//let dx = [0,0,-1,1]
//let dy = [1,-1,0,0]
//
//// 불을 퍼트리는 함수
//func bfsFire() {
//    var index = 0
//
//    while fires.count > index {
//        let (x,y,cnt) = fires[index]
//        index += 1
//
//        for i in 0..<4 {
//            let (nx, ny) = (x + dx[i], y + dy[i])
//
//            guard (0..<r) ~= nx && (0..<c) ~= ny else { continue }
//            guard graph[nx][ny] != "#" && fireGraph[nx][ny] > cnt + 1 else { continue }
//
//            fireGraph[nx][ny] = cnt + 1
//            fires.append((nx,ny,cnt+1))
//        }
//    }
//}
//
//// 미로 길찾기 함수
//func bfs() {
//    var queue = [(sx,sy,0)]
//    var index = 0
//    visit[sx][sy] = true
//
//    while queue.count > index {
//        let (x,y,cnt) = queue[index]
//        index += 1
//
//        for i in 0..<4 {
//            let (nx, ny) = (x + dx[i], y + dy[i])
//
//            // 미로 탈출하면 결과 출력
//            guard (0..<r) ~= nx && (0..<c) ~= ny else {
//                print(cnt + 1)
//                return
//            }
//
//            // 벽이 아니고, 불이 붙지 않은 곳이고, 방문하지 않은 곳이라면 이동 한다
//            guard graph[nx][ny] != "#" && fireGraph[nx][ny] > cnt + 1 && !visit[nx][ny] else {
//                continue
//            }
//
//            visit[nx][ny] = true
//            queue.append((nx,ny,cnt+1))
//        }
//    }
//
//    print("IMPOSSIBLE")
//}
//
//let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
//let (r, c) = (T[0], T[1])
//
//var graph = [[Character]]()
//var fireGraph = Array(repeating: Array(repeating: Int.max, count: c), count: r)
//var visit = Array(repeating: Array(repeating: false, count: c), count: r)
//
//// 시작위치
//var sx: Int = 0, sy: Int = 0
//var fires: [(x: Int, y: Int, cnt: Int)] = []
//
//for i in 0..<r {
//    let input = Array(readLine()!)
//    graph.append(input)
//
//    for j in 0..<c {
//        if input[j] == "J" {
//            (sx, sy) = (i, j)
//            graph[i][j] = "."
//        } else if input[j] == "F" {
//            fires.append((i,j,0))
//            fireGraph[i][j] = 0
//        }
//    }
//}
//
//bfsFire()
//print(fireGraph)
//bfs()
