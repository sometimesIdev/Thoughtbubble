// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Thoughtbubble",
    platforms: [
       .macOS(.v12)
    ],
	 products: [
		  .library(name: "ThoughtbubbleApi", targets: ["ThoughtbubbleApi"]),
	 ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", from: "4.54.0"),
		  .package(url: "https://github.com/vapor/fluent", from: "4.4.0"),
		  .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
		  .package(url: "https://github.com/binarybirds/liquid.git", from: "1.3.0"),
		  .package(url: "https://github.com/binarybirds/liquid-local-driver.git", from: "1.3.0"),
		  .package(url: "https://github.com/binarybirds/swift-html", from: "1.2.0"),
		  .package(url: "https://github.com/binarybirds/spec", from: "1.2.0"),
    ],
    targets: [
		  .target(name: "ThoughtbubbleApi", dependencies: []),
        .target(name: "App", dependencies: [
            .product(name: "Vapor", package: "vapor"),
				.product(name: "Fluent", package: "fluent"),
				.product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
				.product(name: "Liquid", package: "liquid"),
				.product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
				.product(name: "SwiftHtml", package: "swift-html"),
				.product(name: "SwiftSvg", package: "swift-html"),
				
				.target(name: "ThoughtbubbleApi")
		  ]),
        .executableTarget(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
				.product(name: "Spec", package: "spec"),
        ]),
		  .testTarget(name: "ThoughtbubbleApiTests", dependencies: [
				.target(name: "ThoughtbubbleApi"),
		  ])
    ]
)
