#include "tingle/types.h"

/* Overlay 36 table-driven oscillating-child spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022054e0[];
extern const u8 data_ov036_022054e4[];
extern const u8 data_ov036_022054e8[];
extern const u8 data_ov036_022054ec[];
extern const u8 data_ov036_02206188[];
/* The retail literal names the heap context itself, not its storage pointer. */
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_02201d70(void *object, void *argument,
                                 void *resource, s32 variant, s32 valueC8);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void func_ov036_021fe978(void *resource, s32 x, s32 y, s32 z);
extern void PresentationList_Append(void *list, void *object);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Spawns the child selected by controller index +0x15C. The first word of
 * each 0x10-byte data_ov036_022054e0 record is a confirmed variant: zero uses
 * resource set +0xDC with handle byte 2, while one uses +0xE8 with byte 0xD.
 * The recovered tables are expected to contain only those variants before
 * this helper is called. A 0xF8-byte object is constructed with archive item
 * +0xF4, that handle, the variant, and the first word of the matching
 * data_ov036_022054ec record.
 *
 * The child and handle are positioned at table X/Z with Y=-0xA00, handle
 * flags 0x42 are set, and the child enters list +0x10C. Variant zero receives
 * scale 0x666 and variant one 0x400. Index +0x15C is then incremented. Returns
 * nothing; manager, heap, handle, list, transform, and index state change.
 */
extern "C" void func_ov036_02202628(void *controller)
{
    s32 index = FIELD(s32, controller, 0x15c);
    s32 variant = *(const s32 *)(data_ov036_022054e0 + index * 0x10);
#ifdef MATCHING
    void *handle;
#else
    /* Retail tables only contain variants zero and one. Keep malformed host
     * data from exposing an indeterminate pointer at this data boundary. */
    void *handle = 0;
#endif
    if (variant == 0) {
        handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0xf8),
                               (u8 *)controller + 0xdc);
        FIELD(u8, handle, 0x5a) = 2;
    } else if (variant == 1) {
        handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0xf8),
                               (u8 *)controller + 0xe8);
        FIELD(u8, handle, 0x5a) = 0xd;
    }

    void *child = Heap_Alloc(0xf8, data_ov036_02206188, 4, gHeapContext);
    if (child != 0) {
        s32 valueC8 =
            *(const s32 *)(data_ov036_022054ec + index * 0x10);
        child = func_ov036_02201d70(child,
                                    FIELD(void *, controller, 0xf4),
                                    handle, variant, valueC8);
    }
    s32 x = *(const s32 *)(data_ov036_022054e4 + index * 0x10);
    s32 z = *(const s32 *)(data_ov036_022054e8 + index * 0x10);
    Presentation_SetPosition(child, x, -0xa00, z);
    func_ov036_021fe978(handle, x, -0xa00, z);
    FIELD(u16, handle, 0x50) |= 0x42;
    PresentationList_Append((u8 *)controller + 0x10c, child);
    if (variant == 0)
        PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0x666);
    else if (variant == 1)
        PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0x400);
    ++FIELD(s32, controller, 0x15c);
}
