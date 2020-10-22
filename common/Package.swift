// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "common",
    products: [
        .library(name: "common", targets: ["common"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-gen", .exact("0.3.0")),
    ],
    targets: [
        .target(name: "common", dependencies: ["Gen"], path: "Sources"),
    ]
)
