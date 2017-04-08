import XCTest
@testable import HelloWorld2

class HelloWorld2Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(HelloWorld2().text, "Hello, World!")
    }


    static var allTests : [(String, (HelloWorld2Tests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
