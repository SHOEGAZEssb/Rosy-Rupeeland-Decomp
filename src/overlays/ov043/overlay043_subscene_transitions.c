#include "tingle/types.h"

/*
 * Overlay 43 subscene transitions. These recovered state machines suspend the
 * menu, launch two related child scenes, preserve their result data, and then
 * restore or leave the product-menu presentation.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e14;
extern "C" void *gDebugFont;
extern "C" void *gHeapContext;
extern "C" void *gGameWork;
extern "C" u8 data_ov043_0220c4d0[];
extern "C" u8 data_ov043_0220c4d8[];
extern "C" u32 data_ov043_0220c450[];
extern "C" u32 data_ov043_0220c460[];
extern "C" u32 data_ov043_0220c468[];
extern "C" u32 data_ov043_0220c478[];
extern "C" void func_02092c8c(s32 screen, s32 brightness);
extern "C" s32 DisplayBrightness_IsMainTransitionComplete(void);
extern "C" void func_ov043_0220bcf4(void *object);
extern "C" void func_ov043_0220bd24(void *object);
extern "C" void func_020755bc(void *font);
extern "C" void func_020062a0(void *object, s32 value);
extern "C" void func_020062f8(void *object);
extern "C" void *Heap_Alloc(s32 size, const void *tag, void *heap);
extern "C" void *func_ov023_021fe77c(void *storage, s32 page, s32 gameValue);
extern "C" void *func_ov017_021feab4(void *storage, s32 count,
                                      const u32 *values, s32 selected,
                                      s32 gameValue);
extern "C" s32 func_02091fb0(void *child, s32 command);
extern "C" void func_ov043_0220b744(void *object, u32 first, u32 second);
extern "C" void func_ov043_0220ba28(void *object);
extern "C" void func_ov043_0220bc2c(void *object);
extern "C" s32 GameWork_TestFlag(void *work, s32 flag);

/* Advance the common +0x04 state and clear substate/timer +0x08. */
static void advance_state(void *object)
{
    ++FIELD(s32, object, 4);
    FIELD(s32, object, 8) = 0;
}

/* Invoke virtual destructor slot +0x08 for optional child +0x2F4. */
static void destroy_child(void *object)
{
    void *child = FIELD(void *, object, 0x2f4);
    if (child) {
        void **vtable = FIELD(void **, child, 0);
        ((void (*)(void *))vtable[2])(child);
    }
    FIELD(void *, object, 0x2f4) = 0;
}

/* Restore fonts, hardware graphics, presentation resources, and fade state. */
static void restore_menu(void *object)
{
    func_020755bc(data_020f4e14);
    func_020755bc(gDebugFont);
    func_ov043_0220ba28(object);
    func_ov043_0220bc2c(object);
    func_02092c8c(3, 0);
    advance_state(object);
}

/*
 * Run the first child-scene transition and return zero. State 0 fades out;
 * state 1 tears down menu resources, initializes +0x2DC/+0x2E8, allocates a
 * 0x488-byte `KKPS` child using page +0x58 and game-derived value +0x54, and
 * fades in. States 2/3 send commands 0/1. State 4 extracts result +0x478,
 * selected value +0x484, and a linked list of halfwords beneath +0x470 into
 * +0x294/+0x298/+0x29C, destroys the child, and either chains to the second
 * launcher or restores the menu. State 5 waits for fade completion and returns
 * to the menu callback. Heap, graphics, fonts, callbacks, and child state vary.
 */
