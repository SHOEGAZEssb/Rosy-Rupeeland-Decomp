.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_02050078

.global func_ov096_0221811c
func_ov096_0221811c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r0, [r4, #0x29c]
    cmp r0, #0x0
    beq .L_02218170
    add r0, sp, #0x10
    add r1, r4, #0x18
    bl func_02005030
    add r0, sp, #0x0
    add r1, sp, #0x10
    bl func_02005030
    ldr r0, [r4, #0x29c]
    add r1, sp, #0x10
    ldrsh r0, [r0, #0x0]
    add r2, sp, #0x0
    bl func_02050078
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
.L_02218170:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.size func_ov096_0221811c, . - func_ov096_0221811c
