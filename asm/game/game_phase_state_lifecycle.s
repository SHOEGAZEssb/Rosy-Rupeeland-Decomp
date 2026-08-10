; Matching retail form; see src/game/game_phase_state_lifecycle.c for
; the documented portable implementations and recovered behavior.
.text
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern func_0200fa40
.extern func_0200fb34
.extern func_02011470
.extern func_0201155c
.extern func_0201dbc8
.extern func_0201dc98
.extern func_0201df64
.extern func_0201e0ec
.extern ActorCollection_Init
.extern ActorCollection_Destructor
.extern ActorCollection_Deinit
.extern ActorCollection_UnregisterAndDestroyAllActors
.extern ActorFeedback_DestroyPresentations
.extern func_020a2324

    .global func_0200e4dc
func_0200e4dc: ; 0x0200e4dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl ActorCollection_Init
    add r0, r4, #0x2a4
    add r0, r0, #0x2c00
    bl OverlaySlot_Init
    add r0, r4, #0x2b4
    add r1, r4, #0x2000
    mov r2, #0x0
    add r0, r0, #0x2c00
    str r2, [r1, #0xeb0]
    bl func_0200fa40
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201dbc8
    add r1, r4, #0x2000
    ldr r2, [r1, #0xf7c]
    add r0, r4, #0x2f80
    bic r2, r2, #0x1
    orr r2, r2, #0x3
    str r2, [r1, #0xf7c]
    bl func_02011470
    add r1, r4, #0x2f00
    mov r0, #0x1
    strh r0, [r1, #0x90]
    ldrsh r2, [r1, #0x92]
    mov r0, r4
    bic r2, r2, #0xff
    orr r2, r2, #0x8
    strh r2, [r1, #0x92]
    ldrsh r2, [r1, #0x92]
    bic r2, r2, #0xff00
    orr r2, r2, #0x800
    strh r2, [r1, #0x92]
    ldmia sp!, {r4, pc}
    .size func_0200e4dc, . - func_0200e4dc

    .global func_0200e574
func_0200e574: ; 0x0200e574
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0200e5bc
    add r0, r4, #0x2f80
    bl func_0201155c
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201dc98
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    bl func_0200fb34
    add r0, r4, #0x2a4
    add r0, r0, #0x2c00
    bl OverlaySlot_Destroy
    add r0, r4, #0x4
    bl ActorCollection_Destructor
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0200e574, . - func_0200e574

    .global func_0200e5bc
func_0200e5bc: ; 0x0200e5bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    add r0, r4, #0x2f80
    bl func_0201155c
    mov r0, r4
    bl func_0200e61c
    add r0, r4, #0x4
    bl ActorCollection_Deinit
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200e60c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200e60c:
    add r0, r4, #0x2000
    mov r1, #0x0
    str r1, [r0, #0xeb0]
    ldmia sp!, {r4, pc}
    .size func_0200e5bc, . - func_0200e5bc

    .global func_0200e61c
func_0200e61c: ; 0x0200e61c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201df64
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201e0ec
    bl func_020a2324
    bl ActorFeedback_DestroyPresentations
    add r0, r4, #0x4
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldmia sp!, {r4, pc}
    .size func_0200e61c, . - func_0200e61c

