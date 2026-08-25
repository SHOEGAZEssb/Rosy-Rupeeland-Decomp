.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern AnimationResourceState_Destroy
.extern CxxArray_DestroyAndFree
.extern func_ov059_0220fd64
.extern func_ov059_02210114

.global func_ov059_02210ab0
func_ov059_02210ab0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02210b14
    mov r6, #0x0
    mov r5, #0x70
    b .L_02210aec
.L_02210ad0:
    ldr r0, [r4, #0x0]
    mla r7, r6, r5, r0
    mov r0, r7
    bl func_ov059_02210114
    add r0, r7, #0x44
    bl AnimationResourceState_Destroy
    add r6, r6, #0x1
.L_02210aec:
    ldr r0, [r4, #0x4]
    cmp r6, r0
    blt .L_02210ad0
    ldr r0, [r4, #0x0]
    ldr r3, .L_02210b20
    mov r1, #0x70
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02210b14:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02210b20: .word func_ov059_0220fd64
.size func_ov059_02210ab0, . - func_ov059_02210ab0
