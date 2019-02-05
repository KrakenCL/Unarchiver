// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Unarchiver",
    products: [
        .library(name: "Unarchiver", targets: ["Unarchiver"]),
    ],
    dependencies: [],
    targets: [
        .systemLibrary(name: "CZlib", path: "Library/CZlib", pkgConfig: "libz", providers: [ .brew(["zlib"]), .apt(["libz-dev"])]),
        .target(name: "Unarchiver",dependencies: ["CZlib"]),
        .testTarget(name: "UnarchiverTests", dependencies: ["Unarchiver"]),
    ]
)
