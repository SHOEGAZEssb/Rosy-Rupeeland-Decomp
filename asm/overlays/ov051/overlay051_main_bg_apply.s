.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern func_020afd28

.global func_ov051_0220ddf8
func_ov051_0220ddf8:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov lr, r0
    mov r2, #0x0
.L_0220de08:
    add r1, lr, r2, lsl #0x4
    ldr r0, [r1, #0x10]
    add r2, r2, #0x1
    str r0, [r1, #0xc10]
    ldr r0, [r1, #0x14]
    cmp r2, #0xc0
    str r0, [r1, #0xc14]
    ldr r0, [r1, #0x18]
    str r0, [r1, #0xc18]
    ldr r0, [r1, #0x1c]
    str r0, [r1, #0xc1c]
    blt .L_0220de08
    ldr r0, [lr, #0x8]
    mov r2, #0x100
    str r0, [sp, #0x0]
    ldr ip, [lr, #0xc]
    ldr r0, .L_0220de64
    mov r3, r2
    add r1, lr, #0xc10
    str ip, [sp, #0x4]
    bl func_020afd28
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_0220de64: .word 0x4000020
.size func_ov051_0220ddf8, . - func_ov051_0220ddf8
