//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/31/24.
//

import Foundation

/*
 영식이가 누울 수 있는 자리를 찾는 함수 -> 2칸 이상의 빈칸이 존재하는지
 
 */

let N = Int(readLine()!)! // 방의 크기
var roomInfo: [[String]] = []


for _ in 0..<N {
  roomInfo.append(readLine()!.map { String($0) })
}

func countHorizontalSleep() -> Int { // 가로로 누울 수 있는 자리의 개수를 카운트하는 함수
  var count = 0
  
  for i in 0..<N {
    let info = roomInfo[i].split(separator: "X").map { $0.count }
    for cnt in info {
      if cnt >= 2 {
        count += 1
      }
    }
  }
  
  return count
}

func countVerticalSleep() -> Int { // 세로로 누울 수 있는 자리의 개수를 카운트하는 함수
  
  var count = 0
  
  for i in 0..<N {
    
    var columnStr: [String] = []
    
    for j in 0..<N {
      columnStr.append(roomInfo[j][i])
    }
    
    let info = columnStr.split(separator: "X").map { $0.count }
    
    for cnt in info {
      if cnt >= 2 {
        count += 1
      }
    }
  }
  
  return count
}

print(countHorizontalSleep(), terminator: " ")
print(countVerticalSleep())
