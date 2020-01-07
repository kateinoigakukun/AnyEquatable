import AnyEquatableRuntime

public func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    var lhs = lhs
    var rhs = rhs
    var metatype = type(of: lhs)
    return withUnsafePointer(to: &metatype) { metatypePtr in
        withUnsafePointer(to: &lhs) { lhsPtr in
            withUnsafePointer(to: &rhs) { lhsPtr in
                dispatchIsEqual(lhsPtr, lhsPtr, metatypePtr)
            }
        }
    }
}
