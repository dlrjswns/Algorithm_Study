//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/24/24.
//

import Foundation

/*
 1. 좌표의 가장 위에 있는 블록제거 후 인벤토리 넣음
 2. 인벤토리에서 블록 하나 꺼내 좌표의 가장 위에 블록 위에 놓음
 1번 작업은 2초, 2번작업은 1초 걸림
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], B = input[2]

var laneHeight: [Int] = []

for _ in 0..<N {
  var landInput = readLine()!.split(separator: " ").map { Int(String($0))! }
  laneHeight += landInput
}

var maxHeight = 0
var time = Int.max

for balance in laneHeight.min()!...laneHeight.max()! {
  
  var inventoryAddedBlock = 0 // 인벤토리에 추가되야할 제거한 블록 개수를 카운팅
  var makeBlockCount = 0 // 인벤토리에서 블록을 꺼내 올린 개수 카운팅
  
  for height in laneHeight {
    if balance - height > 0 { // 블록이 추가되야함 -> 방법 1
      makeBlockCount += (balance - height)
    } else { // 블록을제거해 인벤토리 넣어야함 -> 방법 2
      inventoryAddedBlock += (height - balance)
    }
  }
  
  if B + inventoryAddedBlock >= makeBlockCount { // B에 해당하는 개수에 충족할 때
    maxHeight = max(maxHeight, balance)
    time = min(time, makeBlockCount * 2 + inventoryAddedBlock)
  }
}

print(time, terminator: " ")
print(maxHeight)


