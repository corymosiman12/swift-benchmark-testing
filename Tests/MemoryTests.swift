
import Foundation
import MemoryThings
import XCTest

public class MemoryTests: XCTestCase {
    func testInt() throws {
        for _ in 0 ..< 100_000 {
            blackHole(1)
        }
    }
    func testJSONEncoder() throws {
        for _ in 0 ..< 100_000 {
            blackHole(JSONEncoder())
        }
    }
    func testFoo() throws {
        for _ in 0 ..< 100_000 {
            blackHole(Foo())
        }
    }
    func testExplicitCapture() throws {
        for _ in 0 ..< 100_000 {
            blackHole(ExplicitCaptureEncoder())
        }
    }
    func testWeakCapture() throws {
        for _ in 0 ..< 100_000 {
            blackHole(WeakCaptureEncoder())
        }
    }
}
