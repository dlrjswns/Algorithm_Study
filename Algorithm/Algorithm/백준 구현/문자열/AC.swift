//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/27.
//

import Foundation

let T = Int(readLine()!)! // 테스트케이스 갯수
for _ in 0..<T {
  let function = readLine()! // 입력된 함수
  let n = Int(readLine()!)! // n은 배열에 들어갈 수의 갯수
  let numList = readLine()!.dropFirst().dropLast().split(separator: ",").map { String($0) }
  var isError = false
  var isReverse = false
  var head = 0
  var tail = numList.count - 1
  
  for f in function {
    
    if f == "R" {
      isReverse.toggle()
    } else if f == "D" && numList.isEmpty {
      isError.toggle()
      break
    } else if f == "D" && !numList.isEmpty {
      
      if head > tail {
        isError = true
        break
      }
      
      if isReverse {
        tail -= 1
      } else {
        head += 1
      }
    }
  }
  
  if isError {
    print("error")
  } else {
    if head > tail {
     print("[]")
    } else {
      if isReverse {
        print("[\(numList[head...tail].reversed().joined(separator: ","))]")
      } else {
        print("[\(numList[head...tail].joined(separator: ","))]")
      }
    }
  }
}


