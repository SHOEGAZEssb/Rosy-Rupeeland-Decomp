.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern func_0204362c
.extern func_ov082_0221340c

.global func_ov082_022132a4
func_ov082_022132a4:
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x0]
    mov r4, r0
    ldr r3, [r3, #0x108]
    mov r2, #0x0
    blx r3
    mov r0, r4
    bl func_0204362c
    cmp r0, #0x0
    beq .L_022132dc
    cmp r0, #0x1
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x2
    ldmneia sp!, {r4, pc}
.L_022132dc:
    mov r0, r4
    bl func_ov082_0221340c
    ldmia sp!, {r4, pc}
.size func_ov082_022132a4, . - func_ov082_022132a4
