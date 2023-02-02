
import Foundation


public class Foo: JSONEncoder {}

private let formatter = ISO8601DateFormatter()

public class ExplicitCaptureEncoder: JSONEncoder {
    private let myFormatter: ISO8601DateFormatter
    public override init() {
        self.myFormatter = formatter
        super.init()
        dateEncodingStrategy = .custom { date, encoder in
            blackHole(self.myFormatter)
        }
    }
}
public class WeakCaptureEncoder: JSONEncoder {
    private let myFormatter: ISO8601DateFormatter
    public override init() {
        self.myFormatter = formatter
        super.init()
        dateEncodingStrategy = .custom { [weak self] date, encoder in
            blackHole(self?.myFormatter)
        }
    }
}

@inline(never)
public func blackHole<T>(_: T) {}
