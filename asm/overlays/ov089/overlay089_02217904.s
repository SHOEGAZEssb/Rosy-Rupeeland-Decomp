.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Free
.extern func_ov089_02217b94

.global func_ov089_02217904
func_ov089_02217904:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x244]
    cmp r4, #0x0
    beq .L_02217934
    beq .L_0221792c
    mov r0, r4
    bl func_ov089_02217b94
    mov r0, r4
    bl Heap_Free
.L_0221792c:
    mov r0, #0x0
    str r0, [r5, #0x244]
.L_02217934:
    ldr r4, [r5, #0x240]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_02217954
    mov r0, r4
    bl func_ov089_02217b94
    mov r0, r4
    bl Heap_Free
.L_02217954:
    mov r0, #0x0
    str r0, [r5, #0x240]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov089_02217904, . - func_ov089_02217904
