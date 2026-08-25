#include "tingle/types.h"

/*
 * Overlay 41 effect-controller construction. This recovered constructor builds
 * a 91-record pool, owns an overlay-8 helper object, creates seven render
 * children with three resource modes, and initializes extensive effect state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void *func_ov041_021ff1cc(void *);
void __construct_array(void *, s32, s32, void *, void *);
void func_ov041_021fd000(void *);
void func_ov041_021fce00(void *);
void *Heap_Alloc(s32, const void *, s32, void *);
void *Overlay008_Controller_Init(void *, void *, s32);
void *func_0209a208(void *, s32, s32, s32, s32, s32);
void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern u8 data_ov041_022059b8;
extern u8 data_ov041_022059d0;
extern u8 gHeapContext;
}

typedef void (*PlacementCallback)(void *, void *, s32, s32, s32, s32);

static void create_effect_render(void *object, s32 slot, void *context,
                                 s32 resourceMode)
{
    void *render = func_0209a208(object, 0x12d8, 0x12d9, 0x12da,
                                 (s32)context, 2);
    FIELD(void *, object, 0x4c + slot * 4) = render;
    PlacementCallback place = *(PlacementCallback *)FIELD(void *, object, 0);
    place(object, render, 0x40000, 0x64000, 0, 0);
    FIELD(u16, render, 0x42) |= 4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, render, 0x0c), resourceMode);
}

/*
 * Initialize object and its 91 embedded 12-byte records, then initialize an
 * additional coordinate record at 0x4AC. Allocate 0x8BC bytes and construct
 * the overlay-8 helper when allocation succeeds. Create render slot zero with
 * resource mode zero, slots one through five with mode one, and slot six with
 * mode two; every child starts hidden. Object placement defaults to
 * (0x80000,0xA000,0), scales to 0x100, and all counters/pointers from 0x6C and
 * 0x8FC..0x954 are cleared as observed. Returns object and takes ownership of
 * all constructed resources; no direct hardware writes occur.
 */
extern "C" void *func_ov041_0220106c(void *object, void *owner, void *context)
{
    func_ov041_021ff1cc(object);
    FIELD(void *, object, 0) = &data_ov041_022059b8;
    __construct_array((u8 *)object + 0x68, 0x5b, 12,
                      (void *)func_ov041_021fd000,
                      (void *)func_ov041_021fce00);
    func_ov041_021fd000((u8 *)object + 0x4ac);
    FIELD(void *, object, 0x48) = owner;

    void *helperMemory = Heap_Alloc(0x8bc, &data_ov041_022059d0, 4,
                                    &gHeapContext);
    if (helperMemory != 0)
        helperMemory = Overlay008_Controller_Init(helperMemory, owner, (s32)context);
    FIELD(void *, object, 0x958) = helperMemory;

    create_effect_render(object, 0, context, 0);
    FIELD(s32, object, 0x8fc) = 0;
    for (s32 slot = 1; slot < 6; ++slot) {
        create_effect_render(object, slot, context, 1);
        FIELD(s32, object, 0x8fc + slot * 4) = 0;
    }
    create_effect_render(object, 6, context, 2);

    FIELD(s32, object, 0x914) = 0;
    FIELD(s32, object, 0x30) = 0x80000;
    FIELD(s32, object, 0x34) = 0xa000;
    FIELD(s32, object, 0x38) = 0;
    FIELD(u16, object, 0x3c) = 0x100;
    FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
    FIELD(s32, object, 0x6c) = 0;
    FIELD(s32, object, 0x70) = 0;
    FIELD(s32, object, 0x78) = 0;
    FIELD(s32, object, 0x7c) = 0;
    FIELD(s32, object, 0x918) = 0;
    FIELD(s32, object, 0x920) = 0;
    FIELD(s32, object, 0x924) = 0;
    FIELD(s32, object, 0x928) = 0;
    FIELD(s32, object, 0x92c) = 0;
    FIELD(s32, object, 0x930) = 0;
    FIELD(s32, object, 0x934) = 0;
    FIELD(s32, object, 0x938) = 0;
    FIELD(s32, object, 0x93c) = 0;
    FIELD(s32, object, 0x944) = 0;
    FIELD(s32, object, 0x94c) = 0;
    FIELD(s32, object, 0x950) = 0;
    FIELD(s32, object, 0x954) = 0;
    return object;
}
