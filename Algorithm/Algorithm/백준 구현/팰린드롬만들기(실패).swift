//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/25/24.
//

import Foundation

let englishName = readLine()!.map { String($0) } // 임한수의 영어 이름

var availableList: [String: Int] = [:]

for name in englishName {
  availableList[name, default: 0] += 1
}

var sortedAvailabelList = availableList.sorted(by: { $0.key < $1.key })

  // 갯수가 홀수인 애들이 1보다 크면은 팰린드롬 불가
  if availableList.filter({ $0.value % 2 == 1 }).count > 1 {
    print("I'm Sorry Hansoo")
  }
  
  var result = ""
  
  if availableList.filter({ $0.value % 2 == 1 }).count == 1 {
    let letter = availableList.filter({ $0.value % 2 == 1 }).keys.first!
    availableList[letter]! -= 1
    
    result += letter
    for evenCountLetter in availableList.filter({ $0.value % 2 == 0 }).keys { // 개수가 짝수개인 단어들 순회
      availableList[evenCountLetter]! -= 2
      result = evenCountLetter + result + evenCountLetter
    }
  }

for key in availableList.keys.sorted(by: >) {
  
}
