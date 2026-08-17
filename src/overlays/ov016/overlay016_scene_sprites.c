#include "tingle/types.h"

/* Overlay 16 scene-owned sprite and actor-record initialization/teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Clear(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
#ifdef __cplusplus
}
#endif

/*
 * Create sprite +0xE4 from owner +0xE0 and resource +0xC8, using confirmed
 * graphic/position arguments (0,0x84,0x20,2,0,2). Initialize embedded actor
 * records +0xE8 and +0x194 from two further owner children with resource indices
 * 7 and 9, place them at (0x80,0xAA) and (0xE8,0xAA), and hide +0xE8 unless
 * mode +0x54 is zero and the list at +0x444 has nonzero capacity +0x50. Return
 * void. SDK sprite/actor state changes; no direct hardware access occurs.
 */
extern "C" void Overlay016_CreateSceneSprite(void *state)
{
    void *child;

    FIELD(void *, state, 0xe4) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xc8, 1);
    func_02073e48(FIELD(void *, state, 0xe4), 0, 0x84, 0x20, 2, 0, 2);

    child = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xc8, 1);
    func_020957f0((u8 *)state + 0xe8, child, 7, 2, 0);
    func_02095820((u8 *)state + 0xe8, 0x80, 0xaa);
    if (FIELD(s32, state, 0x54) != 0 ||
        FIELD(s32, FIELD(void *, state, 0x444), 0x50) == 0) {
        func_02095940((u8 *)state + 0xe8);
    }

    child = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xc8, 1);
    func_020957f0((u8 *)state + 0x194, child, 9, 2, 0);
    func_02095820((u8 *)state + 0x194, 0xe8, 0xaa);
}

/*
 * Destroy the owner at state +0xE0, then clear its direct sprite pointer +0xE4
 * and the child pointers embedded at +0x184 and +0x230. Return void. The SDK
 * releases the owner and its dependent graphics state; no MMIO occurs.
 */
extern "C" void func_ov016_021ff4ec(void *state)
{
    GraphicsSpriteGroup_Clear(FIELD(void *, state, 0xe0));
    FIELD(void *, state, 0xe4) = 0;
    FIELD(void *, state, 0x184) = 0;
    FIELD(void *, state, 0x230) = 0;
}
