; Matching retail form; see src/game/type7_actor_motion_capture.c.
.extern VecFx32Object_SetComponents
.text
    .global Type7Actor_InitializeMotionCapture
.type Type7Actor_InitializeMotionCapture, @function
Type7Actor_InitializeMotionCapture: ; 0x02049f10
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    mov r1, #0x0
    orr r2, r2, #0x80
    str r2, [r4, #0xd0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    mov r1, #0x0
    ldr r0, [r4, #0x3c]
    mov r2, r1
    str r0, [r4, #0x8c]
    ldr ip, [r4, #0x40]
    mov r3, r1
    add r0, r4, #0x38
    str ip, [r4, #0x90]
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    mov r0, #0x0
    str r0, [r4, #0x210]
    ldmia sp!, {r4, pc}
.size Type7Actor_InitializeMotionCapture, . - Type7Actor_InitializeMotionCapture

