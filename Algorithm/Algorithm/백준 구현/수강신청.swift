//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/1/24.
//

import Foundation

let kl = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = kl[0], l = kl[1]

var studentNumList: [String: Int] = [:] // (학번, 마지막 신청한 인덱스)

for i in 0..<l {
    let studentNum = readLine()! // 학번
    studentNumList[studentNum] = i
}

private func getSuccessStudentList() {
    
    let sortedStudentNumList = studentNumList.sorted(by: { $0.value < $1.value })
    
    var result: [String] = []
    for i in 0..<min(k, sortedStudentNumList.count) {
        result.append(sortedStudentNumList[i].key)
    }
    
    result.forEach { print($0) }
}

getSuccessStudentList()
