import XCTest
import OSet

class OSetBenchmarks: XCTestCase {
    func testContains() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let oset1 = OSet(input1_1)

        self.measure {
            _ = oset1.contains(input1_1[102400])
        }
    }

    func testInsert() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let oset1 = OSet(input1_1)

        self.measure {
            var o1 = oset1
            o1.insert("SOMEOTHERSTRINGTEST")
        }
    }

    func testRemove() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let oset1 = OSet(input1_1)

        self.measure {
            var o1 = oset1
            o1.remove(input1_1[102400])
        }
    }

    func testUpdate() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        let oset1 = OSet(input1_1)

        self.measure {
            var o1 = oset1
            o1.update(with: "SOMEOTHERSTRINGTEST")
        }
    }

    func testUnion() {
        let (input1_1, input1_2, _) = BenchmarksInputs.inputsMedium

        let oset1 = OSet(input1_1)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.union(oset2)
        }
    }

    func testIntersection() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let oset1 = OSet(input1_1 + input1_2 + input2)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.intersection(oset2)
        }
    }

    func testSymmetricDifference() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let oset1 = OSet(input1_1 + input1_2)
        let oset2 = OSet(input1_2 + input2)

        self.measure {
            _ = oset1.symmetricDifference(oset2)
        }
    }

    func testSubtracting() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let oset1 = OSet(input1_1 + input1_2 + input2)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.subtracting(oset2)
        }
    }

    func testIteration() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let oset1 = OSet(input1_1 + input1_2 + input2)

        self.measure {
            for e in oset1 {
                _ = e
            }
        }
    }
}
