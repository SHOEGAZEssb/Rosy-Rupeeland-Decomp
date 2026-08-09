#include "tingle/types.h"

/*
 * Overlay 49 derived runtime-object construction. The recovered object extends
 * the shared base with render resources, two embedded records, and five
 * animation/transform entries. Exact assembly preserves array initialization
 * and SDK constructor call ordering.
 */

/*
 * Construct caller-owned `object`, forwarding `argument` to the shared base,
 * install the overlay vtable, clear the offset-derived runtime fields, initialize
 * embedded records at +0x8C/+0x9C, and initialize five 0x10-byte transform/
 * animation entries through func_0209a208. Return `object`. Base, animation,
 * and SDK-owned state change; no storage is allocated or directly freed, and
 * no MMIO is written. Field semantics beyond confirmed layout remain inferred.
 */
extern "C" void *func_ov049_0220b780(void *object, void *argument);
