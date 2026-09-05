.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern VecFx32Object_Init
.extern data_020f3058
.extern func_0209a00c

.global func_02099edc
func_02099edc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr ip, .L_02099f50
    add r0, r4, #0x1c
    mov r7, r1
    mov r6, r2
    mov r5, r3
    str ip, [r4, #0x0]
    bl VecFx32Object_Init
    add r0, r4, #0x2c
    bl VecFx32Object_Init
    mov r1, r7
    mov r2, r6
    mov r3, r5
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    str r0, [r4, #0xc]
    str r0, [r4, #0x44]
    ldr r0, [sp, #0x20]
    ldrb ip, [sp, #0x24]
    str r0, [sp, #0x0]
    mov r0, r4
    str ip, [sp, #0x4]
    bl func_0209a00c
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02099f50: .word data_020f3058
.size func_02099edc, . - func_02099edc
