#include "tingle/types.h"

/* Overlay 32 background scrolling and 60-frame selection-transition coordination. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020beb18(...);
extern s32 func_020be8c0(...);
extern s32 func_020beb6c(...);
extern s32 func_020beae4(...);
extern s32 func_ov032_02201390(void *);
extern void GraphicsArchiveResource_ReleaseAlternateBuffer(void *);
extern void func_020708c4(void *);
extern void func_02070958(...);
extern void func_020b44e8(void);
extern s32 GraphicsResource_GetFormat(void *);
extern void func_02070b50(...);
extern void Overlay032Controller_SetScaleTarget(...);
extern void Overlay032Controller_UpdateScale(void *);
#ifdef __cplusplus
}
#endif

static void upload_selected_map(void *scene)
{
    func_020b44e8();
    void *tiles = FIELD(void *, scene, 0xb44);
    func_02070b50(FIELD(void *, scene, 0xb48), GraphicsResource_GetFormat(tiles) ? 0x6000 : 0);
}

static void set_map_scalar(void *scene, s32 fixedValue)
{
    s32 scalar = fixedValue >> 12;
    func_02070958(FIELD(void *, scene, 0xb48), scalar, scalar, scalar);
    upload_selected_map(scene);
}

/*
 * Advances fixed-point BG3 horizontal motion from direction +0xC28, magnitude
 * +0xC30 and accumulator +0xC34, writes the wrapped nine-bit offset to main
 * BG3HOFS, then updates all five children. Returns one only when every child
 * update reports completion. The fixed-point SDK math sequence is confirmed;
 * its angle-unit semantics remain inferred.
 */
extern "C" s32 func_ov032_021fe92c(void *scene)
{
    s32 direction = FIELD(s32, scene, 0xc28);
    s32 angle = func_020beb18(direction << 12);
    s32 transformed = direction > 0 ? func_020be8c0(0x3f000000, angle)
                                    : func_020beb6c(angle, 0x3f000000);
    s32 step = func_020beae4(transformed);
    FIELD(s32, scene, 0xc34) += (s32)(((s64)FIELD(s32, scene, 0xc30) * step + 0x800) >> 12);
    REG32(0x0400001c) = (FIELD(s32, scene, 0xc34) >> 12) & 0x1ff;

    s32 complete = 1;
    for (s32 i = 0; i < 5; ++i) {
        if (func_ov032_02201390((u8 *)scene + 0xc44 + i * 0x6c) == 0) complete = 0;
    }
    return complete;
}

/*
 * Begins a 60-frame map/child selection transition toward `selection`. It
 * resets map transform state, chooses initial scalar 0x100000 only for sentinel
 * -1, uploads the map, and starts controller transitions for populated children
 * 1..3 toward X=0 (sentinel) or X=128. Returns void.
 */
extern "C" void func_ov032_021fe9e8(void *scene, s32 selection)
{
    FIELD(s32, scene, 0xc40) = selection;
    FIELD(s32, scene, 0xb7c) = 0x3c;
    GraphicsArchiveResource_ReleaseAlternateBuffer(FIELD(void *, scene, 0xb48));
    func_020708c4(FIELD(void *, scene, 0xb48));
    FIELD(s32, scene, 0xc3c) = selection == -1 ? 0x100000 : 0;
    set_map_scalar(scene, FIELD(s32, scene, 0xc3c));

    for (s32 i = 1; i <= 3; ++i) {
        void *controller = FIELD(void *, scene, 0xc5c + i * 0x6c);
        if (controller != 0) Overlay032Controller_SetScaleTarget((u8 *)scene + 0xc5c + i * 0x6c,
                                                selection == -1 ? 0 : 0x80, 0x3c);
    }
}

/*
 * Advances active child controllers 1..3 and the map scalar transition begun
 * by 0x021FE9E8. Returns zero while the 60-frame counter remains, then snaps to
 * scalar 0 (sentinel -1) or 0x100 and returns one; an already-zero counter also
 * returns one without another upload.
 */
extern "C" s32 func_ov032_021fead4(void *scene)
{
    for (s32 i = 1; i <= 3; ++i) {
        void *controller = FIELD(void *, scene, 0xc5c + i * 0x6c);
        if (controller != 0) Overlay032Controller_UpdateScale((u8 *)scene + 0xc5c + i * 0x6c);
    }
    s32 frames = FIELD(s32, scene, 0xb7c);
    if (frames == 0) return 1;
    FIELD(s32, scene, 0xb7c) = --frames;
    s32 selection = FIELD(s32, scene, 0xc40);
    if (frames == 0) {
        set_map_scalar(scene, selection == -1 ? 0 : 0x100);
        return 1;
    }
    FIELD(s32, scene, 0xc3c) += selection == -1 ? -FIELD(s32, scene, 0xc38)
                                                  : FIELD(s32, scene, 0xc38);
    set_map_scalar(scene, FIELD(s32, scene, 0xc3c));
    return 0;
}
