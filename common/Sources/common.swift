import Gen

public struct BenchmarksInputs {
    private static func createInput(_ seed: UInt64, _ n: Int) -> [String] {
        var r = Xoshiro(seed: seed)
        return Gen.letterOrNumber.string(of: .int(in: 1...20)).array(of: .always(n)).run(using: &r)
    }
    private static func createInputs(_ n: Int) -> ([String], [String], [String]) {
        return (createInput(0, n), createInput(33, n), createInput(1970, n))
    }

    public static let inputsBig = BenchmarksInputs.createInputs(2000000)
    public static let inputsMedium = BenchmarksInputs.createInputs(100000)
    public static let inputsSmall = BenchmarksInputs.createInputs(2000)
}
