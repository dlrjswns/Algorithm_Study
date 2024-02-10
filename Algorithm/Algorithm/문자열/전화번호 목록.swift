//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/21/24.
//

import Foundation

let t = Int(readLine()!)! // 테스트 케이스의 개수

for _ in 0..<t {
  let n = Int(readLine()!)!
  var phoneNumberList: [String] = []
  
  for _ in 0..<n {
    phoneNumberList.append(String(readLine()!))
  }
  
  phoneNumberList.sort()
  
  print("리스트 \(phoneNumberList)")
  
  if isConsistency(phoneNumberList: phoneNumberList) {
    print("YES")
  } else {
    print("NO")
  }
}

func isConsistency(phoneNumberList: [String]) -> Bool {
  
  for i in 0..<phoneNumberList.count - 1 {
    if phoneNumberList[i + 1].hasPrefix(phoneNumberList[i]) {
      return false
    }
  }
  
  return true
}
