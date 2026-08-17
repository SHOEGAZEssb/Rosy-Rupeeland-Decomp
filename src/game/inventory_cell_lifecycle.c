/*
 * Lifecycle for the 0x20-byte inventory grid cell records shared by overlays
 * 0, 1, and 44. Each cell embeds the common resource handle at offset zero.
 */
#include "tingle/types.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_Destroy(void *resource);

/* Initialize the embedded resource and clear every cell-owned pointer/value. */
void *InventoryCell_Init(void *cell)
{
    AnimationResourceState_InitEmbedded(cell);
    FIELD(u32, cell, 0x0c) = 0;
    FIELD(u32, cell, 0x10) = 0;
    FIELD(u32, cell, 0x14) = 0;
    FIELD(u32, cell, 0x18) = 0;
    FIELD(u32, cell, 0x1c) = 0;
    return cell;
}

/* Release the embedded resource without freeing caller-owned cell storage. */
void *InventoryCell_Destroy(void *cell)
{
    AnimationResourceState_Destroy(cell);
    return cell;
}
