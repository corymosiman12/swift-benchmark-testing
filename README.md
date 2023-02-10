# swift-benchmark-testing

Trying to figure out how memory captured by this [package-benchmark](https://github.com/ordo-one/package-benchmark/) works. See that repo for getting setup to run on macOS.

## Usage
- Run the benchmarks: `swift package benchmark`
- Run the benchmarks via docker:
  - `docker build --tag memory-benchmark-test .`
  - `docker run memory-benchmark-test`


# Benchmark Recommendations
Learnings from [this post](https://forums.swift.org/t/benchmark-package-initial-release/60535/40).
1. Each memory benchmark should be in a separate target (if you're trying to understand memory growth). Non-memory benchmarks (CPU, malloc counts, context switches, etc.) can be in a single target.
1. Look at `Memory (resident peak)` to understand how process memory size is changing. A growing process will see a clear progression from p0 -> p100.
