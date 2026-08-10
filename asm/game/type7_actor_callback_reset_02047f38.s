; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e1938
.extern Type7Actor_SetCallbackPair
.extern func_0206c978
.extern func_02072b68
.extern gGameWork
.global Type7Actor_ResetCallbackState
.type Type7Actor_ResetCallbackState, @function

Type7Actor_ResetCallbackState: ; 0x02047f38
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    mov r4, r0
    blx r2
    mov r0, #0x3
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x64]
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, .L_02047ff4
    mov r0, r4
    ldmia r1, {r1, r2}
    mov r3, #0x78
    bl Type7Actor_SetCallbackPair
    mov r0, #0x0
    str r0, [r4, #0x210]
    ldr r0, [r4, #0x268]
    bic r0, r0, #0xa0
    str r0, [r4, #0x268]
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_02047fe4
    beq .L_02047fc0
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_02047fc0:
    mov r1, #0x0
    ldr r0, .L_02047ff8
    str r1, [r4, #0x234]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02047ffc
    bl GameWork_ClearFlag
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x80
    str r0, [r4, #0xd0]
.L_02047fe4:
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x46]
    ldmia sp!, {r3, r4, r5, pc}
.L_02047ff4: .word data_020e1938
.L_02047ff8: .word gGameWork
.L_02047ffc: .word 0x3fd

.size Type7Actor_ResetCallbackState, . - Type7Actor_ResetCallbackState

