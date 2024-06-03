//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 5/20/24.
//

import Foundation

let numberList = readLine()!.split(separator: " ").map { Int(String($0))! }

// 받은 리스트에서 시계수를 구하는 함수
func getClockNumber(list: [Int]) -> Int {
  var numList: [Int] = []
  
  for i in 0..<4 {
    numList.append(Int("\(list[i % 4])\(list[(i+1) % 4])\(list[(i+2) % 4])\(list[(i+3) % 4])")!)
  }
  
  return numList.min()!
}

// 1111 ~ 9999 까지 모든 계산수 리스트를 반환하는 함수
func getAllNumList() -> [Int] {
  var set: Set<Int> = []
      
      for i in 1...9 {
          for j in 1...9 {
              for k in 1...9 {
                  for m in 1...9 {
                      let num = [i, j, k, m]
                    set.insert(getClockNumber(list: num))
                  }
              }
          }
      }
      let sortedList = Array(set).sorted()
      return sortedList
}

print(getAllNumList().firstIndex(where: { $0 == getClockNumber(list: numberList) })! + 1)
