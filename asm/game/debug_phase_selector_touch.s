; Matching retail form; see src/game/debug_phase_selector_touch.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_020befec
.global DebugPhaseSelector_SelectTouchPoint
DebugPhaseSelector_SelectTouchPoint:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r1, [r4, #0x8]
    ldr r2, [r4, #0x4]
    cmp r1, #0xba
    movlt r3, #0x1
    movge r3, #0x0
    cmp r1, #0x6
    movge r1, #0x1
    movlt r1, #0x0
    mov r5, r0
    cmp r2, #0x9
    movge r0, #0x1
    movlt r0, #0x0
    cmp r2, #0xf9
    movlt ip, #0x1
    movge ip, #0x0
    and r0, r0, ip
    and r0, r1, r0
    tst r3, r0
    beq L_0200c648
    sub r0, r2, #0x9
    mov r1, #0x18
    bl func_020befec
    str r0, [r5, #0x2c]
    ldr r0, [r4, #0x8]
    mov r1, #0x14
    sub r0, r0, #0x6
    bl func_020befec
    str r0, [r5, #0x30]
    ldr r2, [r5, #0x2c]
    mov r1, #0xa
    mla r2, r0, r1, r2
    ldr r1, [r5, #0x48]
    mov r0, #0x5a
    mla r0, r1, r0, r2
    str r0, [r5, #0x28]
L_0200c648:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size DebugPhaseSelector_SelectTouchPoint, . - DebugPhaseSelector_SelectTouchPoint

