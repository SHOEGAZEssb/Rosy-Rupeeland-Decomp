#include <stddef.h>

#include "tingle/types.h"

/*
 * Overlay 11 scene callback and sub-background scroll tail. These small
 * entry points connect the two debug scenes to their embedded scene members,
 * deleting destructors, and the sub-engine BG0/BG1 scroll registers.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *func_ov011_021fd08c(void *state);
extern void *func_ov011_021fd0fc(void *state);
extern void *func_ov011_021fdde0(void *state);
extern void *func_ov011_021fde34(void *state);
extern void SceneInputBase_Update(void *member, s32 active);

typedef void (*Overlay011DeletingDestructor)(void *object);

/* Invoke the object's deleting destructor when non-null, then report success. */
s32 func_ov011_021fdaf8(void *object)
{
    if (object != NULL) {
        void **vtable = *(void ***)object;
        Overlay011DeletingDestructor destructor =
            (Overlay011DeletingDestructor)vtable[1];
        destructor(object);
    }
    return 1;
}

/*
 * Publish the scene's signed X/Y debug offsets to both sub-engine background
 * scroll pairs. Hardware consumes only the low nine bits of each component.
 * Return zero after the four MMIO writes.
 */
s32 func_ov011_021fdb18(void *state)
{
    volatile u32 *subBgScroll = (volatile u32 *)0x04001010;
    u32 packed = ((u32)FIELD(s32, state, 0xfc) & 0x1ff) |
                 (((u32)FIELD(s32, state, 0x100) & 0x1ff) << 16);

    subBgScroll[0] = packed;
    subBgScroll[1] = packed;
    return 0;
}

/* Activate the second debug scene's embedded member at +0x24. */
void func_ov011_021fde90(void *state)
{
    SceneInputBase_Update((u8 *)state + 0x24, 1);
}

/* Invoke the object's deleting destructor when non-null, then report success. */
s32 func_ov011_021fe310(void *object)
{
    if (object != NULL) {
        void **vtable = *(void ***)object;
        Overlay011DeletingDestructor destructor =
            (Overlay011DeletingDestructor)vtable[1];
        destructor(object);
    }
    return 1;
}

/* Adjust an embedded-member pointer back to its first scene and delete it. */
void *func_ov011_021fe330(void *member)
{
    return func_ov011_021fd0fc((u8 *)member - 0x24);
}

/* Adjust an embedded-member pointer back to its first scene and destroy it. */
void *func_ov011_021fe340(void *member)
{
    return func_ov011_021fd08c((u8 *)member - 0x24);
}

/* Adjust an embedded-member pointer back to its second scene and delete it. */
void *func_ov011_021fe350(void *member)
{
    return func_ov011_021fde34((u8 *)member - 0x24);
}

/* Adjust an embedded-member pointer back to its second scene and destroy it. */
void *func_ov011_021fe360(void *member)
{
    return func_ov011_021fdde0((u8 *)member - 0x24);
}
