import AnyEquatableRuntime

@_silgen_name("swift_conformsToProtocol")
func swift_conformsToProtocol(_: Any.Type, _: UnsafeRawPointer) -> UnsafeRawPointer

let RTLD_DEFAULT = UnsafeMutableRawPointer(bitPattern: -2)
let EquatableProtocolDescriptor: UnsafeMutableRawPointer = {
    dlsym(RTLD_DEFAULT, "$sSQMp")!
}()

public func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    var lhs = lhs
    var rhs = rhs
    let lhsType = type(of: lhs)
    let rhsType = type(of: rhs)
    guard lhsType == rhsType else { return false }
    let witnessTable = swift_conformsToProtocol(lhsType, EquatableProtocolDescriptor)
    if witnessTable == UnsafeRawPointer(bitPattern: 0) { return false }
    let theType = unsafeBitCast(lhsType, to: UnsafeRawPointer.self)
    return withUnsafePointer(to: &lhs) { lhsPtr in
        withUnsafePointer(to: &rhs) { rhsPtr in
            dispatchIsEqual(lhsPtr, rhsPtr, theType, witnessTable)
        }
    }
}