extern "C" s32 func_ov043_0220bed4(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0:
        FIELD(s32, object, 0x294) = 0;
        func_02092c8c(3, -16);
        advance_state(object);
        /* fall through */
    case 1:
        if (!DisplayBrightness_IsMainTransitionComplete()) {
            func_ov043_0220bd24(object);
            break;
        }
        func_ov043_0220bcf4(object);
        func_020755bc(data_020f4e14);
        func_020755bc(gDebugFont);
        func_020062a0((u8 *)object + 0x2dc, 0);
        func_020062a0((u8 *)object + 0x2e8, 16);
        {
            void *child = Heap_Alloc(0x488, data_ov043_0220c4d0, gHeapContext);
            if (child)
                child = func_ov023_021fe77c(child,
                                            FIELD(s32, object, 0x58),
                                            FIELD(s32, object, 0x54));
            FIELD(void *, object, 0x2f4) = child;
        }
        func_02092c8c(3, 0);
        advance_state(object);
        break;
    case 2:
        func_02091fb0(FIELD(void *, object, 0x2f4), 0);
        if (DisplayBrightness_IsMainTransitionComplete())
            advance_state(object);
        break;
    case 3:
        if (func_02091fb0(FIELD(void *, object, 0x2f4), 1)) {
            func_02092c8c(3, -16);
            advance_state(object);
        }
        break;
    case 4:
        func_02091fb0(FIELD(void *, object, 0x2f4), 0);
        if (!DisplayBrightness_IsMainTransitionComplete())
            break;
        {
            void *child = FIELD(void *, object, 0x2f4);
            FIELD(s32, object, 0x294) = FIELD(s32, child, 0x478);
            if (FIELD(s32, object, 0x294)) {
                FIELD(s32, object, 0x298) = 0;
                void *container = FIELD(void *, child, 0x470);
                void *node = FIELD(void *, container, 0xd4);
                while (node) {
                    void *record = FIELD(void *, node, 0xac);
                    void *values = FIELD(void *, record, 0xc);
                    s32 index = FIELD(s32, object, 0x298)++;
                    FIELD(u32, object, 0x29c + index * 4) = FIELD(u16, values, 0);
                    node = FIELD(void *, node, 8);
                }
                FIELD(s32, object, 0x2d8) = FIELD(s32, child, 0x484);
            }
        }
        FIELD(u32, object, 0x20) &= ~0x400;
        destroy_child(object);
        FIELD(u32, object, 0x20) |= 0x400;
        func_020062f8((u8 *)object + 0x2dc);
        func_020062f8((u8 *)object + 0x2e8);
        if (FIELD(s32, object, 0x294)) {
            func_ov043_0220b744(object, data_ov043_0220c478[0],
                                 data_ov043_0220c478[1]);
        } else {
            restore_menu(object);
        }
        break;
    case 5:
        if (DisplayBrightness_IsMainTransitionComplete())
            func_ov043_0220b744(object, data_ov043_0220c450[0],
                                 data_ov043_0220c450[1]);
        else
            func_ov043_0220bd24(object);
        break;
    }
    return 0;
}

/*
 * Run the second child-scene transition and return zero. This parallels the
 * first launcher but allocates a 0x444-byte `KKPG` child from saved count
 * +0x298, values +0x29C, selected value +0x2D8, and game value +0x54. After
 * command completion it destroys the child and +0x2E8 state; game flag 0x3A6
 * selects the completion callback, otherwise the menu is rebuilt. State 5
 * returns to the menu callback once the fade completes. Heap, graphics,
 * callbacks, and game-work reads are observable.
 */
extern "C" s32 func_ov043_0220c1b0(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0:
        func_02092c8c(3, -16);
        advance_state(object);
        /* fall through */
    case 1:
        if (!DisplayBrightness_IsMainTransitionComplete()) {
            func_ov043_0220bd24(object);
            break;
        }
        func_020062a0((u8 *)object + 0x2e8, 17);
        {
            void *child = Heap_Alloc(0x444, data_ov043_0220c4d8, gHeapContext);
            if (child)
                child = func_ov017_021feab4(child,
                                            FIELD(s32, object, 0x298),
                                            (u32 *)((u8 *)object + 0x29c),
                                            FIELD(s32, object, 0x2d8),
                                            FIELD(s32, object, 0x54));
            FIELD(void *, object, 0x2f4) = child;
        }
        func_02092c8c(3, 0);
        advance_state(object);
        break;
    case 2:
        func_02091fb0(FIELD(void *, object, 0x2f4), 0);
        if (DisplayBrightness_IsMainTransitionComplete())
            advance_state(object);
        break;
    case 3:
        if (func_02091fb0(FIELD(void *, object, 0x2f4), 1)) {
            func_02092c8c(3, -16);
            advance_state(object);
        }
        break;
    case 4:
        func_02091fb0(FIELD(void *, object, 0x2f4), 0);
        if (!DisplayBrightness_IsMainTransitionComplete())
            break;
        FIELD(u32, object, 0x20) &= ~0x400;
        destroy_child(object);
        FIELD(u32, object, 0x20) |= 0x400;
        func_020062f8((u8 *)object + 0x2e8);
        if (GameWork_TestFlag(gGameWork, 0x3a6)) {
            func_ov043_0220b744(object, data_ov043_0220c468[0],
                                 data_ov043_0220c468[1]);
        } else {
            restore_menu(object);
        }
        break;
    case 5:
        if (DisplayBrightness_IsMainTransitionComplete())
            func_ov043_0220b744(object, data_ov043_0220c460[0],
                                 data_ov043_0220c460[1]);
        else
            func_ov043_0220bd24(object);
        break;
    }
    return 0;
}

/*
 * Flush overlay-43 presentation resources and return one, signalling callback
 * completion to the owning state framework. Canvas/font SDK state may change.
 */
extern "C" s32 func_ov043_0220c418(void *object)
{
    func_ov043_0220bd24(object);
    return 1;
}
