#include "tingle/types.h"

/* Overlay 38 ordered presentation teardown and deleting/non-deleting variants. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay038DeleteFn)(void *object);

extern const u8 data_ov038_021fdd28[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020280d8(void *label);
extern void func_ov046_0220ba80(void *panel);
extern void func_0207419c(void *resourceOwner);
extern void func_020927b8(void *transform);
extern void func_ov038_021fce00(void *list);
extern void func_02071eb8(void *resource);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

static void releasePresentationContents(void *presentation)
{
    FIELD(u32, presentation, 0x20) &= ~0x400u;
    void *label = FIELD(void *, presentation, 0x344);
    if (label != 0) {
        func_020280d8(label);
        Heap_Free(label);
    }
    void *panel = FIELD(void *, presentation, 0x340);
    if (panel != 0) {
        func_ov046_0220ba80(panel);
        Heap_Free(panel);
    }
    func_0207419c(FIELD(void *, presentation, 0x60));
    void *model = FIELD(void *, presentation, 0x314);
    if (model != 0) {
        Overlay038DeleteFn *vtable = FIELD(Overlay038DeleteFn *, model, 0);
        vtable[1](model);
    }
    func_020927b8((u8 *)presentation + 0x318);
    func_ov038_021fce00((u8 *)presentation + 0x64);
    func_02071eb8((u8 *)presentation + 0x54);
}

/*
 * Reinstalls the overlay vtable, clears active flag 0x400, destroys/frees the
 * +0x344 label and +0x340 panel, releases owner +0x60, deletes optional model
 * +0x314 through vtable slot +4, and tears down +0x318/+0x64/+0x54 embedded
 * state in that order. Returns presentation without freeing it; heap/UI,
 * archive, model, and embedded subsystem state change.
 */
extern "C" void *func_ov038_021fd0d8(void *presentation)
{
    FIELD(const void *, presentation, 0) = data_ov038_021fdd28;
    releasePresentationContents(presentation);
    return presentation;
}

/*
 * Deleting variant: performs the same ordered resource release, frees the
 * presentation itself, and returns its former address for ABI compatibility.
 */
extern "C" void *func_ov038_021fd170(void *presentation)
{
    FIELD(const void *, presentation, 0) = data_ov038_021fdd28;
    releasePresentationContents(presentation);
    Heap_Free(presentation);
    return presentation;
}
