import Foundation

struct CountedSet<Element: Hashable> {

    private var dictionary: [Element: Int] = [:]
    var count: Int {
        return dictionary.count
    }
    var isEmpty: Bool {
        return count == 0
    }

    mutating func insert(_ item: Element) {
        if dictionary.keys.contains(item) {
            if let number = dictionary[item] {
                dictionary[item] = number + 1
            }
        } else {
            dictionary[item] = 1
        }
    }

    mutating func remove(_ item: Element) {

        if let quantity = dictionary[item],
            quantity > 1 {
            dictionary[item] = quantity - 1
        } else {
            dictionary.removeValue(forKey: item)
        }
    }

    func contains(_ item: Element) -> Bool {
        return dictionary.keys.contains(item)
    }

    subscript(_ member: Element) -> Int {
        if let quantity = dictionary[member] {
            return quantity
        } else {
            return 0
        }
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element

    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

var testSet = CountedSet<Double>()

testSet.insert(2.3)

for _ in 0...109 {
    testSet.insert(4.2)
}
testSet[4.8]
for _ in 0...100 {
    testSet.remove(4)
}

var otherTestSet: CountedSet = ["Mike", "John", "Sarah", "Mike", "Mike"]
otherTestSet.insert("Harry")
otherTestSet["Mike"]

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
print(myCountedSet.contains(.dwarvish))
