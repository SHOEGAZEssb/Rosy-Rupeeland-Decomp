#include "tingle/types.h"

/*
 * Overlay 13 auxiliary presentation helpers. These recovered routines manage
 * the optional objects at +0x9A4/+0x9A8 and activate indexed 0xAC-byte records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGamePhaseRuntime;
extern const char data_ov013_021fed88[];
extern const char data_ov013_021fed90[];
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseRuntime_SetPlacementMode(void *, s32, s32);
extern void *Heap_Alloc(u32, const char *, s32, void *);
extern void *func_ov006_021fb708(void *);
extern void *func_020959d4(void *, s32, s32);
extern void ModalState_CopyAttachmentText(void *, void *);
extern void ModalState_InitResources(void *, s32);
extern void func_02095bec(void *);
extern s32 func_02095958(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay013VirtualMethod)(void *);

/* Sign-extend argument two to +0x7C, clear +0x80, and return void without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fda28(void *record, s32 limit)
{
    FIELD(s32, record, 0x7c) = (s16)limit;
    FIELD(s32, record, 0x80) = 0;
}

/*
 * Disable a global runtime mode, allocate and construct the 0xB8-byte object
 * stored at +0x9A8, set state flag bit 0x400 at +0x20, and return void. The
 * presentation role is inferred from the shared overlay 6 constructor.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fda40(void *state)
{
    void *object;

    GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 0, 1);
    object = Heap_Alloc(0xb8, data_ov013_021fed88, 4, gHeapContext);
    if (object != 0)
        object = func_ov006_021fb708(object);
    FIELD(void *, state, 0x9a8) = object;
    FIELD(u32, state, 0x20) |= 0x400;
}

/*
 * Allocate and initialize the 0x2D0-byte object at +0x9A4, optionally attach
 * argument three, configure it with argument two, set bit 1 at +0x48, and
 * return void. Exact object semantics remain unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fda9c(void *state, s32 setting, void *optional)
{
    void *object = Heap_Alloc(0x2d0, data_ov013_021fed90, 4, gHeapContext);

    if (object != 0)
        object = func_020959d4(object, 0, 0);
    FIELD(void *, state, 0x9a4) = object;
    if (optional != 0)
        ModalState_CopyAttachmentText(object, optional);
    ModalState_InitResources(object, setting);
    FIELD(u32, state, 0x48) |= 2;
}

/*
 * Stop the object at +0x9A4, invoke its vtable slot +4 when present, clear the
 * pointer and state flag bit 1 at +0x48, and return void. The indirect call may
 * release the allocation and has whatever SDK effects its dynamic type owns.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fdb10(void *state)
{
    void *object = FIELD(void *, state, 0x9a4);

    func_02095bec(object);
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((Overlay013VirtualMethod)vtable[1])(object);
    }
    FIELD(void *, state, 0x9a4) = 0;
    FIELD(u32, state, 0x48) &= ~2u;
}

/*
 * Set bit 1 in halfword +0x98 of indexed 0xAC-byte record argument two. If
 * func_02095958 reports it active, select value 0x1A on the associated pointer
 * at state +0x950[index] and clear its halfword flag bit 2 at +0x24. Return
 * void; callees may update graphics/animation state.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fdb50(void *state, s32 index)
{
    u8 *record = (u8 *)state + 0x8c + index * 0xac;
    void *associated;

    FIELD(u16, record, 0x98) |= 2;
    if (func_02095958(record) == 0)
        return;
    associated = FIELD(void *, state, 0x950 + index * 4);
    GraphicsSpriteState_SetAnimationIndex(associated, 0x1a);
    FIELD(u16, associated, 0x24) &= (u16)~4;
}
