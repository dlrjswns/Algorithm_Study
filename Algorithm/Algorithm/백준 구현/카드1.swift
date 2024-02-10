//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/29/24.
//

import Foundation

/*
 1부터 N까지 카드에 번호가 붙음
 1번카드가 제일 위 N번카드가 제일 아래 -> 큐
 
 1. 제일 위에 있는 카드 버림 -> 맨 앞에 카드 pop
 2. 그 다음 위에 있는 카드를 맨 아래로 이동 -> 맨 앞에 카드 pop해서 맨 뒤로 append
 */

let N = Int(readLine()!)!
var cardList = Array(repeating: 0, count: N)

for i in 0..<cardList.count {
  cardList[i] = i + 1
}

while !cardList.isEmpty {
  
  // 맨 앞에 카드 pop
  let removeElement = cardList.removeFirst()
  print(removeElement, terminator: " ")
  
  if !cardList.isEmpty {
    // 맨 앞에 카드 pop 한번 더
    let firstElement = cardList.removeFirst()
    
    // pop한 카드 맨 뒤로 이동
    cardList.append(firstElement)
  }
}
