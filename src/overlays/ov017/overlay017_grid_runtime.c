#include "tingle/types.h"

/* Overlay 17 circular grid-force and geometry-transform object runtime. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern const s16 data_020c9670[];
extern const u32 data_ov017_02201414[];
extern const u32 data_ov017_02201608[];
extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *func_02071adc(void *, s32);
extern void func_02071e04(void *, void *);
extern void func_020b0808(s32, s32);
extern void func_020b0844(s32, s32);
extern void func_020b0880(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Add caller delta to every word in the parallel 9x9 grid at state +0 whose
 * coordinate at state +0x144 lies strictly inside a circle centered at caller
 * X/Z. The radius comes from data_ov017_02201414 indexed by global +0x16E0/+0x0C,
 * shifted left four and divided by eight before squaring. Inputs are state,
 * center X, center Z, and delta; return void. Only caller-owned grid values are
 * modified and no hardware is accessed.
 */
extern "C" void func_ov017_021fd6b0(void *state, s32 centerX, s32 centerZ,
                                      s32 delta)
{
    s32 tableIndex = FIELD(s32, data_ov017_022016e0, 0xc);
    s32 scaled = (s32)data_ov017_02201414[tableIndex] << 4;
    s32 radius = scaled / 8;
    s32 radiusSquared = radius * radius;
    s32 row;

    for (row = 0; row <= 8; row++) {
        s32 column;
        for (column = 0; column <= 8; column++) {
            void *cell = (u8 *)state + 0x144 + row * 0x6c + column * 0xc;
            s32 dx = centerX - FIELD(s32, cell, 0);
            s32 dz = centerZ - FIELD(s32, cell, 8);
            if (dx * dx + dz * dz < radiusSquared) {
                FIELD(s32, state, row * 0x24 + column * 4) += delta;
            }
        }
    }
}

/*
 * Initialize a 0x2C-byte geometry-transform/resource object: install vtable
 * data_ov017_02201608, clear resource +4, translation +8..+0x10 and rotations
 * +0x20..+0x28, and set scale +0x14..+0x1C to fixed-point 0x1000. Return state;
 * only caller memory changes and no SDK or hardware calls occur.
 */
extern "C" void *func_ov017_021fd744(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201608;
    FIELD(void *, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
    FIELD(s32, state, 0xc) = 0;
    FIELD(s32, state, 0x10) = 0;
    FIELD(s32, state, 0x14) = 0x1000;
    FIELD(s32, state, 0x18) = 0x1000;
    FIELD(s32, state, 0x1c) = 0x1000;
    FIELD(s32, state, 0x20) = 0;
    FIELD(s32, state, 0x24) = 0;
    FIELD(s32, state, 0x28) = 0;
    return state;
}

/*
 * Restore vtable data_ov017_02201608 and release resource +4 through archive
 * owner data_020F4E18 when non-null. Return state without clearing the stored
 * pointer. SDK resource ownership changes; no direct hardware access occurs.
 */
extern "C" void *func_ov017_021fd780(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201608;
    if (FIELD(void *, state, 4) != 0) {
        func_02071e04(data_020f4e18, FIELD(void *, state, 4));
    }
    return state;
}

/*
 * Restore the transform vtable, release resource +4 through data_020F4E18 when
 * present, free the object, and return its original pointer value. The returned
 * address no longer owns valid storage. Heap/resource state changes; no MMIO.
 */
extern "C" void *func_ov017_021fd7b8(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201608;
    if (FIELD(void *, state, 4) != 0) {
        func_02071e04(data_020f4e18, FIELD(void *, state, 4));
    }
    Heap_Free(state);
    return state;
}

/*
 * Replace resource +4: release the old handle through archive owner
 * data_020F4E18 when present, acquire the caller's integer resource selector
 * through 0x02071ADC, and store the result. Return void. SDK resource ownership
 * changes; no direct hardware access occurs.
 */
extern "C" void func_ov017_021fd7f8(void *state, s32 resourceId)
{
    if (FIELD(void *, state, 4) != 0) {
        func_02071e04(data_020f4e18, FIELD(void *, state, 4));
    }
    FIELD(void *, state, 4) = func_02071adc(data_020f4e18, resourceId);
}

/*
 * Submit the transform to the Nintendo DS geometry engine. Write translation
 * +8/+0x0C/+0x10 to 0x04000470, use each unsigned rotation +0x20/+0x24/+0x28
 * shifted right four to select adjacent sine/cosine halfwords from
 * data_020C9670 and call the X/Y/Z matrix helpers, then write scale
 * +0x14/+0x18/+0x1C to 0x0400046C. Return void. This directly mutates geometry
 * matrix hardware and invokes SDK matrix commands.
 */
extern "C" void func_ov017_021fd838(void *state)
{
    volatile u32 *translation = (volatile u32 *)0x04000470;
    volatile u32 *scale = (volatile u32 *)0x0400046c;
    u32 index;

    *translation = FIELD(u32, state, 8);
    *translation = FIELD(u32, state, 0xc);
    *translation = FIELD(u32, state, 0x10);
    index = ((u16)FIELD(u32, state, 0x20)) >> 4;
    func_020b0880(data_020c9670[index * 2], data_020c9670[index * 2 + 1]);
    index = ((u16)FIELD(u32, state, 0x24)) >> 4;
    func_020b0844(data_020c9670[index * 2], data_020c9670[index * 2 + 1]);
    index = ((u16)FIELD(u32, state, 0x28)) >> 4;
    func_020b0808(data_020c9670[index * 2], data_020c9670[index * 2 + 1]);
    *scale = FIELD(u32, state, 0x14);
    *scale = FIELD(u32, state, 0x18);
    *scale = FIELD(u32, state, 0x1c);
}
