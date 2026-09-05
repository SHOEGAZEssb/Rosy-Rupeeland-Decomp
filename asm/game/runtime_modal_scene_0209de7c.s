.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.
.extern GXx_SetMasterBrightness_

.global func_0209de7c
func_0209de7c:
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x34]
    ldr r0, [r3, #0x0]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_0209deec
    ldrh r1, [r0, #0x0]
    cmp r1, #0xc0
    bge .L_0209dee4
    ldr r0, [r3, #0x20]
    mov r2, #0x180
    eor r4, r0, #0x1
    mla r0, r4, r2, r3
    add ip, r0, r1, lsl #0x1
    add lr, r3, #0x324
    mov r0, #0xc0
    ldr r3, .L_0209def0
    mla lr, r4, r0, lr
    ldrsh ip, [ip, #0x24]
    add r2, r2, #0x7f
    add r0, r3, #0x58
    and r2, ip, r2
    str r2, [r3, #0x0]
    ldrsb r1, [lr, r1]
    bl GXx_SetMasterBrightness_
.L_0209dee4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0209deec: .word 0x4000006
.L_0209def0: .word 0x4001014
.size func_0209de7c, . - func_0209de7c
