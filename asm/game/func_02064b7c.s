.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern func_020635f4

.global func_02064b7c
func_02064b7c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrh r1, [r4, #0x0]
    mov r5, r0
    add r0, r5, #0x10
    strh r1, [r5, #0x0]
    ldrh r2, [r4, #0x2]
    add r1, r4, #0x10
    strh r2, [r5, #0x2]
    ldrh r2, [r4, #0x4]
    strh r2, [r5, #0x4]
    ldrh r2, [r4, #0x6]
    strh r2, [r5, #0x6]
    ldr r2, [r4, #0x8]
    str r2, [r5, #0x8]
    ldr r2, [r4, #0xc]
    str r2, [r5, #0xc]
    bl func_020635f4
    add r0, r5, #0x18
    add r1, r4, #0x18
    bl func_020635f4
    ldr r1, [r4, #0x20]
    mov r0, r5
    str r1, [r5, #0x20]
    ldmia sp!, {r3, r4, r5, pc}
.size func_02064b7c, . - func_02064b7c
