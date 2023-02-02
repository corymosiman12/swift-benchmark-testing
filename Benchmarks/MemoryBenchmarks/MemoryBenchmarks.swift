import BenchmarkSupport
@main extension BenchmarkRunner {}
import MemoryThings
import Foundation

@_dynamicReplacement(for: registerBenchmarks) // Register benchmarks
func benchmarks() {
    Benchmark.defaultMetrics = [
        .allocatedResidentMemory,
        .peakMemoryVirtual,
        .peakMemoryResident,
        .memoryLeaked
    ]
    Benchmark.defaultDesiredIterations = 100_000
    Benchmark(
        "Int Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(1)
        }
    }
    Benchmark(
        "JSONEncoder Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(JSONEncoder())
        }
    }
    Benchmark(
        "Foo Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(Foo())
        }
    }
    Benchmark(
        "Explicit Capture Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(ExplicitCaptureEncoder())
        }
    }
    Benchmark(
        "Weak Capture Memory"
    ) { benchmark in
        for _ in benchmark.throughputIterations {
            BenchmarkSupport.blackHole(WeakCaptureEncoder())
        }
    }
}
