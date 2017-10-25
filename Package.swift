// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "OSetBenchmarks",
    dependencies: [
        .Package(url: "https://github.com/nvzqz/RandomKit", Version(5, 2, 3)),
        .Package(url: "../OSet", Version(0, 3, 5))
    ]
)
