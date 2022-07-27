import UIKit

var N = 1260
var moneys = [500, 100, 50, 10]
var count = 0
for money in moneys {
    count += N / money
    N %= money
    if N == 0 {
        print("count = \(count)")
    }
}
