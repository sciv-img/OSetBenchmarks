import XCTest
import OrderedSet

class BradhiltonBenchmarks: XCTestCase {
    func testContains() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(input1_1)

        self.measure {
            _ = orderedset1.contains(input1_1[102400])
        }
    }

    func testInsert() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(input1_1)

        self.measure {
            var o1 = orderedset1
            o1 += ["SOMEOTHERSTRINGTEST"]
        }
    }

    func testRemove() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(input1_1)

        self.measure {
            var o1 = orderedset1
            _ = o1.remove(input1_1[102400])
        }
    }

    func testUpdate() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(input1_1)

        self.measure {
            var o1 = orderedset1
            o1 += ["SOMEOTHERSTRINGTEST"]
        }
    }

    func testUnion() {
        let (input1_1, input1_2, _) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(input1_1)
        let orderedset2 = OrderedSet(input1_2)

        self.measure {
            _ = orderedset1.union(orderedset2)
        }
    }

    func testIntersection() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(input1_1 + input1_2 + input2)
        let orderedset2 = OrderedSet(input1_2)

        self.measure {
            _ = orderedset1.intersection(orderedset2)
        }
    }

    func testSymmetricDifference() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(input1_1 + input1_2)
        let orderedset2 = OrderedSet(input1_2 + input2)

        self.measure {
            _ = orderedset1.symmetricDifference(orderedset2)
        }
    }

    func testSubtracting() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(input1_1 + input1_2 + input2)
        let orderedset2 = OrderedSet(input1_2)

        self.measure {
            _ = orderedset1.subtracting(orderedset2)
        }
    }

    func testIteration() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let orderedset1 = OrderedSet(input1_1 + input1_2 + input2)

        self.measure {
            for e in orderedset1 {
                _ = e
            }
        }
    }
}
