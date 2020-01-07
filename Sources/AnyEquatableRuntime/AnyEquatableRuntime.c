#include "stdbool.h"

extern bool AnyEquatable_internalIsEqual(const void *lhs,  const void *rhs,
                                         const void *type, const void *witness);

bool dispatchIsEqual(const void *lhs,  const void *rhs,
                     const void *type, const void *witness) {
    return AnyEquatable_internalIsEqual(lhs, rhs, type, witness);
}
