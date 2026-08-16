#include "tingle/types.h"

/* Coordinate one frame of the active runtime 3D presentation manager. */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020a2da8(void *manager);
extern void func_020a2fd0(void *manager);
extern void func_020a6280(void *manager);
extern void func_020a62e4(void *manager);
extern void func_0209b7a0(void *presentation, const void *position);
extern void func_020a219c(void *presentation);
extern void func_0209b7cc(void *presentation, s32 argument);
extern u32 func_0209a4dc(void *manager);
extern void func_0209a4c4(void *manager);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void func_0209cdd0(void *presentation, void *manager);
extern void func_0209c9d4(void *presentation);
extern void func_020a31d0(void *manager, const s32 *coordinates,
                          const u16 *colors);
#ifndef MATCHING
extern void TingleNativeG3_Translate(s32 x, s32 y, s32 z);
#endif

#ifdef __cplusplus
}
#endif

/*
 * Update an enabled presentation using a borrowed world position. The two
 * child managers, transform, interpolation, and frame-finalization stages run
 * synchronously in retail order; disabled presentations have no effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_020a214c(void *presentation, const void *position, s32 argument)
{
    u8 *bytes = (u8 *)presentation;

    if (bytes[0x50a] == 0)
        return;
    func_020a2da8(*(void **)(bytes + 0x4e4));
    func_020a6280(*(void **)(bytes + 0x4e8));
    func_0209b7a0(presentation, position);
    func_020a219c(presentation);
    func_0209b7cc(presentation, argument);
}

/* The remaining recovered functions occupy non-contiguous retail objects.
 * Keep their matching ROM slices on the exact assembly gaps while exposing
 * these portable bodies to the host recompilation. */
#ifndef MATCHING

/* Finalize one enabled 3D presentation frame. Child managers update and draw
 * first. Once the small manager becomes active, its uniform scale approaches
 * the selected endpoint, its retained transform is refreshed, and recovered
 * geometry submission consumes the borrowed manager synchronously. */
void func_020a219c(void *presentation)
{
    u8 *bytes = (u8 *)presentation;
    void *manager;
    s32 scale;
    s32 remaining;
    s32 vector[4];

    if (bytes[0x509] != 0)
        return;
    func_020a2fd0(*(void **)(bytes + 0x4e4));
    func_020a62e4(*(void **)(bytes + 0x4e8));
    manager = *(void **)(bytes + 0x4e0);
    if (func_0209a4dc(manager) != 0)
        return;

    scale = *(s32 *)(bytes + 0x4fc);
    remaining = 0x1000 - scale;
    if (*(s32 *)(bytes + 0x500) == 0) {
        scale += (remaining >> 2) + 0x29;
        if (scale > 0x1000)
            scale = 0x1000;
    } else {
        scale -= (remaining >> 2) + 0x29;
        if (scale < 1) {
            scale = 1;
            func_0209a4c4(manager);
        }
    }
    *(s32 *)(bytes + 0x4fc) = scale;
    func_020050a4((u8 *)manager + 0x0c, bytes + 0x4ec);
    func_0200500c(vector, scale, scale, scale);
    func_020050a4((u8 *)manager + 0x1c, vector);
    func_02005058(vector);
    func_0209cdd0(presentation, manager);
}

static s32 MultiplyFx32Rounded(s32 lhs, s32 rhs)
{
    return (s32)(((s64)lhs * rhs + 0x800) >> 12);
}

/* Update the paired 15-entry presentation table. The manager owns no child
 * allocations here: it toggles the working page, establishes retail 3D draw
 * state through its owner, and emits quads only for entries whose page marker
 * differs from the new page. Coordinates are converted from fx32 to pixels. */
void func_020a2fd0(void *manager)
{
    static const u16 colors[4] = {0x7fff, 0x7fff, 0x2529, 0x2529};
    u8 *bytes = (u8 *)manager;
    void *owner = *(void **)bytes;
    s32 index;
    s32 base_x;
    s32 base_y;

    bytes[7] ^= 1;
    func_0209c9d4(owner);
    base_x = *(s32 *)((u8 *)owner + 0x88) + 0x80000;
    base_y = *(s32 *)((u8 *)owner + 0x8c) + 0x60000;
    *(volatile s32 *)0x04000470 = -(base_x >> 12);
    *(volatile s32 *)0x04000470 = -(base_y >> 12);
    *(volatile s32 *)0x04000470 = 0;
#ifndef MATCHING
    TingleNativeG3_Translate(-(base_x >> 12), -(base_y >> 12), 0);
#endif

    for (index = 14; index >= 0; --index) {
        s32 center;
        s32 extent;
        s32 origin_x;
        s32 origin_y;
        s32 coordinates[8];

        if (*(u32 *)(bytes + 0x184 + index * 4) == 0 ||
            (s8)bytes[7] == *(s32 *)(bytes + 0x1c0 + index * 4))
            continue;
        center = *(s32 *)(bytes + 0x20 + index * 12);
        extent = *(s32 *)(bytes + 0x10c + index * 4);
        origin_x = *(s32 *)(bytes + 0x10);
        origin_y = *(s32 *)(bytes + 0x14) >> 12;
        coordinates[0] = (origin_x + center + extent) >> 12;
        coordinates[1] = origin_y;
        coordinates[2] = (origin_x + center - extent) >> 12;
        coordinates[3] = origin_y;
        coordinates[4] =
            (origin_x + MultiplyFx32Rounded(center - extent, 0x219a)) >> 12;
        coordinates[5] = origin_y + 0x6c;
        coordinates[6] =
            (origin_x + MultiplyFx32Rounded(center + extent, 0x219a)) >> 12;
        coordinates[7] = origin_y + 0x6c;
        func_020a31d0(manager, coordinates, colors);
    }
}

#endif
