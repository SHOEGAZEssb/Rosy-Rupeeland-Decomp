#include "tingle/types.h"

/* Overlay 15 contextual record selection and transient presentation-object control. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern u8 gHeapContext[];
extern const u32 data_ov015_021febe0[];
extern const u32 data_ov015_021fec28[];
extern const u32 data_ov015_021fec30[];
extern const u32 data_ov015_021fec38[];
extern const u32 data_ov015_021fec98[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *, s32);
extern void *Heap_Alloc(s32, const void *, s32, void *);
extern s32 ActorDescriptor_GetSubtype(void *);
extern void *InventoryRecord_GetMetadata(void *);
extern void *func_02070e0c(void *, s32, s32);
extern void func_02092260(void *, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void *func_020959d4(void *, s32, s32);
extern void func_02095bec(void *);
extern void ModalState_InitResources(void *, s32);
extern void ModalState_CopyAttachmentText(void *, void *);
extern void *func_ov001_021fc7e4(void *);
extern void func_ov015_021fce30(void *, u32, u32);
extern void func_ov015_021fd8a8(void *, s32);
extern s32 func_ov015_021fd8ec(void *);
extern s32 func_ov015_021fd9f0(void *, s32, s32, s32);
extern void func_ov015_021fda50(void *);
extern s32 func_ov015_021fda78(void *, void *);
#ifdef __cplusplus
}
#endif

static void overlay015_replace_one(void *state, s32 value)
{
    FIELD(s32, state, 0x300) = 0;
    func_ov015_021fda50(state);
    func_ov015_021fd8a8(state, value);
    func_ov015_021fd8ec(state);
}

/*
 * Rebuild or stop the three-record prompt set according to the selected
 * object's type and flags. Confirmed record values are 0x0D, 0x11, 0x24, and
 * 0x2C; flag 0x38B suppresses paths that offer 0x0D. The object reached via
 * +0xDC and the optional mode object at +0xEC are only described by offsets
 * because their semantic types remain unconfirmed. Return void; record objects
 * and count +0x300 may change, with no direct hardware access.
 */
extern "C" void func_ov015_021fdad4(void *state)
{
    s32 allowFlag = GameWork_TestFlag(gGameWork, 0x38b) == 0;
    void *status = func_ov001_021fc7e4(FIELD(void *, state, 0xdc));
    void *item = FIELD(void *, status, 0xc);
    s32 type;

    if (item == 0) {
        func_ov015_021fda50(state);
        return;
    }
    type = FIELD(u8, InventoryRecord_GetMetadata(item), 2);
    if (type != 1) {
        if (FIELD(void *, state, 0xec) != 0 || !allowFlag) {
            func_ov015_021fda50(state);
        } else {
            overlay015_replace_one(state, 0xd);
        }
        return;
    }

    if ((FIELD(u32, item, 0x20) & 1) != 0) {
        func_ov015_021fda50(state);
        return;
    }
    if (FIELD(void *, state, 0xec) != 0 &&
        FIELD(u16, FIELD(void *, state, 0xec), 4) != 0) {
        if (FIELD(u16, item, 4) == 0) {
            overlay015_replace_one(state, 0x24);
        } else if (ActorDescriptor_GetSubtype(item) == 1) {
            overlay015_replace_one(state, 0x2c);
        }
        return;
    }
    if (FIELD(void *, state, 0xec) != 0) {
        if (FIELD(u16, item, 4) == 0) {
            func_ov015_021fda50(state);
        } else if (ActorDescriptor_GetSubtype(item) == 1) {
            overlay015_replace_one(state, 0x2c);
        }
        return;
    }
    if (FIELD(u16, item, 4) == 0) {
        if (allowFlag) {
            overlay015_replace_one(state, 0xd);
        } else {
            func_ov015_021fda50(state);
        }
    } else if (ActorDescriptor_GetSubtype(item) == 1) {
        if (allowFlag) {
            func_ov015_021fd9f0(state, 0xd, 0x11, -1);
        } else {
            overlay015_replace_one(state, 0x11);
        }
    }
}

/*
 * Locate the record selected by the vector at +0x30, store its index at +0xF0,
 * and dispatch record values 0x0D/0x11/0x24/0x2C to confirmed transition pairs.
 * Values 0x0D and 0x11 also request sounds 0x5D and 2. Return zero when there is
 * no selected record, otherwise one; state transitions and audio may change.
 */
extern "C" s32 func_ov015_021fdd1c(void *state)
{
    s32 index = func_ov015_021fda78(state, (u8 *)state + 0x30);
    s32 value;
    const u32 *transition = 0;

    FIELD(s32, state, 0xf0) = index;
    if (index < 0) {
        return 0;
    }
    value = FIELD(s32, (u8 *)state + index * 0xac, 0x1a4);
    if (value == 0xd) {
        func_02092260(state, 0x5d);
        transition = data_ov015_021febe0;
    } else if (value == 0x11) {
        func_02092260(state, 2);
        transition = data_ov015_021fec38;
    } else if (value == 0x2c) {
        transition = data_ov015_021fec30;
    } else if (value == 0x24) {
        transition = data_ov015_021fec28;
    }
    if (transition != 0) {
        func_ov015_021fce30(state, transition[0], transition[1]);
    }
    return 1;
}

/*
 * Configure the +0x98 presentation handle for the requested screen, allocate
 * and construct a 0x2D0-byte transient object into +0xF8, optionally attach the
 * fourth argument, start it with the second argument, and set state bit 1 at
 * +0x48. Allocation uses the overlay descriptor and global heap context. Return
 * void; graphics/presentation state changes through the called SDK helpers.
 */
extern "C" void func_ov015_021fde00(void *state, s32 value, s32 alternate, void *attachment)
{
    void *handle = TitleScreenResourceCollection_Get((u8 *)state + 0x98, alternate != 0);
    void *object;

    func_02070e0c(handle, 1, 0);
    object = Heap_Alloc(0x2d0, data_ov015_021fec98, 4, gHeapContext);
    if (object != 0) {
        object = func_020959d4(object, 0, 0);
    }
    FIELD(void *, state, 0xf8) = object;
    if (attachment != 0) {
        ModalState_CopyAttachmentText(object, attachment);
    }
    ModalState_InitResources(object, value);
    FIELD(u32, state, 0x48) |= 2;
}

/*
 * Stop and delete the transient object at +0xF8 through vtable slot +4, clear
 * the stored pointer, and clear state bit 1 at +0x48. Return void; the called
 * teardown routine may release graphics resources, with no direct MMIO here.
 */
extern "C" void func_ov015_021fdeac(void *state)
{
    typedef void (*DeleteFunction)(void *);
    void *object = FIELD(void *, state, 0xf8);

    func_02095bec(object);
    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
    FIELD(void *, state, 0xf8) = 0;
    FIELD(u32, state, 0x48) &= ~2u;
}
