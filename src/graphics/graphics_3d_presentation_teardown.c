
/* Portable reconstructions of the assembly-selected presentation teardown
 * chain rooted at retail 0x020A2324. */
#include "tingle/heap.h"
#include "tingle/graphics_3d_presentation.h"
#include "tingle/paired_entry_manager.h"
#include "tingle/sprite_effect.h"
#include "tingle/types.h"

typedef void (*ElementDestructor)(void *element);

extern void VecFx32_TerminateNoOp(void *vector);

/* Retail array delete helper at 0x020C0C24. The allocation prefix stores the
 * element count immediately before the first element; destruction runs in
 * reverse order and the caller-provided header size locates the owning heap
 * allocation. A null destructor skips element cleanup but still frees. */
void CxxArray_DestroyAndFree(void *array, u32 stride, u32 headerSize,
                   ElementDestructor destructor)
{
    u32 count;

    if (array == 0)
        return;
    if (destructor != 0) {
        count = *(u32 *)((u8 *)array - 4);
        while (count != 0) {
            --count;
            destructor((u8 *)array + count * stride);
        }
    }
    Heap_Free((u8 *)array - headerSize);
}

/* Destroy the subordinate buffers and vector arrays of one sprite effect. */
SpriteEffectInstance *SpriteEffectInstance_Destroy(
    SpriteEffectInstance *effect)
{
    s32 offset;

    for (offset = 0x28; offset >= 0x10; offset -= 4)
        Heap_Free(*(void **)((u8 *)effect + offset));
    CxxArray_DestroyAndFree(effect->velocities0c, 0x10, 8,
                   VecFx32_TerminateNoOp);
    CxxArray_DestroyAndFree(effect->positions08, 0x10, 8,
                   VecFx32_TerminateNoOp);
    return effect;
}

/* Destroy all thirty presentation slots in reverse retail order. */
void SpriteEffectManager_Clear(SpriteEffectManager *manager)
{
    s32 index;

    for (index = 29; index >= 0; --index) {
        SpriteEffectInstance *effect = manager->effects[index];

        if (effect != 0) {
            SpriteEffectInstance_Destroy(effect);
            Heap_Free(effect);
            manager->effects[index] = 0;
        }
    }
}

/* Update all thirty presentation slots in reverse retail order. Objects whose
 * update reports zero are synchronously destroyed and freed, and their slot is
 * cleared; live objects and empty slots remain unchanged. */
void SpriteEffectManager_Update(SpriteEffectManager *manager)
{
    s32 index;

    for (index = 29; index >= 0; --index) {
        SpriteEffectInstance *effect = manager->effects[index];

        if (effect != 0 && SpriteEffectInstance_Update(effect) == 0) {
            SpriteEffectInstance_Destroy(effect);
            Heap_Free(effect);
            manager->effects[index] = 0;
        }
    }
}

/* Submit all thirty live presentation slots in reverse retail order unless
 * the manager's +0x7C suppression flag is set. Slots and objects are borrowed;
 * this pass does not change ownership. */
void SpriteEffectManager_Render(SpriteEffectManager *manager)
{
    s32 index;

    if (manager->renderSuppressed7c != 0)
        return;
    for (index = 29; index >= 0; --index) {
        SpriteEffectInstance *effect = manager->effects[index];

        if (effect != 0)
            SpriteEffectInstance_Render(effect);
    }
}

/* Deactivate all fifteen paired entries and reset their wave phase. Scheduler,
 * origin, render parity, and other per-entry values remain retained. */
void PairedEntryManager_Clear(PairedEntryManager *manager)
{
    s32 index;

    for (index = PAIRED_ENTRY_CAPACITY - 1; index >= 0; --index) {
        manager->entryWavePhases[index] = 0;
        manager->entryHorizontalVelocityOrGrowthState[index] = 0;
    }
    manager->mode = 0;
}

/* Clear the instance's active state without changing its retained transform. */
void RupeeMeshInstance_Clear(RupeeMeshInstance *self)
{
    self->inactive = 1;
}

/* Clear live content while retaining all three owned child managers. */
void Graphics3dPresentation_Clear(Graphics3dPresentation *self)
{
    SpriteEffectManager_Clear(self->spriteEffectManager);
    PairedEntryManager_Clear(self->pairedEntryManager);
    RupeeMeshInstance_Clear(self->rupeeMeshInstance);
}
