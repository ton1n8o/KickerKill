// Copyright © 3/12/20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

extension XCTestCase {

    func assertEqual<T>(_ first: T,
                        _ second: T,
                        file: StaticString = #file,
                        line: UInt = #line) {

        XCTAssertEqual(FakeEquatableWrapper(first),
                       FakeEquatableWrapper(second), file: file, line: line)
    }

    func loadViewController<T: UIViewController>(fromStoryBoard: String, andIdentifier: String) -> T? {

        let storyboard = UIStoryboard(name: fromStoryBoard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: andIdentifier) as? T
    }
}
