import AnyEquatableRuntime

public func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    var lhs = lhs
    var rhs = rhs
    let metatype = unsafeBitCast(type(of: lhs), to: UnsafeRawPointer.self)
    return withUnsafePointer(to: &lhs) { lhsPtr in
        withUnsafePointer(to: &rhs) { rhsPtr in
            dispatchIsEqual(lhsPtr, rhsPtr, metatype)
        }
    }
}
