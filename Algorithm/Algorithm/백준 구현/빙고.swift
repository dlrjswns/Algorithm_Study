//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/29/24.
//

import Foundation

var bingoCheck = Array(repeating: Array(repeating: false, count: 5), count: 5) // 불렸는지 확인

var coordiInfo: [Int: (Int, Int)] = [:]

for i in 0..<5 { // 빙고판에 쓰여진 수
  let bingoList = readLine()!.split(separator: " ").map { Int(String($0))! }
  for j in 0..<bingoList.count {
    coordiInfo[bingoList[j]] = (i, j)
  }
}


mainLoop: for y in 0..<5 { // 사회자가 부르는 수
  let list = readLine()!.split(separator: " ").map { Int(String($0))! }
  for (index, callNumber) in list.enumerated() {
    let (xPosition, yPosition) = coordiInfo[callNumber]!
    bingoCheck[xPosition][yPosition] = true
    
    if checkBingo() { // 빙고외쳐야함
      print(y * 5 + index + 1)
//      print(bingoCheck)
      break mainLoop
    }
    
  }
}

func checkBingo() -> Bool {
  
  var count = 0
  var leftSlashCheck = true // X자 왼쪽 빙고인지 확인
  var rightSlashCheck = true // X자 오른쪽 빙고인지 확인

  
  for i in 0..<5 { // 가로로 빙고인지 확인
    if !bingoCheck[i].contains(false) {
      count += 1
    }
    
    var verticalCheck = true // 세로 빙고인지 확인
    
    for j in 0..<5 {
      if !bingoCheck[j][i] {
        verticalCheck = false
        break
      }
    }
    count += verticalCheck ? 1 : 0
    
    // 대각선 빙고인지 확인
    if !bingoCheck[i][i] {
      leftSlashCheck = false
    }
    
    if !bingoCheck[i][4-i] {
      rightSlashCheck = false
    }
    
  }
  
  count += leftSlashCheck ? 1 : 0
  count += rightSlashCheck ? 1 : 0

  return count > 2
}
