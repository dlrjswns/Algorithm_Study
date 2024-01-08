//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/4/24.
//

import Foundation

let letterList = readLine()!.map { String($0) }

var tag = ""
var word = ""

for letter in letterList {
  if letter == "<" {
    if !word.isEmpty {
      print(String(word.reversed()), terminator: "")
      word = ""
    }
      tag.append(letter)
  }
  else if letter == ">" {
    if !tag.isEmpty {
      tag.append(letter)
      print(tag, terminator: "")
      tag = ""
    }
  }
  else {
    if !tag.isEmpty {
      tag.append(letter)
    } else if letter == " " {
      print(String(word.reversed()), terminator: " ")
      word = ""
    }
    else {
      word.append(letter)
    }
  }
}
if !word.isEmpty {
  print(String(word.reversed()), terminator: "")
}
