# swift-benchmark-testing

Trying to figure out how memory captured by this [package-benchmark](https://github.com/ordo-one/package-benchmark/) works.

Compare a benchmark run against the existing baseline: `swift package baseline compare`

# Benchmark Recommendations
Learnings from [this post](https://forums.swift.org/t/benchmark-package-initial-release/60535/40).
1. Each memory benchmark should be in a separate target (if you're trying to understand memory growth). Non-memory benchmarks (CPU, malloc counts, context switches, etc.) can be in a single target.
1. Look at `Memory (resident peak)` to understand how process memory size is changing. A growing process will see a clear progression from p0 -> p100.

# Reconciling Benchmarks w/Instruments
![](img/BaselineFromBenchmarks.png)

![](img/BaselineFromInstruments.png)

