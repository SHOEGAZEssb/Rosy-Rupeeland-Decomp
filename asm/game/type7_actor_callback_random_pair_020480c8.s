; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.extern data_020e19d4
.extern func_020481dc
.extern func_020ada8c
.extern genrand_int32
.global func_020480c8
.type func_020480c8, @function

func_020480c8: ; 0x020480c8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl genrand_int32
    mov r5, r0
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x3c
    bl func_020ada8c
    add r1, r0, #0x3c
    add r0, r4, #0x200
    strh r1, [r0, #0x4a]
    ldrsh r3, [r0, #0x4a]
    ldr r1, .L_02048144
    mov r2, r5, lsl #0x1f
    add r1, r1, r2, lsr #0x1c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_020481dc
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.L_02048144: .word data_020e19d4

.size func_020480c8, . - func_020480c8

