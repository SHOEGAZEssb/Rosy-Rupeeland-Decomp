.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern Heap_Free
.extern Scene_Destroy
.extern data_ov066_02210f20
.extern func_ov066_0221096c

.global func_ov066_0220fe98
func_ov066_0220fe98:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220fedc
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    beq .L_0220fec4
    mov r0, r4
    bl func_ov066_0221096c
    mov r0, r4
    bl Heap_Free
.L_0220fec4:
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0220fedc: .word data_ov066_02210f20
.size func_ov066_0220fe98, . - func_ov066_0220fe98
