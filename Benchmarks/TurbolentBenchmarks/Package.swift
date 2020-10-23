// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "TurbolentBenchmarks",
    dependencies: [
        .package(path: "../../common"),
        .package(url: "https://github.com/turbolent/OrderedSet", .exact("0.2.0")),
    ],
    targets: [
        .testTarget(
            name: "TurbolentBenchmarksTests",
            dependencies: ["common", "OrderedSet"]
        ),
    ]
)
