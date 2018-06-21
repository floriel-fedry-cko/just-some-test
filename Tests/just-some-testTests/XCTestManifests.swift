import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(just_some_testTests.allTests),
    ]
}
#endif