import XCTest
@testable import AnyEquatable

final class AnyEquatableTests: XCTestCase {
    func testEquatable() {
        XCTAssertTrue(AnyEquatable.isEqual("abc", "abc"))
        XCTAssertFalse(AnyEquatable.isEqual(1, 3))
    }
}
