#include "tingle/types.h"

/* Overlay 50 effect-list manager lifecycle and per-frame spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov050_0220e320[];
extern "C" u8 data_ov050_0220e384[];
extern "C" u8 data_ov050_0220e394[];
extern "C" u8 data_ov050_0220e3e0[];
extern "C" u8 gHeapContext[];
extern "C" void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                             void *heap);
extern "C" void Heap_Free(void *allocation);
extern "C" void *VecFx32Object_Destroy(void *vector);
extern "C" void *func_ov050_0220d600(void *effect, void *primaryGroup,
                                      void *secondaryGroup,
                                      const void *resources,
                                      const void *origin);
extern "C" void *Overlay050PairedEffect_Destroy(void *effect);
extern "C" s32 Overlay050PairedEffect_Update(void *effect, const void *transform);
extern "C" void Overlay050PairedEffect_ResetMotion(void *effect, s32 scale);
extern "C" void *Overlay050Effect_Destroy(void *manager);
extern "C" void Overlay050EffectManager_RemoveNode(void *manager, void *node);

/*
 * Unlink and destroy every owned effect/list node, destroy the manager's
 * embedded origin vector, run the recovered base teardown, and return the
 * unchanged manager pointer. Heap and SDK resource state change; manager
 * storage remains caller-owned.
 */
extern "C" void *Overlay050EffectManager_Destroy(void *manager)
{
    void *node = FIELD(void *, manager, 4);

    while (node != 0) {
        void *next = FIELD(void *, node, 0);
        void *effect = FIELD(void *, node, 8);

        Overlay050EffectManager_RemoveNode(manager, node);
        if (effect != 0) {
            Overlay050PairedEffect_Destroy(effect);
            Heap_Free(effect);
        }
        node = next;
    }
    VecFx32Object_Destroy((u8 *)manager + 0x20);
    FIELD(void *, manager, 0) = data_ov050_0220e384;
    Overlay050Effect_Destroy(manager);
    return manager;
}

/*
 * Unlink `node` from `manager`'s doubly linked list and free the node storage.
 * The pointed-to effect remains caller-owned. The count is decremented and the
 * manager base state is torn down when the list becomes empty. Heap and manager
 * state change; no value is returned and no direct MMIO occurs.
 */
extern "C" void Overlay050EffectManager_RemoveNode(void *manager, void *node)
{
    void *next = FIELD(void *, node, 0);
    void *previous = FIELD(void *, node, 4);

    if (FIELD(void *, manager, 4) == node)
        FIELD(void *, manager, 4) = next;
    else
        FIELD(void *, previous, 0) = next;
    if (FIELD(void *, manager, 8) == node)
        FIELD(void *, manager, 8) = previous;
    else
        FIELD(void *, next, 4) = previous;
    Heap_Free(node);
    if (--FIELD(s32, manager, 0x0c) == 0)
        Overlay050Effect_Destroy(manager);
}

/*
 * Advance one manager frame. At the recovered cadence, allocate and append an
 * effect/list node while below the ten-effect limit; then update every effect
 * against `transform` and unlink/free completed entries. Return zero. Heap,
 * RNG, manager-list, and SDK sprite/resource state can change.
 */
extern "C" s32 Overlay050EffectManager_Update(void *manager, const void *transform)
{
    void *node;

    if (FIELD(s32, manager, 0x34) != 0 &&
        ++FIELD(s32, manager, 0x10) > 10) {
        FIELD(s32, manager, 0x10) = 0;
        if (FIELD(s32, manager, 0x0c) < 10) {
            void *effect = Heap_Alloc(0x2c, data_ov050_0220e3e0, 4,
                                      gHeapContext);
            void *newNode;

            if (effect != 0)
                effect = func_ov050_0220d600(
                    effect, FIELD(void *, manager, 0x14),
                    FIELD(void *, manager, 0x18),
                    FIELD(void *, manager, 0x1c),
                    (u8 *)manager + 0x20);
            Overlay050PairedEffect_ResetMotion(effect, FIELD(s32, manager, 0x30));
            newNode = Heap_Alloc(0x0c, data_ov050_0220e320, 4,
                                 gHeapContext);
            if (newNode != 0) {
                FIELD(void *, newNode, 0) = 0;
                FIELD(void *, newNode, 4) = 0;
                FIELD(void *, newNode, 8) = effect;
            }
            if (FIELD(void *, manager, 8) != 0) {
                FIELD(void *, FIELD(void *, manager, 8), 0) = newNode;
                FIELD(void *, newNode, 4) = FIELD(void *, manager, 8);
            } else {
                FIELD(void *, manager, 4) = newNode;
            }
            FIELD(void *, manager, 8) = newNode;
            ++FIELD(s32, manager, 0x0c);
        }
    }

    node = FIELD(void *, manager, 4);
    while (node != 0) {
        void *next = FIELD(void *, node, 0);
        void *effect = FIELD(void *, node, 8);
        u8 point[12];

        FIELD(void *, point, 0) = data_ov050_0220e394;
        FIELD(s32, point, 4) = FIELD(s32, transform, 4) >> 12;
        FIELD(s32, point, 8) = FIELD(s32, transform, 8) >> 12;
        if (Overlay050PairedEffect_Update(effect, point) != 0) {
            Overlay050EffectManager_RemoveNode(manager, node);
            if (effect != 0) {
                Overlay050PairedEffect_Destroy(effect);
                Heap_Free(effect);
            }
        }
        node = next;
    }
    return 0;
}
