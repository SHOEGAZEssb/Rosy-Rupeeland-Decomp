; Matching retail form; see src/game/actor_extended_pairing_update.c.
.text

.extern data_02105728
.extern data_0210572c
.extern data_0210574c
.extern data_020e70c0

.global func_02043c24
.type func_02043c24, @function
func_02043c24: ; 0x02043c24
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r10, .L_02043cc0
    mov r9, #0x0
    ldrsh r8, [r10, #0x0]
    ldr r4, .L_02043cc4
    mov r5, r9
    ldr r6, .L_02043cc8
    ldr r7, .L_02043ccc
    b .L_02043cb0
.L_02043c48:
    ldr r1, [r7, r9, lsl #0x2]
    ldr r0, [r1, #0x298]
    cmp r0, #0x0
    bne .L_02043cac
    ldrh r0, [r1, #0x4e]
    mov r0, r0, lsl #0x1
    ldrsh ip, [r6, r0]
    cmp ip, #0x0
    blt .L_02043cac
    mov r3, r5
    b .L_02043ca4
.L_02043c74:
    ldr r0, [r4, r3, lsl #0x2]
    ldr r2, [r0, #0x298]
    cmp r2, #0x0
    ldreqh r2, [r0, #0x4e]
    cmpeq ip, r2
    bne .L_02043ca0
    str r0, [r1, #0x298]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1d4]
    blx r2
    b .L_02043cac
.L_02043ca0:
    add r3, r3, #0x1
.L_02043ca4:
    cmp r3, r8
    blt .L_02043c74
.L_02043cac:
    add r9, r9, #0x1
.L_02043cb0:
    ldrsh r0, [r10, #0x2]
    cmp r9, r0
    blt .L_02043c48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02043cc0: .word data_02105728
.L_02043cc4: .word data_0210574c
.L_02043cc8: .word data_020e70c0
.L_02043ccc: .word data_0210572c

    .global func_02043cd0
.size func_02043c24, . - func_02043c24
