.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern gGamePhaseRuntime
.extern Actor_SetInteractionFlag2000
.extern ActorDerivedType1_TrySetStateVector
.extern Type7Actor_HandleObjectInteraction

.global func_ov076_02212e70
func_ov076_02212e70:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, .L_02212edc
    mov r5, r0
    ldr r0, [r2, #0x0]
    mov r4, r1
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea8]
    cmp r1, #0x0
    beq .L_02212ecc
    ldrb r1, [r5, #0x29c]
    tst r1, #0x18
    bne .L_02212ecc
    ldr r0, [r0, #0xea4]
    add r1, r5, #0x18
    mov r2, #0x14
    mov r3, #0x0
    bl ActorDerivedType1_TrySetStateVector
    ldr r0, .L_02212edc
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    bl Type7Actor_HandleObjectInteraction
.L_02212ecc:
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    ldmia sp!, {r3, r4, r5, pc}
.L_02212edc: .word gGamePhaseRuntime
.size func_ov076_02212e70, . - func_ov076_02212e70
