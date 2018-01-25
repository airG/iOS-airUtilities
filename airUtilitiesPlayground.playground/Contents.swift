//: Playground - noun: a place where people can play

import UIKit

struct Placeholder<Key, Value> where Key: Hashable {
    var values: [(Key, Value)] = []
    
    func firstValue(matchingKey key: Key) -> Value? {
        return values.first { (k, value) -> Bool in
            return key == k
            }?.1
    }
    
    mutating func removeValue(key: Key) {
        values = values.filter({ $0.0 != key })
    }
}

struct MyDictionary<Key, Value> where Key: Hashable {
    private var storage = Array(repeating: Placeholder<Key, Value>(), count: 8)
    
    subscript(key: Key) -> Value? {
        get {
            let position = abs(key.hashValue) % storage.count
            return storage[position].firstValue(matchingKey: key)
        }
        set {
            guard let value = newValue else { return }
            remove(key: key)
            let position = abs(key.hashValue) % storage.count
            storage[position].values.append((key, value))
            resizeIfNeeded()
        }
    }
    
    mutating func remove(key: Key) {
        let position = abs(key.hashValue) % storage.count
        storage[position].removeValue(key: key)
    }

    private let maxLoadFactor = 0.7
    
    private var size: Int { return storage.count }
    
    var count: Int { return storage.flatMap({ $0.values }).count }
    
    var currentLoadFactor: Double {
        return Double(count)/Double(size)
        
    }
    
    mutating func resizeIfNeeded() {
        if currentLoadFactor > maxLoadFactor {
            let oldDictionary = self
            storage = Array(repeating: Placeholder<Key, Value>(), count: size*2)
            for (key, value) in oldDictionary {
                self[key] = value
            }
        }
    }
}

extension MyDictionary: Sequence {
    typealias Iterator = IndexingIterator<[(Key, Value)]>
    
    func makeIterator() -> Iterator {
        return storage.flatMap({ $0.values }).makeIterator()
    }
}

var myD = MyDictionary<String, String>()
myD["One"] = "One"
myD["Two"] = "t"

for pair in myD {
    print(pair)
}
myD.count

print(String(describing: myD["One"]))

