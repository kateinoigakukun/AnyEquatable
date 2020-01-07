import AnyEquatableRuntime

public func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    var lhs = lhs
    var rhs = rhs
    let lhsType = type(of: lhs)
    let rhsType = type(of: rhs)
    guard lhsType == rhsType else { return false }
    let theType = unsafeBitCast(rhsType, to: UnsafeRawPointer.self)
    return withUnsafePointer(to: &lhs) { lhsPtr in
        withUnsafePointer(to: &rhs) { rhsPtr in
            dispatchIsEqual(lhsPtr, rhsPtr, theType)
        }
    }
}
