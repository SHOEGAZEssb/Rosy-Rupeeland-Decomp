#include "tingle/types.h"

/* Overlay 16 actor-group duplicate suppression and actor spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const char data_ov016_02201580[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void PresentationList_Append(void *, void *);
extern void SpritePresentation_SyncPosition(void *);
extern void SpriteMotionController_Show(void *);
extern void *Overlay016_SpriteWrapper_Init(void *, void *, void *);
extern void Overlay016_LayoutActors(void *);
extern s32 func_ov016_021fe358(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Add actors for target when no existing +0xD4 list node references that same
 * target at +0xAC. Search the table wrapped by argument two for a 0x24-byte row
 * whose leading halfword matches target +0x0C/+0. Its +4 halfword gives the actor
 * count. Allocate 0xB0-byte sprite wrappers, construct them from target and child
 * +0x18, append them to list base +0xD0, position them from signed target +0x10/
 * +0x2C/+0x2E plus linked offsets +0x18/+0x1C, and activate them. Re-layout the
 * list; if the previous count +0xDC equals the wrapper's aggregate value, start
 * actor record +0x20. Return the matched row count, or zero for duplicates/no
 * match. Heap/list/actor state changes; no direct MMIO.
 */
extern "C" s32 Overlay016_SpawnMatchingActors(void *state, void *wrapper, void *target)
{
    void *node;
    void *table;
    s32 rowIndex;
    s32 result = 0;

    for (node = FIELD(void *, state, 0xd4); node != 0; node = FIELD(void *, node, 8)) {
        if (FIELD(void *, node, 0xac) == target) {
            return 0;
        }
    }

    table = FIELD(void *, wrapper, 0);
    for (rowIndex = 0; rowIndex < FIELD(s32, table, 0x100); rowIndex++) {
        void *row = (u8 *)table + 0x28 + rowIndex * 0x24;

        if (FIELD(u16, row, 0) == FIELD(u16, FIELD(void *, target, 0xc), 0)) {
            void *position = FIELD(void *, target, 0x10);
            void *base = FIELD(void *, position, 0);
            s32 i;

            result = FIELD(u16, row, 4);
            for (i = 0; i < result; i++) {
                void *actor = Heap_Alloc(0xb0, data_ov016_02201580, 4, gHeapContext);
                if (actor != 0) {
                    actor = Overlay016_SpriteWrapper_Init(actor, target, FIELD(void *, state, 0x18));
                }
                PresentationList_Append((u8 *)state + 0xd0, actor);
                Presentation_SetPosition(actor,
                              (FIELD(s16, position, 0x2c) + FIELD(s32, base, 0x18)) << 12,
                              (FIELD(s16, position, 0x2e) + FIELD(s32, base, 0x1c)) << 12,
                              0);
                SpritePresentation_SyncPosition(actor);
            }
            Overlay016_LayoutActors(state);
            if (FIELD(s32, state, 0xdc) == func_ov016_021fe358(state, wrapper)) {
                SpriteMotionController_Show((u8 *)state + 0x20);
            }
            break;
        }
    }
    return result;
}
