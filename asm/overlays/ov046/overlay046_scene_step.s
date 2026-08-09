.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_state.c.
.extern data_ov046_0220cd00
.extern func_ov046_0220c7b0
.extern func_ov046_0220cb4c

.global func_ov046_0220cc18
func_ov046_0220cc18:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_0220cc40
    cmp r1, #0x1
    beq .L_0220cc50
    cmp r1, #0x2
    beq .L_0220cc8c
    b .L_0220ccac
.L_0220cc40:
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0220cc50:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble .L_0220ccac
    ldr r2, [r4, #0x64]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220ccac
.L_0220cc8c:
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    cmp r1, #0xb4
    ble .L_0220ccac
    ldr r1, .L_0220ccbc
    ldmia r1, {r1, r2}
    bl func_ov046_0220c7b0
.L_0220ccac:
    mov r0, r4
    bl func_ov046_0220cb4c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220ccbc: .word data_ov046_0220cd00
.size func_ov046_0220cc18, . - func_ov046_0220cc18
