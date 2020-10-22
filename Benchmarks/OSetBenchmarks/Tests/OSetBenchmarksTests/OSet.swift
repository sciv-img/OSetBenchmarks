import XCTest
import OSet
import common // BenchmarksInputs

class OSetBenchmarks: XCTestCase {
    func testInit() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            _ = OSet(input1_1)
        }
    }

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

    private func baseUnion(_ inputs: ([String], [String], [String])) {
        let (input1_1, input1_2, _) = inputs

        let oset1 = OSet(input1_1)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.union(oset2)
        }
    }

    func testUnion() {
        self.baseUnion(BenchmarksInputs.inputsSmall)
    }

    func testOSetOnlyUnion() {
        self.baseUnion(BenchmarksInputs.inputsMedium)
    }

    private func baseIntersection(_ inputs: ([String], [String], [String])) {
        let (input1_1, input1_2, input2) = inputs

        let oset1 = OSet(input1_1 + input1_2 + input2)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.intersection(oset2)
        }
    }

    func testIntersection() {
        self.baseIntersection(BenchmarksInputs.inputsSmall)
    }

    func testOSetOnlyIntersection() {
        self.baseIntersection(BenchmarksInputs.inputsMedium)
    }

    private func baseSymmetricDifference(_ inputs: ([String], [String], [String])) {
        let (input1_1, input1_2, input2) = inputs

        let oset1 = OSet(input1_1 + input1_2)
        let oset2 = OSet(input1_2 + input2)

        self.measure {
            _ = oset1.symmetricDifference(oset2)
        }
    }

    func testSymmetricDifference() {
        self.baseSymmetricDifference(BenchmarksInputs.inputsSmall)
    }

    func testOSetOnlySymmetricDifference() {
        self.baseSymmetricDifference(BenchmarksInputs.inputsMedium)
    }

    private func baseSubtracting(_ inputs: ([String], [String], [String])) {
        let (input1_1, input1_2, input2) = inputs

        let oset1 = OSet(input1_1 + input1_2 + input2)
        let oset2 = OSet(input1_2)

        self.measure {
            _ = oset1.subtracting(oset2)
        }
    }

    func testSubtracting() {
        self.baseSubtracting(BenchmarksInputs.inputsSmall)
    }

    func testOSetOnlySubtracting() {
        self.baseSubtracting(BenchmarksInputs.inputsMedium)
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
