import Cocoa


var fib_nums = [0,1]

func fib_recalculate(original : [Int], nth_Fibb : Int) -> [Int] {
    var copy = original
    
    if nth_Fibb - 1 < copy.count {
        return copy
    }
    
    for _ in copy.count...nth_Fibb - 1 {
        let top = copy.count - 1
        let bottom = top - 1
        
        copy.append(copy[top] + copy[bottom])
    }
    
    return copy
}

func get_Nth_fib(fibb : Int, memoized_fibs : inout [Int]) -> Int {
    if fibb <= memoized_fibs.count {
        return memoized_fibs[fibb - 1]
    }
    
    memoized_fibs = fib_recalculate(original: memoized_fibs, nth_Fibb: fibb)
    
    assert(fibb <= memoized_fibs.count)
    
    return memoized_fibs[fibb - 1]
}

get_Nth_fib(fibb: 5, memoized_fibs: &fib_nums)


get_Nth_fib(fibb: 3, memoized_fibs: &fib_nums)

