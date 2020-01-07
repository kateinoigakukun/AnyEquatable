#define MANGLING_PREFIX $s
#define MANGLING_CONCAT2_IMPL(a, b) a##b
#define MANGLING_CONCAT2(a, b) MANGLING_CONCAT2_IMPL(a, b)
#define MANGLE_SYM(Ops) MANGLING_CONCAT2(MANGLING_PREFIX, Ops)
#define PROTOCOL_DESCR_SYM(Ty) \
        MANGLE_SYM(MANGLING_CONCAT2(Ty, Mp))

#include "stdbool.h"

typedef struct {} WitnessTable;
typedef struct {} Metadata;
typedef struct {} ProtocolDescriptor;
typedef struct {} OpaqueValue;

ProtocolDescriptor PROTOCOL_DESCR_SYM(SQ);
ProtocolDescriptor *EquatableProtocolDescriptor = &PROTOCOL_DESCR_SYM(SQ);

extern WitnessTable *swift_conformsToProtocol(Metadata *type, ProtocolDescriptor *protocol);

extern bool AnyEquatable_internalIsEqual(OpaqueValue *lhs, OpaqueValue *rhs, Metadata *type, WitnessTable *witness);

bool dispatchIsEqual(OpaqueValue *lhs,
                     OpaqueValue *rhs,
                     Metadata *type) {
    WitnessTable *witnessTable = swift_conformsToProtocol(type, EquatableProtocolDescriptor);
    return AnyEquatable_internalIsEqual(lhs, rhs, type, witnessTable);
}
