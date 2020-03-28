#include "AnyEquatableRuntime.h"

extern ProtocolDescriptor PROTOCOL_DESCR_SYM(SQ);
ProtocolDescriptor *EquatableProtocolDescriptor = &PROTOCOL_DESCR_SYM(SQ);

extern bool AnyEquatable_internalIsEqual(const void *lhs,  const void *rhs,
                                         const void *type, const void *witness);

bool dispatchIsEqual(const void *lhs,  const void *rhs,
                     const void *type, const void *witness) {
    return AnyEquatable_internalIsEqual(lhs, rhs, type, witness);
}
