#include "tingle/types.h"

/*
 * Overlay 45 paired-sprite mode control. These recovered callbacks select one
 * of four animation IDs on sprite +0x20, normalize its visibility/control
 * flags, and track the selected logical mode at +0x28.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 animation);

/*
 * Select logical mode 2 and sprite animation 3 unless mode 2 is already
 * active. Set control bit 1, clear bit 0, and update +0x28. Sprite state
 * changes; no return value.
 */
extern "C" void func_ov045_0220c028(void *object)
{
    if (FIELD(s32, object, 0x28) == 2)
        return;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 3);
    void *sprite = FIELD(void *, object, 0x20);
    FIELD(u16, sprite, 0x24) = (FIELD(u16, sprite, 0x24) | 2) & ~1;
    FIELD(s32, object, 0x28) = 2;
}

/*
 * Select logical mode 1 and sprite animation 0 unless already active. Set
 * control bit 1, clear bit 0, and update +0x28; no value is returned.
 */
extern "C" void func_ov045_0220c068(void *object)
{
    if (FIELD(s32, object, 0x28) == 1)
        return;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 0);
    void *sprite = FIELD(void *, object, 0x20);
    FIELD(u16, sprite, 0x24) = (FIELD(u16, sprite, 0x24) | 2) & ~1;
    FIELD(s32, object, 0x28) = 1;
}

/*
 * Select logical mode 3 and sprite animation 2 unless already active. Set
 * control bit 1, clear bit 0, and update +0x28; no value is returned.
 */
extern "C" void func_ov045_0220c0a8(void *object)
{
    if (FIELD(s32, object, 0x28) == 3)
        return;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 2);
    void *sprite = FIELD(void *, object, 0x20);
    FIELD(u16, sprite, 0x24) = (FIELD(u16, sprite, 0x24) | 2) & ~1;
    FIELD(s32, object, 0x28) = 3;
}

/*
 * Select logical mode 4 and sprite animation 1 unless already active. Set
 * control bit 1, clear bit 0, and update +0x28; no value is returned.
 */
extern "C" void func_ov045_0220c0e8(void *object)
{
    if (FIELD(s32, object, 0x28) == 4)
        return;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x20), 1);
    void *sprite = FIELD(void *, object, 0x20);
    FIELD(u16, sprite, 0x24) = (FIELD(u16, sprite, 0x24) | 2) & ~1;
    FIELD(s32, object, 0x28) = 4;
}

/*
 * Map selector values 0..6 to a concrete paired-sprite mode. Values 0, 5,
 * and 6 choose mode 2; 1 chooses mode 3; 2 and 4 choose mode 4; 3 chooses
 * mode 1. Out-of-range selectors do nothing. Sprite state changes through the
 * selected helper and no value is returned.
 */
extern "C" void func_ov045_0220c128(void *object, u32 selector)
{
    switch (selector) {
    case 0:
    case 5:
    case 6:
        func_ov045_0220c028(object);
        break;
    case 1:
        func_ov045_0220c0a8(object);
        break;
    case 2:
    case 4:
        func_ov045_0220c0e8(object);
        break;
    case 3:
        func_ov045_0220c068(object);
        break;
    }
}

/*
 * If logical mode 2 is active, normalize the object back to mode 1 through
 * func_ov045_0220c068. Other modes are unchanged; no value is returned.
 */
extern "C" void func_ov045_0220c174(void *object)
{
    if (FIELD(s32, object, 0x28) == 2)
        func_ov045_0220c068(object);
}
