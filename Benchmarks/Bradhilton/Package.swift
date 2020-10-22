// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "BradhiltonBenchmarks",
    dependencies: [
        .package(path: "../../common"),
        // this is https://github.com/bradhilton/OrderedSet
        // using fork with fixed SwiftPM support
        .package(url: "https://github.com/Saklad5/OrderedSet", .branch("patch-1")),
    ],
    targets: [
        .testTarget(
            name: "BradhiltonBenchmarksTests",
            dependencies: ["common", "OrderedSet"]
        ),
    ]
)
