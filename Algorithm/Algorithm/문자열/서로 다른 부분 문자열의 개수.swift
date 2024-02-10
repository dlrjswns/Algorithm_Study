//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/22/24.
//

import Foundation

let S = readLine()!.map { String($0) }
var list: Set<String> = []


for j in 0..<S.count {
  
  var str = ""
  
  for i in j..<S.count {
    str += S[i]
    list.insert(str)
  }
}

print(list.count)
