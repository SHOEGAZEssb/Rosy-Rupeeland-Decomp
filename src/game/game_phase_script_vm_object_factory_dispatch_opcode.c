#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/*
 * Dispatch a script-selected runtime-object operation.  Most modes allocate a
 * concrete object, run its recovered constructor, and register it in one of
 * the game-phase runtime's two owned lists; several modes instead update
 * debug-font storage or invoke a global phase action.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *data_020f4e14;
extern void *gDebugFont;
extern const char data_020d5b34[];
extern const char data_020d5b74[];
extern const char data_020d5b94[];
extern const char data_020d5b9c[];
extern const char data_020d5ba4[];
extern const char data_020d5bac[];
extern const char data_020d5bb4[];
extern const char data_020d5bbc[];
extern const char data_020d5bc4[];
extern const char data_020d5bcc[];
extern const char data_020d5bd4[];
extern const char data_020d5bdc[];
extern const char data_020d5be4[];
extern void func_0201ded4(void *list, void *object);
extern void func_0201df44(void *list, void *object);
extern void *func_0201d240(void *object, s32 enabled, s32 value);
extern void *func_0201d688(void *object, s32 value);
extern void *func_020200bc(void *object, s32 value, s32 zero0, s32 zero1,
                           s32 parameter);
extern void *DisplayFadePresentation_Init(void *object, s32 mode, s32 value,
                                          s32 parameter);
extern void func_02021350(s32 value);
extern void *func_020215cc(void *object, s32 value);
extern void *func_0202225c(void *object);
extern void *func_02022580(void *object);
extern void *func_02023fa0(void *object);
extern void *func_020240cc(void *object, s32 value);
extern void *func_02024200(void *object);
extern void *func_0202432c(void *object, s32 value, s32 parameter);
extern void *func_02024468(void *object);
extern void *func_02024594(void *object, s32 value);
extern void *func_02027150(void *object, s32 value);
extern void *func_02027300(void *object, s32 value);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_LoadOverlay(void *state, s32 enabled, s32 value);
extern void func_ov058_0220f484(void);
extern u16 *func_020755e0(void *font);
extern void func_02075630(void *font);
#ifdef __cplusplus
}
#endif

/* Allocate a four-byte-aligned object of size bytes from the global heap. */
static void *allocateObject(u32 size, const char *tag)
{
    return Heap_Alloc(size, tag, 4, &gHeapContext);
}

/* Return the confirmed object-list address at runtime offset 0x2f7c. */
static void *runtimeObjectList(void)
{
    /* Confirmed list address; the runtime type containing offset 0x2f7c is not. */
    return (u8 *)data_021052fc + 0x2f7c;
}

/*
 * Pop parameter, value, and mode operands.  Modes 0..20 perform the recovered
 * allocation/constructor/list operation described by their calls below;
 * unknown modes share modes 0/1's generic constructor.  Allocation failure is
 * still forwarded as a null list entry where the original does so.  Mode 16
 * invokes SDK/overlay-facing phase work, modes 18/19 alter debug-font backing
 * storage, and mode 7 is a no-op.  Return zero.
 */
s32 func_02017d1c(GamePhaseActorScriptVm *self)
{
    s32 parameter = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *object;

    switch (mode) {
    case 20:
        object = allocateObject(0x18, data_020d5b94);
        if (object)
            object = func_02024468(object);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 19:
        func_02075630(data_020f4e14);
        func_02075630(gDebugFont);
        break;
    case 18: {
        u16 *first = func_020755e0(gDebugFont);
        first[value] = (u16)parameter;
        func_020755e0(data_020f4e14)[value] = first[value];
        break;
    }
    case 17:
        object = allocateObject(0x18, data_020d5b9c);
        if (object)
            object = func_0202432c(object, value, parameter);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 16: {
        void *state = OverlayManager_GetGlobal();
        OverlayManager_LoadOverlay(state, 1, 0x3a);
        func_ov058_0220f484();
        break;
    }
    case 15:
        object = allocateObject(0x18, data_020d5ba4);
        if (object)
            object = func_02024200(object);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 14:
        object = allocateObject(0x1c, data_020d5bac);
        if (object)
            object = func_02027150(object, value);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 13:
        object = allocateObject(0x18, data_020d5bb4);
        if (object)
            object = func_020240cc(object, value);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 12:
        object = allocateObject(0x1c, data_020d5bbc);
        if (object)
            object = func_02027300(object, value);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 11:
        /* 0x448 is a confirmed allocation size; the object type is unknown. */
        object = allocateObject(0x448, data_020d5bc4);
        if (object)
            object = func_02022580(object);
        func_0201df44(runtimeObjectList(), object);
        break;
    case 10:
        object = allocateObject(0x1c, data_020d5b74);
        if (object)
            object = func_020200bc(object, value, 0, 0, parameter);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 9:
        object = allocateObject(0x90, data_020d5bcc);
        if (object)
            object = func_02024594(object, value);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 8:
        object = allocateObject(0x40, data_020d5bd4);
        if (object)
            func_0201d688(object, value);
        break;
    case 7:
        break;
    case 6:
        object = allocateObject(0x18, data_020d5bb4);
        if (object)
            object = func_02023fa0(object);
        func_0201ded4(runtimeObjectList(), object);
        break;
    case 5:
        object = allocateObject(0x44, data_020d5bdc);
        if (object)
            func_0201d240(object, 1, value);
        break;
    case 4:
        object = allocateObject(0x24, data_020d5be4);
        if (object)
            object = func_0202225c(object);
        func_0201df44(runtimeObjectList(), object);
        break;
    case 3:
        func_02021350(value);
        break;
    case 2:
        object = allocateObject(0x3cc, data_020d5b34);
        if (object)
            object = func_020215cc(object, value);
        func_0201df44(runtimeObjectList(), object);
        break;
    default:
        object = allocateObject(0x54, data_020d5b34);
        if (object)
            object = DisplayFadePresentation_Init(object, mode, value,
                                                  parameter);
        func_0201df44(runtimeObjectList(), object);
        break;
    }
    return 0;
}
