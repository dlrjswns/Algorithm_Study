//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/9/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let C = input[0], R = input[1] // 가로로 C개, 세로로 R개
let K = Int(readLine()!)! // 몇번째인지 찾아야하는 좌석 번호

var number = 1
var idx = 0

var visited = Array(repeating: Array(repeating: false, count: C+1), count: R+1)

// 북, 동, 남, 서
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var currentPosition = (0, -1)

func isValid(x: Int, y: Int) -> Bool {
  // x는 가로 개수까지, y는 세로 개수까지
  return 1...C ~= x && 1...R ~= y
}

if C * R < K { // 좌석보다 대기번호가 긴 경우 좌석을 배정할 수 없음
  print(0)
} else {
  while number <= C * R {
    
    var rx = dx[idx] + currentPosition.0
    var ry = dy[idx] + currentPosition.1
    
    if !isValid(x: rx, y: ry) || visited[ry][rx] {
      // 이동한 좌표가 이미 방문했거나 공연장을 벗어났다면
      
      // 공연장 방향 변경
      idx = (idx + 1) % 4
      
      // 변경된 방향으로 이동
      rx = dx[idx] + currentPosition.0
      ry = dy[idx] + currentPosition.1
    }
    
    visited[ry][rx] = true
    
    if number == K { // 찾고자 하는 번호에 다달았을때
      print("\(rx) \(ry)")
      break
    }
    
    currentPosition = (rx, ry)
    number += 1
  }
}


