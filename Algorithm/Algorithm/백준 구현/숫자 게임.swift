//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/7/24.
//

import Foundation

/// 사람의 수
let n = Int(readLine()!)!

var cardInfo: [[Int]] = []

for _ in 0..<n {
    cardInfo.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var firstNumList: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
    var info = cardInfo[i]
    var maxCount = Int.min
    
    for j in 0..<5 {
        for k in j+1..<5 {
            for t in k+1..<5 {
                var sum = info[j] + info[k] + info[t]
                
                if maxCount < sum % 10 {
                    maxCount = sum % 10
                }
                
            }
        }
    }
    
    firstNumList[i] = maxCount
}


var maxCount = Int.min
var answer = 0

for i in 0..<n {
    if firstNumList[i] >= maxCount {
        maxCount = firstNumList[i]
        answer = i
    }
}

print(answer + 1)
