import XCTest
import common // BenchmarksInputs

class ArrayBenchmarks: XCTestCase {
    func testInit() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            _ = Array(input1_1)
        }
    }

    func testContains() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            _ = input1_1.contains(input1_1[102400])
        }
    }

    func testInsert() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            var i1 = input1_1
            i1.append("SOMEOTHERSTRINGTEST")
        }
    }

    func testRemove() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            var i1 = input1_1
            i1.remove(at: i1.index(of: input1_1[102400])!)
        }
    }

    func testUpdate() {
        let (input1_1, _, _) = BenchmarksInputs.inputsBig

        self.measure {
            var i1 = input1_1
            i1.append("SOMEOTHERSTRINGTEST")
        }
    }

    func testUnion() {
        let (input1_1, input1_2, _) = BenchmarksInputs.inputsMedium

        self.measure {
            _ = input1_1 + input1_2
        }
    }

    func testIntersection() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let i1 = input1_1 + input1_2 + input2

        self.measure {
            _ = i1.filter({ input1_2.contains($0) })
        }
    }

    func testSymmetricDifference() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let i1 = input1_1 + input1_2
        let i2 = input1_2 + input2

        self.measure {
            let isec = i1.filter({ i2.contains($0) })
            _ = (i1 + i2).filter({ !isec.contains($0) })
        }
    }

    func testSubtracting() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsSmall

        let i1 = input1_1 + input1_2
        let i2 = input2 + input1_1

        self.measure() {
            _ = i2.filter({ i1.contains($0) })
        }
    }

    func testIteration() {
        let (input1_1, input1_2, input2) = BenchmarksInputs.inputsMedium

        let i1 = input1_1 + input1_2 + input2

        self.measure {
            for e in i1 {
                _ = e
            }
        }
    }
}
