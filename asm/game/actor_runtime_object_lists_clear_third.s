; Matching retail form; see src/game/actor_runtime_object_lists_cleanup.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200bba8
.global func_0200bd6c
func_0200bd6c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x30]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, [r5, #0x28]
    b L_0200bdb0
L_0200bd94:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200bdac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200bdac:
    ldr r4, [r4, #0x0]
L_0200bdb0:
    cmp r4, #0x0
    bne L_0200bd94
    add r0, r5, #0x24
    bl func_0200bba8
    ldmia sp!, {r3, r4, r5, pc}
.size func_0200bd6c, . - func_0200bd6c

