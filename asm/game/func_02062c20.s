.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern func_02062b28

.global func_02062c20
func_02062c20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02062b28
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    ldrb r0, [r0, #0x2]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x6]
    cmp r0, #0x1
    ldreqh r0, [r4, #0x4]
    cmpeq r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.size func_02062c20, . - func_02062c20
