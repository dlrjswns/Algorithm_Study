//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/8/24.
//

import Foundation

var letter = Array(readLine()!)
var newLetter: [String] = []

for i in 0..<letter.count - 2 {
  for j in i+1..<letter.count - 1 {
    for k in j+1..<letter.count {
      
      newLetter.append(String(letter[0..<j].reversed()) + String(letter[j..<k].reversed()) + String(letter[k...].reversed()))
    }
  }
}

print(newLetter.sorted()[0])

