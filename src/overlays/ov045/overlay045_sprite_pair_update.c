#include "tingle/types.h"

/*
 * Overlay 45 paired-sprite runtime update. These recovered callbacks dispatch
 * the object's virtual draw/update hook, advance its randomized animation wait
 * state, and expose small font/mode controls.
 * The matching assembly preserves the compiler-sensitive switch epilogues in
 * func_ov045_0220c1ac; its portable behavior remains documented below.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *GraphicsSpriteGroup_AdvanceAnimations(void *resource);
extern "C" s32 func_0209189c(void *seed, s32 minimum, s32 maximum);
extern "C" s32 func_020918f4(void *seed, s32 modulus);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 animation);
extern "C" void func_ov045_0220c068(void *object);

#ifdef MATCHING_BUILD
class SpritePairVirtual {
public:
    virtual void slot0();
    virtual void slot1();
    virtual void slot2();
};
#endif

/*
 * Invoke virtual slot 2 for the object, then update font resource +0x1C.
 * Virtual rendering and shared font/display state change; no value is returned.
 */
extern "C" void func_ov045_0220c18c(void *object)
{
#ifdef MATCHING_BUILD
    ((SpritePairVirtual *)object)->slot2();
#else
    void (**vtable)(void *) = *(void (***)(void *))object;

    vtable[2](object);
#endif
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0x1c));
}

/*
 * Advance the paired-sprite's special wait state. In mode 1, choose a delay
 * 30..240 from seed +0x34, store it at +0x2C, and enter mode 5. In mode 5,
 * count down; when it reaches zero choose animation 4 or 5 modulo three and
 * clear sprite control bits 0/1. Once a zero delay observes sprite completion
 * bit 0, return to mode 1. Other modes are unchanged. Sprite/PRNG state changes.
 */
#ifndef MATCHING_BUILD
extern "C" void func_ov045_0220c1ac(void *object)
{
    switch (FIELD(s32, object, 0x28)) {
    case 0:
        return;
    case 1:
        FIELD(s32, object, 0x2c) =
            func_0209189c((u8 *)object + 0x34, 0x1e, 0xf0);
        FIELD(s32, object, 0x28) = 5;
        return;
    case 5: {
        if (FIELD(s32, object, 0x2c) != 0) {
            --FIELD(s32, object, 0x2c);
            if (FIELD(s32, object, 0x2c) != 0)
                return;
            if (func_020918f4((u8 *)object + 0x34, 3) != 0)
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 4);
            else
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 5);
            void *sprite = FIELD(void *, object, 0x20);
            FIELD(u16, sprite, 0x24) &= ~3;
            return;
        }
        u16 completed = FIELD(u16, FIELD(void *, object, 0x20), 0x24) & 1;
        if (completed != 0)
            func_ov045_0220c068(object);
        return;
    }
    case 2:
        return;
    case 3:
        return;
    case 4:
        return;
    }
}
#endif
