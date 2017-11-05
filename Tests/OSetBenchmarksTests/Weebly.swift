import XCTest
import OSetBenchmarks

class WeeblyBenchmarks: XCTestCase {
    func testContains() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(sequence: input1_1)

        self.measure {
            _ = orderedset1.contains(input1_1[102400])
        }
    }

    func testInsert() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(sequence: input1_1)

        self.measure {
            let o1 = orderedset1
            o1.append("SOMEOTHERSTRINGTEST")
        }
    }

    func testRemove() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(sequence: input1_1)

        self.measure {
            let o1 = orderedset1
            _ = o1.remove(input1_1[102400])
        }
    }

    func testUpdate() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let orderedset1 = OrderedSet(sequence: input1_1)

        self.measure {
            let o1 = orderedset1
            o1.append("SOMEOTHERSTRINGTEST")
        }
    }

    func testUnion() {
        let (input1_1, input1_2, _) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(sequence: input1_1)
        let orderedset2 = OrderedSet(sequence: input1_2)

        self.measure {
            _ = orderedset1 + orderedset2
        }
    }

    func testIntersection() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(sequence: input1_1 + input1_2 + input2)
        let orderedset2 = OrderedSet(sequence: input1_2)

        self.measure {
            let orderedset = OrderedSet<String>()
            for other in orderedset2 {
                if orderedset1.contains(other) {
                    orderedset.append(other)
                }
            }
        }
    }

    func testSymmetricDifference() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(sequence: input1_1 + input1_2)
        let orderedset2 = OrderedSet(sequence: input1_2 + input2)

        self.measure {
            let orderedset = orderedset1
            for other in orderedset2 {
                if orderedset1.contains(other) {
                    orderedset.remove(other)
                } else {
                    orderedset.append(other)
                }
            }
        }
    }

    func testSubtracting() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let orderedset1 = OrderedSet(sequence: input1_1 + input1_2 + input2)
        let orderedset2 = OrderedSet(sequence: input1_2)

        self.measure {
            _ = orderedset1 - orderedset2
        }
    }

    func testIteration() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let orderedset1 = OrderedSet(sequence: input1_1 + input1_2 + input2)

        self.measure {
            for e in orderedset1 {
                _ = e
            }
        }
    }
}
