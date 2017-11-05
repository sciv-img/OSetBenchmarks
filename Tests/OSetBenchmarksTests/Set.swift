import XCTest

class SetBenchmarks: XCTestCase {
    func testContains() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let set1 = Set(input1_1)

        self.measure {
            _ = set1.contains(input1_1[102400])
        }
    }

    func testInsert() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let set1 = Set(input1_1)

        self.measure {
            var o1 = set1
            o1.insert("SOMEOTHERSTRINGTEST")
        }
    }

    func testRemove() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let set1 = Set(input1_1)

        self.measure {
            var o1 = set1
            o1.remove(input1_1[102400])
        }
    }

    func testUpdate() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let set1 = Set(input1_1)

        self.measure {
            var o1 = set1
            o1.update(with: "SOMEOTHERSTRINGTEST")
        }
    }

    func testUnion() {
        let (input1_1, input1_2, _) = BenchmarksInputs.inputsSmall

        let set1 = Set(input1_1)
        let set2 = Set(input1_2)

        self.measure {
            _ = set1.union(set2)
        }
    }

    func testIntersection() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let set1 = Set(input1_1 + input1_2 + input2)
        let set2 = Set(input1_2)

        self.measure {
            _ = set1.intersection(set2)
        }
    }

    func testSymmetricDifference() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let set1 = Set(input1_1 + input1_2)
        let set2 = Set(input1_2 + input2)

        self.measure {
            _ = set1.symmetricDifference(set2)
        }
    }

    func testSubtracting() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let set1 = Set(input1_1 + input1_2 + input2)
        let set2 = Set(input1_2)

        self.measure {
            _ = set1.subtracting(set2)
        }
    }

    func testIteration() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let set1 = Set(input1_1 + input1_2 + input2)

        self.measure {
            for e in set1 {
                _ = e
            }
        }
    }
}
