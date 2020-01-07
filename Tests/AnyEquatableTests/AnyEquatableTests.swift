import XCTest
@testable import AnyEquatable

final class AnyEquatableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AnyEquatable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
