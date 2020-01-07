import XCTest
@testable import AnyEquatable

final class AnyEquatableTests: XCTestCase {
    struct NotEquatable {}
    func testEquatable() {
        XCTAssertTrue(AnyEquatable.isEqual("abc", "abc"))
        XCTAssertFalse(AnyEquatable.isEqual(1, 3))
        XCTAssertFalse(AnyEquatable.isEqual(NotEquatable(), NotEquatable()))
    }
}
