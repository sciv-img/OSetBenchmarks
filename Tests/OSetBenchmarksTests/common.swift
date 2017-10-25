import RandomKit

struct BenchmarksInputs {
    private static func createInputs(_ n: Int) -> ([String], [String], [String]) {
        let input1_1 = [String](randomCount: n, using: &MersenneTwister.default)
        let input1_2 = [String](randomCount: n, using: &MersenneTwister.default)
        let input2 = [String](randomCount: n, using: &ChaCha.default)
        return (input1_1, input1_2, input2)
    }

    public static let inputsBig = BenchmarksInputs.createInputs(2000000)
    public static let inputsMedium = BenchmarksInputs.createInputs(100000)
    public static let inputsSmall = BenchmarksInputs.createInputs(2000)
}
