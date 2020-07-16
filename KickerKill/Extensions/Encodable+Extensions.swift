// Copyright © 3/5/20 Antônio Carlos. All rights reserved.

import Foundation

struct CastingError: Error {
    let fromType: Any.Type
    let toType: Any.Type
    init<FromType, ToType>(fromType: FromType.Type, toType: ToType.Type) {
        self.fromType = fromType
        self.toType = toType
    }
}

extension Encodable {

    func toDictionary(options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        return try to(type: [String: Any].self, options: options)
    }

    private func to<T>(type: T.Type, options: JSONSerialization.ReadingOptions = []) throws -> T {
        let data = try JSONEncoder().encode(self)
        guard let result = try JSONSerialization.jsonObject(with: data, options: options) as? T else {
            throw CastingError(fromType: type, toType: T.self)
        }
        return result
    }
}

