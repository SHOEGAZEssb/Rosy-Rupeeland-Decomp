#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Small virtual methods shared by overlay-90 boss-stage participant actors. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Return the participant's fixed 0x40000 extent. */
s32 func_ov090_0221b8c8(void)
{
    return 0x40000;
}

/* Return zero for the participant's secondary extent/property query. */
s32 func_ov090_0221b8d0(void)
{
    return 0;
}

/* Copy the actor's embedded vector at +0x18 into `destination`. */
VecFx32Object *func_ov090_0221b8d8(VecFx32Object *destination, void *actor)
{
    return VecFx32Object_InitCopy(
        destination, (const VecFx32Object *)((u8 *)actor + 0x18));
}

/* Return flag bit 0x80 from participant word +0xd0. */
u32 func_ov090_0221b8e8(const void *self)
{
    return FIELD(u32, self, 0xd0) & 0x80;
}

/* Return one when flag bit 0x40 is set in participant word +0xd0. */
s32 func_ov090_0221b8f4(const void *self)
{
    return (FIELD(u32, self, 0xd0) & 0x40) != 0;
}

/* Return zero for the participant's unimplemented status query. */
s32 func_ov090_0221b908(void)
{
    return 0;
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b910(void)
{
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b914(void)
{
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b918(void)
{
}

/* Set participant flag bit 0x80 at +0xd0. */
void func_ov090_0221b91c(void *self)
{
    FIELD(u32, self, 0xd0) |= 0x80;
}

/* Return zero for an unimplemented participant interaction query. */
s32 func_ov090_0221b92c(void)
{
    return 0;
}

/* Return zero for an unimplemented participant interaction query. */
s32 func_ov090_0221b934(void)
{
    return 0;
}

/* Return zero for an unimplemented participant interaction query. */
s32 func_ov090_0221b93c(void)
{
    return 0;
}

/* Return zero for an unimplemented participant interaction query. */
s32 func_ov090_0221b944(void)
{
    return 0;
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b94c(void)
{
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b950(void)
{
}

/* No-op participant virtual hook retained for vtable layout. */
void func_ov090_0221b954(void)
{
}

/* Return the participant resource/type value 0x309. */
s32 func_ov090_0221b958(void)
{
    return 0x309;
}

/* Return the participant width value 0x210. */
s32 func_ov090_0221b964(void)
{
    return 0x210;
}

/* Return the participant height/value 0x200. */
s32 func_ov090_0221b96c(void)
{
    return 0x200;
}

/* Return the participant vertical bound value 0xb0. */
s32 func_ov090_0221b974(void)
{
    return 0xb0;
}

/* OR `flags` into sprite flag halfword +0x24 for both bound sprites. */
void func_ov090_0221b97c(void *self, u16 flags)
{
    FIELD(u16, FIELD(void *, self, 4), 0x24) |= flags;
    FIELD(u16, FIELD(void *, self, 8), 0x24) |= flags;
}
