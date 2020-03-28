#include "stdbool.h"

#define MANGLING_PREFIX $s
#define MANGLING_CONCAT2_IMPL(a, b) a##b
#define MANGLING_CONCAT2(a, b) MANGLING_CONCAT2_IMPL(a, b)
#define MANGLE_SYM(Ops) MANGLING_CONCAT2(MANGLING_PREFIX, Ops)
#define PROTOCOL_DESCR_SYM(Ty) \
        MANGLE_SYM(MANGLING_CONCAT2(Ty, Mp))


typedef struct {} ProtocolDescriptor;
ProtocolDescriptor *EquatableProtocolDescriptor;

bool dispatchIsEqual(const void *lhs, const void *rhs,
                     const void *type, const void *witness);
