#include "tingle/types.h"

/* Overlay 27 child updates, event-driven motion bursts, and tracked-position caching. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021fef44[];
extern const u16 data_ov027_021fe950[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void PresentationList_UpdateAndDeleteCompleted(void *);
extern void *func_ov027_021fd718(void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationList_Append(void *, void *);
extern void GraphicsAnimationInstanceManager_Update(void *);
extern void func_ov027_021fe0f8(void *);
#ifdef __cplusplus
}
#endif

typedef void (*UpdateCallback)(void *);

/* Allocates and base-initializes one 0xB8-byte motion object, or returns null. */
static void *allocate_motion(void)
{
    void *motion = Heap_Alloc(0xb8, data_ov027_021fef44, 4, gHeapContext);
    if (motion)
        motion = func_ov027_021fd718(motion);
    return motion;
}

/*
 * Updates child containers +0x120/+0x140/+0x150, then processes animated
 * objects in list +0x134. Each object receives its virtual +8 update; a raised
 * +0xAC event is consumed and creates four randomized motion objects around
 * its position. Odd particles take color from 0x021FE950 indexed by the
 * source descriptor. Objects in list +0x144 whose +0x98 bit 0 is raised each
 * create one tighter burst, consuming that bit and selecting a randomized
 * blue-biased color. PRNG state is scene +0x5BC and spawned objects are added
 * to container +0x150. Finally it advances resource manager +0x58, caches the
 * +0x118/+0x11C positions at +0x84..+0x98, and renders the scene. Returns void.
 */
extern "C" void func_ov027_021fe1c8(void *scene)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x120);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x140);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x150);
    void *rng = (u8 *)scene + 0x5bc;

    for (void *node = FIELD(void *, scene, 0x134); node;
         node = FIELD(void *, node, 8)) {
        UpdateCallback update = FIELD(UpdateCallback,
                                       FIELD(void *, node, 0), 8);
        update(node);
        s32 event = FIELD(s32, node, 0xac);
        FIELD(s32, node, 0xac) = 0;
        if (!event)
            continue;

        for (s32 i = 0; i < 4; ++i) {
            void *motion = allocate_motion();
            s32 x = FIELD(s32, node, 0x10) +
                    func_0209189c(rng, -0x100, 0x100);
            s32 y = FIELD(s32, node, 0x20) +
                    func_0209189c(rng, 0x80, 0x180);
            PresentationScalar_SetImmediate((u8 *)motion + 0xc, x);
            PresentationScalar_SetImmediate((u8 *)motion + 0x1c, y);
            PresentationScalar_SetImmediate((u8 *)motion + 0x2c, 0x100);
            FIELD(s32, motion, 0x9c) = func_0209189c(rng, -0x40, 0x40);
            FIELD(s32, motion, 0xa0) = func_0209189c(rng, 0x80, 0x100);
            FIELD(s32, motion, 0xa4) = 0x10;
            FIELD(s32, motion, 0xac) = 0x1e;
            FIELD(s32, motion, 0xa8) = TitleRandom_NextBounded(rng, 0x1e);
            if (i & 1) {
                const s32 *descriptor = FIELD(const s32 *, node, 0xa0);
                FIELD(u16, motion, 0xb4) =
                    data_ov027_021fe950[descriptor[0]];
            }
            PresentationList_Append((u8 *)scene + 0x150, motion);
        }
    }

    for (void *node = FIELD(void *, scene, 0x144); node;
         node = FIELD(void *, node, 8)) {
        if (!(FIELD(u16, node, 0x98) & 1))
            continue;
        FIELD(u16, node, 0x98) &= (u16)~1;
        void *motion = allocate_motion();
        s32 x = FIELD(s32, node, 0x10) +
                func_0209189c(rng, -0x100, 0x100);
        s32 y = FIELD(s32, node, 0x20) +
                func_0209189c(rng, -0x80, 0x80);
        PresentationScalar_SetImmediate((u8 *)motion + 0xc, x);
        PresentationScalar_SetImmediate((u8 *)motion + 0x1c, y);
        PresentationScalar_SetImmediate((u8 *)motion + 0x2c, 0x100);
        FIELD(s32, motion, 0x9c) = func_0209189c(rng, -0x40, 0x40);
        FIELD(s32, motion, 0xa0) = func_0209189c(rng, 0x80, 0x100);
        FIELD(s32, motion, 0xa4) = 0x80;
        FIELD(s32, motion, 0xac) = 0x10;
        FIELD(s32, motion, 0xa8) = 0;
        FIELD(u16, motion, 0xb4) =
            (u16)((func_0209189c(rng, 0, 0x10) << 10) | 0x3ff);
        PresentationList_Append((u8 *)scene + 0x150, motion);
    }

    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x58));
    void *first = FIELD(void *, scene, 0x118);
    FIELD(s32, scene, 0x84) = FIELD(s32, first, 0x10);
    FIELD(s32, scene, 0x88) = FIELD(s32, first, 0x20);
    FIELD(s32, scene, 0x8c) = FIELD(s32, first, 0x30);
    void *second = FIELD(void *, scene, 0x11c);
    FIELD(s32, scene, 0x90) = FIELD(s32, second, 0x10);
    FIELD(s32, scene, 0x94) = FIELD(s32, second, 0x20);
    FIELD(s32, scene, 0x98) = FIELD(s32, second, 0x30);
    func_ov027_021fe0f8(scene);
}
