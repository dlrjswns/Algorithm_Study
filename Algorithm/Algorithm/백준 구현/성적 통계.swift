//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/2/24.
//

import Foundation

let K = Int(readLine()!)! // 고등학교의 반의 수
var classNum = 1 // 반의 번호

for _ in 0..<K {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let studentNum = input[0] // 반의 학생 수
  var mathScoreList = input[1...] // 반의 학생들의 수학성적 리스트
  var largestGap = 0
  
  mathScoreList.sort(by: >)
  
  for i in 1..<mathScoreList.count {
    largestGap = max(largestGap, mathScoreList[i] - mathScoreList[i + 1])
  }

  print("Class \(classNum)\nMax \(mathScoreList.first!), Min \(mathScoreList.last!), Largest gap \(largestGap)")
  classNum += 1
}
