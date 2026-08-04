; Matching retail form; see src/game/actor_motion_area_direction.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02005058
.extern func_02011794
.extern func_02056f00
.global func_0200a124
func_0200a124: ; 0x0200a124
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    add r0, sp, #0x8
    add r1, r1, #0x18
    mov r4, r2
    bl func_02056f00
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0xc]
    sub ip, r1, #0x10000
    mov r1, r0, asr #0xc
    sub r3, r1, #0x10
    add r2, r1, #0x10
    mov r0, ip, asr #0xc
    sub r1, r0, #0x10
    add r0, r0, #0x10
    strh r2, [sp, #0x4]
    strh r1, [sp, #0x2]
    str ip, [sp, #0x10]
    strh r3, [sp, #0x0]
    strh r0, [sp, #0x6]
    ldr r0, [r5, #0x68]
    add r2, sp, #0x0
    mov r1, r4
    bl func_02011794
    mov r4, r0
    add r0, sp, #0x8
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0200a124, .-func_0200a124

