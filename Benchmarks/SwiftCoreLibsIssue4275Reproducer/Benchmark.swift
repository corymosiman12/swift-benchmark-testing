import BenchmarkSupport
@main extension BenchmarkRunner {}
import Foundation

@_dynamicReplacement(for: registerBenchmarks) // Register benchmarks
func benchmarks() {
    Benchmark.defaultMetrics = BenchmarkMetric.memory
    
    // defaultThroughputScalingFactor controls the inner loop.
    // .kilo will run the code in the loop 1,000 times.
    Benchmark.defaultThroughputScalingFactor = .kilo
    
    // In order to get 100k iterations: desiredIterations * scalingFactor
    Benchmark.defaultDesiredIterations = 1000
    Benchmark(
        "SwiftCoreLibsIssue4275Reproducer"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            let t = Test(foo: "Hello World")
            let encoder = JSONEncoder()
            blackHole(try? encoder.encode(t))
        }
    }
}

struct Test: Codable {
    let foo: String
}
