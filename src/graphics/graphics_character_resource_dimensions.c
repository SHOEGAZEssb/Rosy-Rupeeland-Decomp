/* Packed character-resource dimensions queried by recovered 3D controllers. */
#include "tingle/types.h"

/* Return packed metadata bits 4..13 from a borrowed character resource.
 * The ten-bit value is returned unchanged; no resource or hardware changes. */
u32 func_02070454(const void *resource)
{
    return (*(const u32 *)((const u8 *)resource + 0x28) >> 4) & 0x3ff;
}

/* Return packed metadata bits 14..23 from a borrowed character resource.
 * The ten-bit value is returned unchanged; no resource or hardware changes. */
u32 func_02070464(const void *resource)
{
    return (*(const u32 *)((const u8 *)resource + 0x28) >> 14) & 0x3ff;
}
