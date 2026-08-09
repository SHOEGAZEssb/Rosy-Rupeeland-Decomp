.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Free
.extern data_ov073_02210be4
.extern func_02002290
.extern func_020022dc
.extern func_0201e28c
.extern func_ov073_022102dc

.global func_ov073_02210900
func_ov073_02210900:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0221097c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_0221092c
    mov r0, r4
    bl func_ov073_022102dc
    mov r0, r4
    bl Heap_Free
.L_0221092c:
    ldr r4, [r5, #0xc]
    cmp r4, #0x0
    beq .L_02210948
    mov r0, r4
    bl func_ov073_022102dc
    mov r0, r4
    bl Heap_Free
.L_02210948:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_02210960
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210960:
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0221097c: .word data_ov073_02210be4
.size func_ov073_02210900, . - func_ov073_02210900
