.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_SetEnabled

.global func_ov059_02210f34
func_ov059_02210f34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, .L_02210fe8
    mov r6, r1
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r6
    mov r4, r0
    bl ActorCollection_SetEnabled
    mov r5, #0x0
    add r7, r4, #0x2000
    mov r8, r5
    b .L_02210fb4
.L_02210f68:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_02210fb0
    ldr r1, [r0, #0x14]
    tst r1, #0x80000
    beq .L_02210fa0
    ldr r2, [r0, #0x10]
    mov r1, r6
    orr r2, r2, #0x4000000
    str r2, [r0, #0x10]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    b .L_02210fb0
.L_02210fa0:
    ldr r2, [r0, #0x0]
    mov r1, r8
    ldr r2, [r2, #0x54]
    blx r2
.L_02210fb0:
    add r5, r5, #0x1
.L_02210fb4:
    ldr r0, [r7, #0xe74]
    cmp r5, r0
    blt .L_02210f68
    ldr r0, .L_02210fe8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xebc]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x4000000
    str r0, [r1, #0x10]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02210fe8: .word gGamePhaseRuntime
.size func_ov059_02210f34, . - func_ov059_02210f34
