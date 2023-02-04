// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-benchmark-test",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/ordo-one/package-benchmark", .upToNextMajor(from: "0.2.0")),
    ],
    targets: [
        .target(
            name: "MemoryThings",
            path: "Sources"
        ),
        .testTarget(
            name: "MemoryTests",
            dependencies: ["MemoryThings"],
            path: "Tests"
        ),
        .executableTarget(
            name: "ExplicitCaptureBenchmarks",
            dependencies: [
                "MemoryThings",
                .product(name: "BenchmarkSupport", package: "package-benchmark"),
            ],
            path: "Benchmarks/ExplicitCaptureBenchmarks"
        ),
        .executableTarget(
            name: "WeakCaptureBenchmarks",
            dependencies: [
                "MemoryThings",
                .product(name: "BenchmarkSupport", package: "package-benchmark"),
            ],
            path: "Benchmarks/WeakCaptureBenchmarks"
        ),

    ]
)
