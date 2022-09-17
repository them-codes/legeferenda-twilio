// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "legeferenda-twilio",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(
            name: "Twilio",
            targets: ["Twilio"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "Twilio",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ],
            path: "Sources"),
        .testTarget(
            name: "legeferenda-twilioTests",
            dependencies: ["Twilio"]),
    ]
)
