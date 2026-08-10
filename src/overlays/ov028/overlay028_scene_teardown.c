#include "tingle/types.h"

/* Overlay 28 main scene teardown, deletion, and two-word value copying. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern const u8 data_ov028_021ff2ac[];
extern const u8 data_ov028_021ff29c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02071eb8(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteGroup_ReplaceStateResources(void *, s32, s32, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_020927b8(void *);
extern void func_02095308(void *);
extern void func_ov028_021fd1a8(void *);
extern void func_ov028_021fd790(void *);
extern void func_ov028_021fda94(void *);
#ifdef __cplusplus
}
#endif

/* Copies the two words at `source` to `destination`; returns void. */
extern "C" void func_ov028_021fdf94(void *destination, const void *source)
{
    FIELD(s32, destination, 0) = FIELD(s32, source, 0);
    FIELD(s32, destination, 4) = FIELD(s32, source, 4);
}

/*
 * Restores the scene vtable and clears active bit 0x400. If imported sprite
 * +0x90 exists, restores its saved resource tuple +0x80..+0x88 and selector
 * +0x94. It destroys/frees optional list +0x220 and effect owner +0x224,
 * tears down child aggregate +0x264, renderers +0x54/+0x58, the primary font,
 * manager +0x1FC, controllers +0x98/+0x144, and resources +0x5C..+0x74.
 * Returns `state` without freeing it; heap and graphics/UI ownership changes.
 */
extern "C" void *func_ov028_021fdfa8(void *state)
{
    FIELD(const void *, state, 0) = data_ov028_021ff2ac;
    FIELD(u32, state, 0x20) &= ~0x400u;
    void *sprite = FIELD(void *, state, 0x90);
    if (sprite != 0) {
        GraphicsSpriteGroup_ReplaceStateResources(FIELD(void *, sprite, 0),
                      FIELD(s32, state, 0x80), FIELD(s32, state, 0x84),
                      FIELD(s32, state, 0x88));
        GraphicsSpriteState_SetAnimationIndex(sprite, FIELD(u8, state, 0x94));
    }
    void *child = FIELD(void *, state, 0x220);
    if (child != 0) {
        func_ov028_021fd1a8(child);
        Heap_Free(child);
    }
    child = FIELD(void *, state, 0x224);
    if (child != 0) {
        func_ov028_021fd790(child);
        Heap_Free(child);
    }
    func_02095308((u8 *)state + 0x264);
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x54));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x58));
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14[0]);
    FIELD(const void *, state, 0x264) = data_ov028_021ff29c;
    func_02095308((u8 *)state + 0x264);
    func_020927b8((u8 *)state + 0x1fc);
    func_ov028_021fda94((u8 *)state + 0x144);
    func_ov028_021fda94((u8 *)state + 0x98);
    func_02071eb8((u8 *)state + 0x74);
    func_02071eb8((u8 *)state + 0x68);
    func_02071eb8((u8 *)state + 0x5c);
    return state;
}

/*
 * Performs the same restoration and owned-resource teardown as
 * `func_ov028_021fdfa8`, then frees `state` itself and returns its former
 * address. All scene heap and graphics/UI ownership is released.
 */
extern "C" void *func_ov028_021fe0a8(void *state)
{
    func_ov028_021fdfa8(state);
    Heap_Free(state);
    return state;
}
