import UIKit

func solution02(options: [Int], numbers: [Int]) -> Int {
    var result = 0
    var numArr = numbers.sorted { n1, n2 in
        n1 > n2
    }
    
    var firstBigNum = numArr[0]
    var secondBigNum = numArr[1]
    
//    var N = options[0]
    var M = options[1]
    let K = options[2]
    
    while true {
        if M == 0 {
            break
        }
        
        for _ in 0..<K {
            result += firstBigNum
            M -= 1
            
            if M == 0 {
                break
            }
        }
        
        result += secondBigNum
        M -= 1
    }
    
    return result
}

solution02(options: [1, 3, 2], numbers: [4, 14, 2])
