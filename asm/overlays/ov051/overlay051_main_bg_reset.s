.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern func_020afd28

.global func_ov051_0220de68
func_ov051_0220de68:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    cmp r1, #0xc0
    bge .L_0220dea4
    ldr r3, [r0, #0x8]
    mov r2, #0x100
    str r3, [sp, #0x0]
    ldr r3, [r0, #0xc]
    add ip, r0, #0xc10
    add lr, r3, r1
    ldr r0, .L_0220deac
    mov r3, r2
    add r1, ip, r1, lsl #0x4
    str lr, [sp, #0x4]
    bl func_020afd28
.L_0220dea4:
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_0220deac: .word 0x4000020
.size func_ov051_0220de68, . - func_ov051_0220de68
