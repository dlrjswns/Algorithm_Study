//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/22/24.
//

import Foundation

func isBalance(inputLetter: String) -> Bool {
  
  var charList: [Character] = []
  
  for ch in inputLetter {
    
    if !["[", "]", "(", ")"].contains(ch) {
      continue
    }
    
    
    if ch == ")" && charList.last == "(" {
      _ = charList.removeLast()
    } else if ch == "]" && charList.last == "[" {
      _ = charList.removeLast()
    } else {
      charList.append(ch)
    }
    
  }
  
  return charList.isEmpty
}

var answerList: [Bool] = []

while true {
  let inputLetter = String(readLine()!)
  
  if inputLetter == "." {
    break
  }
  
  answerList.append(isBalance(inputLetter: inputLetter))
}

for answer in answerList {
  print(answer ? "yes" : "no")
}
