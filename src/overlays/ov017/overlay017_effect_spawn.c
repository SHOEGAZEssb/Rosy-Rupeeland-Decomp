#include "tingle/heap.h"
#include "tingle/types.h"

/* Overlay 17 event-code to effect-resource mapping and effect allocation. */

extern const char data_ov017_022016b4[];
extern u8 data_ov017_02201754[];
extern HeapContext gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020918f4(void *, s32);
extern void PresentationList_Append(void *, void *);
extern void *func_ov017_021fd94c(void *, u16, u32, u32, u16, u16, u16);
#ifdef __cplusplus
}
#endif

/*
 * Map eventCode to an effect resource ID rooted at 0x5012. Codes 0..59 use the
 * confirmed offset map below (with intentional aliases/defaults); sparse codes
 * 0xD9..0xF0 and 0x15E select offsets 0x34..0x3F. Allocate an 0xE8-byte effect,
 * seed it with eventCode, caller coordinates/values, a random value in 0..59,
 * and the mapped resource, then register it with global owner 0x02201754.
 * Return the constructed object or null. Heap, PRNG, owner-list, resource, and
 * SDK state may change; no direct hardware access occurs.
 */
extern "C" void *func_ov017_021ff8a8(void *context, s32 eventCode, u32 baseArg1,
                                      u32 baseArg3, u16 value9c)
{
    static const u8 offsets[60] = {
        0, 1, 2, 3, 4, 5, 0, 6, 7, 7, 8, 9, 0xa, 0xb, 0xc,
        0x3a, 0x3a, 0x3a, 0xd, 0xe, 0xf, 0, 0x10, 0x11, 0x12,
        0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b,
        0x1c, 0x1d, 0x1e, 0, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24,
        0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d,
        0x2e, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33
    };
    u16 resourceId = 0x5012;
    void *effect;

    if ((u32)eventCode < 60) {
        resourceId += offsets[eventCode];
    } else {
        switch (eventCode) {
        case 0xd9: resourceId = 0x5046; break;
        case 0xda: resourceId += 0x35; break;
        case 0xdb: resourceId += 0x36; break;
        case 0xdc: resourceId += 0x37; break;
        case 0xdd: resourceId += 0x38; break;
        case 0xde: resourceId += 0x39; break;
        case 0xeb: resourceId += 0x3a; break;
        case 0xed: resourceId += 0x3b; break;
        case 0xee: resourceId += 0x3c; break;
        case 0xef: resourceId += 0x3d; break;
        case 0xf0: resourceId += 0x3e; break;
        case 0x15e: resourceId += 0x3f; break;
        }
    }

    effect = Heap_Alloc(0xe8, data_ov017_022016b4, 4, &gHeapContext);
    if (effect != 0) {
        effect = func_ov017_021fd94c(
            effect, (u16)eventCode, baseArg1, baseArg3, value9c,
            (u16)func_020918f4((u8 *)context + 0x3fc, 0x3c), resourceId);
    }
    PresentationList_Append(data_ov017_02201754, effect);
    return effect;
}
