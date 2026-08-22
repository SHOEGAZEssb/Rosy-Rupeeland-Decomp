#include "tingle/types.h"

/* Scalar controls for occupied entries in the resident sprite-effect pool. */
#ifdef __cplusplus
extern "C" {
#endif

/* Update the occupied slot's field at byte 0x46. */
void func_020a3418(void *manager, s32 index, u16 value)
{
    u8 *effect = (u8 *)*(void **)((u8 *)manager + 4 + index * 4);
    if (effect != 0)
        *(u16 *)(effect + 0x46) = value;
}

/* Update the occupied slot's field at byte 0x56. */
void func_020a342c(void *manager, s32 index, u16 value)
{
    u8 *effect = (u8 *)*(void **)((u8 *)manager + 4 + index * 4);
    if (effect != 0)
        *(u16 *)(effect + 0x56) = value;
}

/* Update the occupied slot's field at byte 0x58. */
void func_020a3440(void *manager, s32 index, u16 value)
{
    u8 *effect = (u8 *)*(void **)((u8 *)manager + 4 + index * 4);
    if (effect != 0)
        *(u16 *)(effect + 0x58) = value;
}

/* Update the occupied slot's field at byte 0x50. */
void func_020a3454(void *manager, s32 index, u16 value)
{
    u8 *effect = (u8 *)*(void **)((u8 *)manager + 4 + index * 4);
    if (effect != 0)
        *(u16 *)(effect + 0x50) = value;
}

/* Replace the occupied slot's paired Q12 bounds at bytes 0x3c and 0x40. */
void func_020a3468(void *manager, s32 index, s32 first, s32 second)
{
    u8 *effect = (u8 *)*(void **)((u8 *)manager + 4 + index * 4);
    if (effect != 0) {
        *(s32 *)(effect + 0x3c) = first;
        *(s32 *)(effect + 0x40) = second;
    }
}

#ifdef __cplusplus
}
#endif
