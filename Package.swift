// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "OSetBenchmarks",
    dependencies: [
        .package(url: "https://github.com/nvzqz/RandomKit", .exact("5.2.3")),
        .package(url: "../OSet", .exact("0.3.5")),
        .package(url: "https://github.com/bradhilton/OrderedSet", .revision("027fb128af31e8951cbbde9c377b18c90d8189cc")),
    ],
    targets: [
        .target(name: "OSetBenchmarks", path: "Sources"),
        .testTarget(
            name: "OSetBenchmarksTests",
            dependencies: ["RandomKit", "OSet", "OrderedSet", "OSetBenchmarks"]
        ),
    ]
)
