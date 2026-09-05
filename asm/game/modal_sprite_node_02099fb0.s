.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern data_020f3058
.extern func_02099f54
.extern func_0209a07c

.global func_02099fb0
func_02099fb0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0209a008
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x4]
    cmp r4, #0x0
    beq .L_02099fe8
    beq .L_02099fe0
    mov r0, r4
    bl func_02099f54
    mov r0, r4
    bl Heap_Free
.L_02099fe0:
    mov r0, #0x0
    str r0, [r5, #0x4]
.L_02099fe8:
    mov r0, r5
    bl func_0209a07c
    add r0, r5, #0x2c
    bl VecFx32Object_Destroy
    add r0, r5, #0x1c
    bl VecFx32Object_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0209a008: .word data_020f3058
.size func_02099fb0, . - func_02099fb0
