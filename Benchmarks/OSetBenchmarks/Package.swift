// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "OSetBenchmarks",
    dependencies: [
        .package(path: "../../common"),
        .package(url: "https://github.com/sciv-img/OSet", .exact("0.7.0")),
    ],
    targets: [
        .testTarget(
            name: "OSetBenchmarksTests",
            dependencies: ["common", "OSet"]
        ),
    ]
)
