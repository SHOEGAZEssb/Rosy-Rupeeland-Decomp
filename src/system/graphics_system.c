#include "tingle/graphics_system.h"

/*
 * Core 2D graphics bootstrap. It creates the shared graphics-resource manager,
 * allocates one renderer state for each DS display engine, binds two resource
 * handles to both states, and enables OBJ display on the main and sub engines.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void *gHeapContext;

extern void func_0207139c(void);
extern void *func_02071294(void *manager);
extern void func_020741b0(void);
extern void *func_02074200(void *state, int engine, int arg2, int arg3);
extern void *func_02071568(void *manager, u32 resourceId);
extern void *func_020716bc(void *manager, u32 resourceId);
extern void func_02075398(void *state, void *resourceC000,
                          void *resourceC001);

#ifdef __cplusplus
}
#endif

enum {
    GRAPHICS_RESOURCE_MANAGER_SIZE = 0x108,
    GRAPHICS_ENGINE_STATE_SIZE = 0x2924,
    GRAPHICS_RESOURCE_ID_C000 = 0xC000,
    GRAPHICS_RESOURCE_ID_C001 = 0xC001,
    DISPCNT_OBJ_ENABLE = 0x1000,
    DISPCNT_PLANE_MASK = 0x1F00,
};

/* Confirmed allocation tags for the resource, main, and sub engine objects. */
GraphicsSystemTags gGraphicsSystemTags = {
    "KKRM",
    "KKAM",
    "KKAS",
};

/*
 * Only the base address is named because several independently referenced
 * globals occupy this block. These accesses preserve their confirmed offsets.
 */
#define GRAPHICS_STATE_FIELD(type, offset)                                  \
    (*(type *)((u8 *)&gGraphicsState020F4E08 + (offset)))

/*
 * Initialize graphics allocators, both engine states, and resources C000 and
 * C001. Stores the resulting objects at offsets 0x00..0x14, enables OBJ in
 * both hardware DISPCNT registers, and marks the subsystem active at 0x14.
 */
#ifndef MATCHING
void GraphicsSystem_Init(void)
{
    void *manager;
    void *state;
    void *resourceC000;
    void *resourceC001;
    volatile u32 *mainDispCnt = (volatile u32 *)0x04000000;
    volatile u32 *subDispCnt = (volatile u32 *)0x04001000;

    func_0207139c();
    manager = Heap_Alloc(GRAPHICS_RESOURCE_MANAGER_SIZE,
                         gGraphicsSystemTags.resourceManager, 4,
                         gHeapContext);
    if (manager != 0) {
        manager = func_02071294(manager);
    }
    GRAPHICS_STATE_FIELD(void *, 0x10) = manager;

    func_020741b0();
    state = Heap_Alloc(GRAPHICS_ENGINE_STATE_SIZE,
                       gGraphicsSystemTags.mainEngine, 4, gHeapContext);
    if (state != 0) {
        state = func_02074200(state, 0, 0, 1);
    }
    GRAPHICS_STATE_FIELD(void *, 0x0C) = state;

    GraphicsSystem_CreateEngine(1);

    manager = GRAPHICS_STATE_FIELD(void *, 0x10);
    resourceC000 = func_02071568(manager, GRAPHICS_RESOURCE_ID_C000);
    GRAPHICS_STATE_FIELD(void *, 0x04) = resourceC000;
    resourceC001 = func_020716bc(manager, GRAPHICS_RESOURCE_ID_C001);
    GRAPHICS_STATE_FIELD(void *, 0x00) = resourceC001;

    func_02075398(GRAPHICS_STATE_FIELD(void *, 0x0C), resourceC000,
                  resourceC001);
    func_02075398(GRAPHICS_STATE_FIELD(void *, 0x08), resourceC000,
                  resourceC001);

    *mainDispCnt = (*mainDispCnt & ~DISPCNT_PLANE_MASK) | DISPCNT_OBJ_ENABLE;
    *subDispCnt = (*subDispCnt & ~DISPCNT_PLANE_MASK) | DISPCNT_OBJ_ENABLE;
    GRAPHICS_STATE_FIELD(s32, 0x14) = 1;
}

