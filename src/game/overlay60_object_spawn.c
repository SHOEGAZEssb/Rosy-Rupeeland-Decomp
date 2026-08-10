#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/types.h"

/* Resolve script-driven presentation data and construct an overlay-60 object. */

typedef struct Overlay60ScriptContext {
    u8 pad00[0x84];
    void *owner84;
    u32 pad88;
    u32 flags8c;
    s8 displayValue90;
} Overlay60ScriptContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021f3ecc;
extern void *data_021f4090;
extern char data_020d5e00[];
extern s32 GamePhaseScriptVm_Pop(void *script);
extern u32 func_020be328(void);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u32 value);
extern void *func_020791e0(void *table, u16 index);
extern void Actor_GetCollection(void *owner);
extern void *func_02078e98(void *table, u32 index);
extern void *func_ov060_022100e4(void *self, s32 routedDisplay,
                                void *resource, s32 thirdOperand,
                                s32 secondOperand, void *sprite,
                                s32 presentationFlag, s32 argument1,
                                s32 argument2, s32 argument3,
                                s32 argument4, s32 argument5);
#ifdef __cplusplus
}
#endif

/*
 * Compare input's truth value with POWCNT1 bit 15, which indicates the current
 * main/sub display routing.  Returns one when they agree and zero otherwise;
 * only the hardware register is read.
 */
s32 func_0201d9e4(s32 input)
{
    s32 routed = (*(volatile u16 *)0x04000304 & 0x8000) >> 15;
    if (routed == 1)
        return input != 0;
    return input == 0;
}

/* Look up the fixed data_021f4090 table through func_02078e98 and return it. */
void *func_0201da20(void)
{
    return func_02078e98(data_021f4090, 0);
}

/*
 * If presentation flag bit 1, the owner sprite, and displayValue are usable,
 * choose an SDK-derived byte for the sprite, mark negative display values with
 * sprite flag 0x40, and set sprite halfword flag 2.  Returns no value.
 */
void func_0201da34(Overlay60ScriptContext *context)
{
    void *sprite = *(void **)((u8 *)context->owner84 + 0x54);
    s32 enabled = (s32)(context->flags8c << 30) >> 31;
    u32 value;

    if (enabled == 0 || sprite == 0 || context->displayValue90 == -128)
        return;
    value = func_020be328();
    GraphicsSpriteState_SetAnimationIndex(sprite, value & 0xff);
    if (context->displayValue90 < 0)
        *(u32 *)((u8 *)sprite + 0x24) |= 0x40;
    *(u16 *)((u8 *)sprite + 0x24) |= 2;
}

/*
 * Read five operands, update optional sprite presentation, resolve a resource
 * from either the indexed table or the owner's table, map the requested screen
 * through POWCNT1, load overlay 60 in slot 2, allocate 0x40 bytes, and forward
 * all recovered operands/arguments to the overlay constructor.  Returns the
 * constructed object, or null when allocation fails.
 */
void *func_0201da9c(Overlay60ScriptContext *context, s32 argument1,
                    s32 argument2, s32 argument3, s32 argument4,
                    s32 argument5)
{
    s32 useIndexed = GamePhaseScriptVm_Pop(context);
    s32 secondOperand = GamePhaseScriptVm_Pop(context);
    s32 thirdOperand = GamePhaseScriptVm_Pop(context);
    s32 requestedDisplay = GamePhaseScriptVm_Pop(context);
    s32 resourceIndex = GamePhaseScriptVm_Pop(context);
    void *resource;
    void *allocation;
    void *sprite;
    s32 presentationFlag;

    func_0201da34(context);
    if (useIndexed != 0)
        resource = func_020791e0(data_021f3ecc, (u16)resourceIndex);
    else {
        Actor_GetCollection(context->owner84);
        resource = func_02078e98(data_021f4090, resourceIndex);
    }
    requestedDisplay = func_0201d9e4(requestedDisplay);
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3c);
    allocation = Heap_Alloc(0x40, data_020d5e00, 4, &gHeapContext);
    if (allocation == 0)
        return 0;
    sprite = *(void **)((u8 *)context->owner84 + 0x54);
    presentationFlag = (s32)(context->flags8c << 30) >> 31;
    return func_ov060_022100e4(
        allocation, requestedDisplay, resource, thirdOperand, secondOperand,
        sprite, presentationFlag, argument1, argument2, argument3,
        argument4, argument5);
}
