#include "tingle/types.h"

/* Dispatch actor animation changes and provide default virtual methods. */
typedef struct AnimationStateVTable {
    u8 field_00[0x5c];
    void (*changed_5c)(void *);
    u8 field_60[8];
    s32 (*steady_68)(void *);
} AnimationStateVTable;

/* Ignore the implied actor input, change no state, and return no value. */
void func_02032928(void)
{
}

/*
 * Compare current/previous halfwords 0xd6/0xd8 and 0xda/0xdc plus bytes
 * 0xd4/0xd5. If any differ, or word 0xd0 has flag 0x1000, call vtable offset
 * 0x5c and clear that flag. Otherwise call vtable offset 0x68; when it returns
 * nonzero, copy halfword 0xde to attachment-0x54 halfword 0x36. Returns no
 * value; virtual callbacks may update animation and presentation state.
 */
void Actor_UpdateAnimationState(void *self)
{
    u8 *actor = (u8 *)self;
    AnimationStateVTable *vtable = *(AnimationStateVTable **)actor;

    if (*(s16 *)(actor + 0xd6) != *(s16 *)(actor + 0xd8) ||
        *(s16 *)(actor + 0xda) != *(s16 *)(actor + 0xdc) ||
        actor[0xd4] != actor[0xd5] || (*(u32 *)(actor + 0xd0) & 0x1000)) {
        vtable->changed_5c(actor);
        *(u32 *)(actor + 0xd0) &= ~0x1000;
    } else if (vtable->steady_68(actor)) {
        *(s16 *)(*(u8 **)(actor + 0x54) + 0x36) = *(s16 *)(actor + 0xde);
    }
}

/* Ignore the implied actor input, change no state, and return no value. */
void func_020329a8(void)
{
}

/* Ignore the implied inputs and return zero without changing state. */
s32 func_020329ac(void)
{
    return 0;
}

/* Ignore the implied inputs and return zero without changing state. */
s32 func_020329b4(void)
{
    return 0;
}
