//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/23.
//

import Foundation

let croatiaList = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="] // 변경된 크로아타 알파벳 리스트

var inputLetter = readLine()! // 입력받은 문자열

for croatia in croatiaList {
  inputLetter = inputLetter.replacingOccurrences(of: croatia, with: "1")
}

print(inputLetter.count)
