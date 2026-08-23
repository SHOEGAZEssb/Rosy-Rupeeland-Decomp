
/* Portable reconstructions of the assembly-selected presentation teardown
 * chain rooted at retail 0x020A2324. */
#include "tingle/heap.h"
#include "tingle/graphics_3d_presentation.h"
#include "tingle/types.h"

typedef void (*ElementDestructor)(void *element);

extern void VecFx32_TerminateNoOp(void *vector);
extern s32 func_020a3c78(void *object);
extern void func_020a3fc4(void *object);

/* Retail array delete helper at 0x020C0C24. The allocation prefix stores the
 * element count immediately before the first element; destruction runs in
 * reverse order and the caller-provided header size locates the owning heap
 * allocation. A null destructor skips element cleanup but still frees. */
void func_020c0c24(void *array, u32 stride, u32 headerSize,
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

/* Destroy the subordinate buffers and vector arrays of one 3D presentation. */
void func_020a3790(void *object)
{
    s32 offset;

    for (offset = 0x28; offset >= 0x10; offset -= 4)
        Heap_Free(*(void **)((u8 *)object + offset));
    func_020c0c24(*(void **)((u8 *)object + 0x0c), 0x10, 8,
                   VecFx32_TerminateNoOp);
    func_020c0c24(*(void **)((u8 *)object + 0x08), 0x10, 8,
                   VecFx32_TerminateNoOp);
}

/* Destroy all thirty presentation slots in reverse retail order. */
void func_020a33cc(void *manager)
{
    s32 index;

    for (index = 29; index >= 0; --index) {
        void **slot = (void **)((u8 *)manager + 4 + index * 4);
        if (*slot != 0) {
            func_020a3790(*slot);
            Heap_Free(*slot);
            *slot = 0;
        }
    }
}

/* Update all thirty presentation slots in reverse retail order. Objects whose
 * update reports zero are synchronously destroyed and freed, and their slot is
 * cleared; live objects and empty slots remain unchanged. */
void func_020a6280(void *manager)
{
    s32 index;

    for (index = 29; index >= 0; --index) {
        void **slot = (void **)((u8 *)manager + 4 + index * 4);
        if (*slot != 0 && func_020a3c78(*slot) == 0) {
            func_020a3790(*slot);
            Heap_Free(*slot);
            *slot = 0;
        }
    }
}

/* Submit all thirty live presentation slots in reverse retail order unless
 * the manager's +0x7C suppression flag is set. Slots and objects are borrowed;
 * this pass does not change ownership. */
void func_020a62e4(void *manager)
{
    s32 index;

    if (*(u32 *)((u8 *)manager + 0x7c) != 0)
        return;
    for (index = 29; index >= 0; --index) {
        void *object = *(void **)((u8 *)manager + 4 + index * 4);
        if (object != 0)
            func_020a3fc4(object);
    }
}

/* Reset the fifteen paired presentation-record tables and active byte. */
void func_020a2bc8(void *manager)
{
    s32 index;

    for (index = 14; index >= 0; --index) {
        *(u32 *)((u8 *)manager + 0xd0 + index * 4) = 0;
        *(u32 *)((u8 *)manager + 0x184 + index * 4) = 0;
    }
    *((u8 *)manager + 4) = 0;
}

/* Clear the instance's active state without changing its retained transform. */
void RupeeMeshInstance_Clear(RupeeMeshInstance *self)
{
    self->inactive = 1;
}

/* Clear live content while retaining all three owned child managers. */
void Graphics3dPresentation_Clear(Graphics3dPresentation *self)
{
    func_020a33cc(self->slotManager);
    func_020a2bc8(self->pairedEntryManager);
    RupeeMeshInstance_Clear(self->rupeeMeshInstance);
}
