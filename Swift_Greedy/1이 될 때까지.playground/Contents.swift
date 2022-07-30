import Foundation

func becomeOne(n: Int, k: Int) -> Int {
    var count = 0
    var newN = n
    while(newN != 1) {
        if newN % k == 0 {
          newN /= k
          count += 1
        } else {
            newN -= 1
            count += 1
        }
    }
    
    return count
}

becomeOne(n: 25, k: 5)
