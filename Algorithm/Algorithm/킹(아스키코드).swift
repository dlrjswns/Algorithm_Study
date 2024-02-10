//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/6/24.
//

import Foundation
/*
 열 -> A H
 행 -> 1 8
 */

// String을 아스키 코드로
extension String {
    func toNum() -> Int { // A는 1로
        Int(Character(self).asciiValue! - Character("A").asciiValue!) + 1
    }
}

// 아스키 코드를 String으로
extension Int { // 1은 A로
    func toString() -> String {
        String(Character(UnicodeScalar(UInt8(self) + Character("A").asciiValue! - 1)))
    }
}

let input = readLine()!.split(separator: " ")
var kingPosition = input[0].map { String($0) } // 킹의 위치
let stonePosition = input[1].map { String($0) } // 돌의 위치
let moveCount = Int(input[2])! // 움직이는 횟수

var resultKingPosition = (Int(kingPosition[1])!, kingPosition[0].toNum())
var resultStonePosition = (Int(stonePosition[1])!, stonePosition[0].toNum())

for _ in 0..<moveCount {
  let moveInfo = String(readLine()!) // 움직이는 정보
  let moveKingPosition = move(direction: moveInfo, position: resultKingPosition)
  
  // 킹이 이동하고자하는 위치가 체스판을 벗어나지않다면
  if 1...8 ~= moveKingPosition.0 && 1...8 ~= moveKingPosition.1 {
    
    // 킹이 이동하고자하는 위치가 스톤이 위치한 곳이라면
    if moveKingPosition == resultStonePosition {

      let moveStonePosition = move(direction: moveInfo, position: resultStonePosition)
      
      // 스톤이 이동하고자하는 위치가 체스판을 벗어나지않다면
      if 1...8 ~= moveStonePosition.0 && 1...8 ~= moveStonePosition.1 {
        resultStonePosition = moveStonePosition
        resultKingPosition = moveKingPosition
        continue
      }
      
    } else {
      resultKingPosition = moveKingPosition
    }
    
  }
  
}

print(resultKingPosition.1.toString() + "\(resultKingPosition.0)")
print(resultStonePosition.1.toString() + "\(resultStonePosition.0)")

func move(direction: String, position: (Int, Int)) -> (Int, Int) {
  var position = position
  if direction == "R" {
    position.1 += 1
  } else if direction == "L" {
    position.1 -= 1
  } else if direction == "B" {
    position.0 -= 1
  } else if direction == "T" {
    position.0 += 1
  } else if direction == "RT" {
    position.1 += 1
    position.0 += 1
  } else if direction == "LT" {
    position.1 -= 1
    position.0 += 1
  } else if direction == "RB" {
    position.1 += 1
    position.0 -= 1
  } else if direction == "LB" {
    position.1 -= 1
    position.0 -= 1
  }
  return position
}