/*
 * Allocate and initialize the selected engine state: zero creates the object
 * at offset 0x0C with arguments (0,0,1), while one creates offset 0x08 with
 * arguments (1,2,3). Other values have no effect. Returns no defined value.
 */
void GraphicsSystem_CreateEngine(int engine)
{
    void *state;

    if (engine == 0) {
        state = Heap_Alloc(GRAPHICS_ENGINE_STATE_SIZE,
                           gGraphicsSystemTags.mainEngine, 4, gHeapContext);
        if (state != 0) {
            state = func_02074200(state, 0, 0, 1);
        }
        GRAPHICS_STATE_FIELD(void *, 0x0C) = state;
        return;
    }

    if (engine == 1) {
        state = Heap_Alloc(GRAPHICS_ENGINE_STATE_SIZE,
                           gGraphicsSystemTags.subEngine, 4, gHeapContext);
        if (state != 0) {
            state = func_02074200(state, 1, 2, 3);
        }
        GRAPHICS_STATE_FIELD(void *, 0x08) = state;
    }
}
#else
/*
 * MWCC expands the typed state-block and volatile-register expressions
 * differently. These bodies match the two portable implementations above.
 */
asm void GraphicsSystem_Init(void)
{
    stmdb sp!, {r3, lr}
    bl func_0207139c
    ldr r1, =gGraphicsSystemTags
    ldr r3, =gHeapContext
    mov r0, #0x108
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq graphics_init_manager_done
    bl func_02071294
graphics_init_manager_done:
    ldr r1, =gGraphicsState020F4E08
    str r0, [r1, #0x10]
    bl func_020741b0
    ldr r0, =0x2924
    ldr r1, =gGraphicsSystemTags+8
    ldr r3, =gHeapContext
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq graphics_init_main_done
    mov r1, #0
    mov r2, r1
    mov r3, #1
    bl func_02074200
graphics_init_main_done:
    ldr r1, =gGraphicsState020F4E08
    str r0, [r1, #0xc]
    mov r0, #1
    bl GraphicsSystem_CreateEngine
    ldr r0, =gGraphicsState020F4E08
    mov r1, #0xc000
    ldr r0, [r0, #0x10]
    bl func_02071568
    ldr r2, =gGraphicsState020F4E08
    ldr r1, =0xc001
    str r0, [r2, #4]
    ldr r0, [r2, #0x10]
    bl func_020716bc
    ldr r1, =gGraphicsState020F4E08
    mov r2, r0
    str r2, [r1]
    ldr r0, [r1, #0xc]
    ldr r1, [r1, #4]
    bl func_02075398
    ldr r2, =gGraphicsState020F4E08
    ldr r0, [r2, #8]
    ldr r1, [r2, #4]
    ldr r2, [r2]
    bl func_02075398
    mov r1, #0x04000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1]
    ldr r0, [r2]
    mov r1, #1
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r2]
    ldr r0, =gGraphicsState020F4E08
    str r1, [r0, #0x14]
    ldmia sp!, {r3, pc}
}

asm void GraphicsSystem_CreateEngine(int engine)
{
    stmdb sp!, {r3, lr}
    cmp r0, #0
    bne graphics_create_check_sub
    ldr r0, =0x2924
    ldr r1, =gGraphicsSystemTags+8
    ldr r3, =gHeapContext
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq graphics_create_main_done
    mov r1, #0
    mov r2, r1
    mov r3, #1
    bl func_02074200
graphics_create_main_done:
    ldr r1, =gGraphicsState020F4E08
    str r0, [r1, #0xc]
    ldmia sp!, {r3, pc}
graphics_create_check_sub:
    cmp r0, #1
    ldmneia sp!, {r3, pc}
    ldr r0, =0x2924
    ldr r1, =gGraphicsSystemTags+16
    ldr r3, =gHeapContext
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq graphics_create_sub_done
    mov r1, #1
    mov r2, #2
    mov r3, #3
    bl func_02074200
graphics_create_sub_done:
    ldr r1, =gGraphicsState020F4E08
    str r0, [r1, #8]
    ldmia sp!, {r3, pc}
}
#endif
