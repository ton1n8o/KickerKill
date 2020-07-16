//  Copyright © 2019 TNTStudios. All rights reserved.

import XCTest

protocol HasInvocations {
    associatedtype Invocation: Equatable

    var invocations: [Invocation] { get set }
}

extension HasInvocations {
    func checkInvocations(_ invocations: [Invocation],
                          file: StaticString = #file,
                          line: UInt = #line) {
        guard self.invocations.count == invocations.count else {
            let msg = "Invocations doesn't match: expected \(invocations) but got \(self.invocations)"
            XCTFail(msg, file: file, line: line)
            return
        }
        for (index, invocation) in invocations.enumerated() {
            XCTAssertEqual(self.invocations[index], invocation, file: file, line: line)
        }
    }

    mutating func clearInvocations() {
        invocations = []
    }
}
