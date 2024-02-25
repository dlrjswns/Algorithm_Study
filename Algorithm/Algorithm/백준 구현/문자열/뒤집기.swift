//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/20/24.
//

import Foundation

let S = readLine()!.map { Int(String($0))! }

let zero = S.split(separator: 0).count
let one = S.split(separator: 1).count
print(min(zero, one))
