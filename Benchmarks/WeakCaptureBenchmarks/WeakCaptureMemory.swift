import BenchmarkSupport
@main extension BenchmarkRunner {}
import MemoryThings
import Foundation

@_dynamicReplacement(for: registerBenchmarks) // Register benchmarks
func benchmarks() {
    Benchmark.defaultMetrics = BenchmarkMetric.memory
    
    // defaultThroughputScalingFactor controls the inner loop.
    // .kilo will run the code in the loop 1,000 times.
    Benchmark.defaultThroughputScalingFactor = .kilo
    
    // In order to get 100k iterations: desiredIterations * scalingFactor
    Benchmark.defaultDesiredIterations = 100
    Benchmark(
        "Weak Capture Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(WeakCaptureEncoder())
        }
    }
}

