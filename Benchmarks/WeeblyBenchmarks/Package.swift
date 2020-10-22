// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "WeeblyBenchmarks",
    dependencies: [
        .package(path: "../../common"),
        .package(url: "https://github.com/Weebly/OrderedSet", .exact("5.0.0")),
    ],
    targets: [
        .testTarget(
            name: "WeeblyBenchmarksTests",
            dependencies: ["common", "OrderedSet"]
        ),
    ]
)
