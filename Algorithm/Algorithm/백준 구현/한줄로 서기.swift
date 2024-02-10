//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/26/24.
//

import Foundation

let N = Int(readLine()!)! // 사람의 수

var known: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! } // 각자 자신 왼편에 큰 사람이 몇명있는지 카운트

var answer: [Int] = Array(repeating: 0, count: N)

for (height, howManyBiggerThanMe) in known.enumerated() {
  /*
   height + 1: 사람의 키
   howManyBiggerThanMe: 사람의 왼편에 자기보다 키 큰 사람들이 몇명인지
   */

  var count = 0 // 앞에 나보다 키 큰 사람이 몇명인지 카운트
  
  for i in 0..<answer.count { // 정답을 순회하며 카운팅
    if answer[i] == 0 && count < howManyBiggerThanMe { // 나보다 키가 큰 사람이 왼편에 있다면
      count += 1
    }
    
    else if answer[i] == 0 && count == howManyBiggerThanMe {
      answer[i] = height + 1
      break
    }
  }
}

answer.forEach({ print($0, terminator: " ") })
