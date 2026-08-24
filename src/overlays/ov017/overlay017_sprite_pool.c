#include "tingle/types.h"

/* Overlay 17 eight-member sprite pool construction and resource teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern void *data_020f4e18[];
extern const s32 data_ov017_02201414[];
extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 GraphicsResourceSetVariant_Init(void *);
extern void GraphicsResourceSetVariant_Destroy(void *);
extern void GraphicsResourceSetVariant_Load(void *, void *, s32, s32, s32);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern void *Graphics3DResourceOwner_CreateManager(void *);
extern void Graphics3DResourceOwner_RemoveManager(void *, void *);
extern void Graphics3DResourceOwner_PrepareResources(void *, void *);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void func_02091b6c(void *);
extern void func_ov017_021fe3c4(void *, u32, u32, u32, u32, u8, u32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the pool's resource controller at +4, random generator at +0x38,
 * and seed at +0x54. Acquire a graphics resource from resourceContext, register
 * IDs 0x601E..0x6020, and create eight sprite instances. Each sprite receives a
 * random animation in 0..2, table-derived X/Z coordinates distributed across
 * eight angles, fixed Y -0x666, byte +0x5A = 0x20, flags 0x42, zeroed +0x34/
 * +0x38, angle +0x4A, and byte +0x59 = 3. Clear pool state +0x30/+0x34 and
 * return pool. Heap/resource, PRNG, and graphics SDK state change; no direct
 * MMIO occurs. The roles of the tables are inferred from their access pattern.
 */
extern "C" void *func_ov017_021fe40c(void *pool, void *resourceContext)
{
    s32 i;
    s32 zero = 0;

    GraphicsResourceSetVariant_Init((u8 *)pool + 4);
    func_02091b6c((u8 *)pool + 0x38);
    FIELD(u32, pool, 0x54) = 0;
    FIELD(u32, pool, 0x54) = genrand_int32();
    FIELD(void *, pool, 0) = Graphics3DResourceOwner_CreateManager(resourceContext);
    GraphicsResourceSetVariant_Load((u8 *)pool + 4, data_020f4e18[0], 0x601e,
                                    0x601f, 0x6020);
    Graphics3DResourceOwner_PrepareResources(resourceContext, (u8 *)pool + 4);

    for (i = 0; i < 8; i++) {
        u16 angle = (u16)(i * 0x1000 - 0x3800);
        s32 tableIndex = (s16)angle >> 4;
        s32 radius = data_ov017_02201414[
            FIELD(s32, data_ov017_022016e0, 0xc)];
        void *sprite = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, pool, 0),
                                     (u8 *)pool + 4);
        s32 coordinateZ;
        s32 coordinateX;

        FIELD(void *, pool, 0x10 + i * 4) = sprite;
        coordinateZ = radius * gFx32CosSinTable[tableIndex * 2 + 1] / 0x100;
        coordinateX = radius * gFx32CosSinTable[tableIndex * 2] / 0x100;
        func_ov017_021fe3c4(sprite,
                           (u8)TitleRandom_NextBounded((u8 *)pool + 0x54, 3),
                           (u32)coordinateX, (u32)-0x666, (u32)coordinateZ,
                           0x20, 0x42);
        FIELD(s32, sprite, 0x34) = 0;
        FIELD(s32, sprite, 0x38) = 0;
        FIELD(u16, sprite, 0x4a) = angle + 0x4000;
        FIELD(u8, sprite, 0x59) = 3;
    }

    FIELD(s32, pool, 0x30) = zero;
    FIELD(s32, pool, 0x34) = zero;
    return pool;
}

/*
 * Release the pool's primary graphics object through 0x02077688, destroy the
 * resource controller at +4, and return pool. SDK/resource ownership changes;
 * the containing allocation is retained and no direct hardware access occurs.
 */
extern "C" void *func_ov017_021fe58c(void *pool)
{
    void *resource = FIELD(void *, pool, 0);

    Graphics3DResourceOwner_RemoveManager(FIELD(void *, resource, 0), resource);
    GraphicsResourceSetVariant_Destroy((u8 *)pool + 4);
    return pool;
}
