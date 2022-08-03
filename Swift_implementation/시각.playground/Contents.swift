import Foundation

func time(n: Int) {
    var hourEnd = n
    var minuteEnd = 60
    var secondEnd = 60
    var count = 0
    
    for hour in 0...hourEnd {
        for minute in 0..<minuteEnd {
            for second in 0..<secondEnd {
                var string = String(hour) + String(minute) + String(second)
                if string.contains("3") {
                    count += 1
                }
            }
        }
    }
    
    print("count = \(count)")
}

time(n: 5)
