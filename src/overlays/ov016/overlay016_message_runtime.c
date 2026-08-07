#include "tingle/types.h"

/* Overlay 16 debug-font text drawing and transient message-object lifecycle. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021f3ecc;
extern const char data_ov016_022015b0[];
extern const char data_ov016_022015b8[];
extern void *gDebugFont;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02075598(void *, void *);
extern s32 func_02076148(void *, const u16 *, s32, s32, s32, s32, s32);
extern s32 func_020761f8(void *, const u16 *, s32, s32);
extern void func_02076428(void *, s32, s32, s32, s32, s32);
extern const u16 *func_020791e0(void *, u16);
extern void *func_02092790(void *, s32);
extern void *func_020959d4(void *, s32, s32);
extern void func_02095bec(void *);
extern void func_02095c30(void *, s32);
extern void func_02095f48(void *, void *);
extern void *func_02095f8c(void *, void *, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear debug-font rectangle (0,6)-(255,22), bind state resource +0x64, look
 * up the caller's 16-bit message ID in data_021F3ECC, measure it at width 8,
 * and draw it right-aligned to x=0xF8 at y=6 using style (14,4,0). Return void.
 * Debug-font canvas state changes; no direct hardware registers are accessed.
 */
extern "C" void func_ov016_021ff848(void *state, u16 messageId)
{
    const u16 *text;
    s32 width;

    func_02076428(gDebugFont, 0, 6, 0xff, 0x16, 0);
    func_02075598(gDebugFont, FIELD(void *, state, 0x64));
    text = func_020791e0(data_021f3ecc, messageId);
    width = func_020761f8(gDebugFont, text, 8, 0);
    text = func_020791e0(data_021f3ecc, messageId);
    func_02076148(gDebugFont, text, 0xf8 - width, 6, 0xe, 4, 0);
}

/*
 * Select resource-manager handle 0/1 when auxiliary object +0x44C is absent or
 * 2/3 when present, with the caller's variant choosing the odd index, and enable
 * that handle. Allocate/construct a 0x2D0-byte transient object at +0x460,
 * attach the optional fourth argument when non-null, apply the caller setting,
 * and set state flag bit 1 at +0x48. Return void. Heap and presentation state
 * change; no direct MMIO occurs.
 */
extern "C" void func_ov016_021ff908(void *state, s32 setting, s32 variant,
                                      void *optional)
{
    s32 handleIndex;
    void *object;

    if (FIELD(void *, state, 0x44c) != 0) {
        handleIndex = variant == 0 ? 2 : 3;
    } else {
        handleIndex = variant == 0 ? 0 : 1;
    }
    func_02070e0c(func_02092790((u8 *)state + 0x84, handleIndex), 1, 0);
    object = Heap_Alloc(0x2d0, data_ov016_022015b0, 4, gHeapContext);
    if (object != 0) {
        object = func_020959d4(object, 0, 0);
    }
    FIELD(void *, state, 0x460) = object;
    if (optional != 0) {
        func_02095f48(object, optional);
    }
    func_02095c30(object, setting);
    FIELD(u32, state, 0x48) |= 2;
}

/*
 * Stop object +0x460 through 0x02095BEC, delete it through vtable slot +4 when
 * present, clear its pointer, and clear state flag bit 1 at +0x48. Return void.
 * Presentation resources are released; no direct hardware access occurs.
 */
extern "C" void func_ov016_021ff9b8(void *state)
{
    typedef void (*DeleteFunction)(void *);
    void *object = FIELD(void *, state, 0x460);

    func_02095bec(object);
    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
    FIELD(void *, state, 0x460) = 0;
    FIELD(u32, state, 0x48) &= ~2u;
}

/*
 * Allocate and construct a 0x1C0-byte message object at +0x464 from the main
 * font owner and caller parameter. Clear main-font rectangle (0x40,0x14)-
 * (0xC0,0x74), bind state resource +0x64, look up and center the caller's
 * message ID around x=0x80 at y=0x20, enable manager handle 4 at +0x84, and set
 * flag bit 1 at +0x48. Return void. Heap/font/presentation state changes.
 */
extern "C" void func_ov016_021ff9f8(void *state, u16 messageId, s32 parameter)
{
    const u16 *text;
    s32 width;
    void *object;

    object = Heap_Alloc(0x1c0, data_ov016_022015b8, 4, gHeapContext);
    if (object != 0) {
        object = func_02095f8c(object, data_020f4e14, 1, parameter,
                               1, 0x80, 0x48);
    }
    FIELD(void *, state, 0x464) = object;
    func_02076428(data_020f4e14, 0x40, 0x14, 0xc0, 0x74, 0);
    func_02075598(data_020f4e14, FIELD(void *, state, 0x64));
    text = func_020791e0(data_021f3ecc, messageId);
    width = func_020761f8(data_020f4e14, text, 4, 0);
    text = func_020791e0(data_021f3ecc, messageId);
    func_02076148(data_020f4e14, text, 0x80 - width / 2, 0x20, 0xe, 4, 0);
    func_02070e0c(func_02092790((u8 *)state + 0x84, 4), 1, 0);
    FIELD(u32, state, 0x48) |= 2;
}

/*
 * Delete message object +0x464 through vtable slot +4 when present, clear its
 * pointer, clear main-font rectangle (0x40,0x14)-(0xC0,0x34), and clear state
 * flag bit 1 at +0x48. Return void. Heap/font presentation state changes; no
 * direct hardware register is accessed.
 */
extern "C" void func_ov016_021ffb3c(void *state)
{
    typedef void (*DeleteFunction)(void *);
    void *object = FIELD(void *, state, 0x464);

    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
    FIELD(void *, state, 0x464) = 0;
    func_02076428(data_020f4e14, 0x40, 0x14, 0xc0, 0x34, 0);
    FIELD(u32, state, 0x48) &= ~2u;
}
