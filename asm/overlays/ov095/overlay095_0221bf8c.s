.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern VecFx32Object_Assign
.extern Actor_SetDirectionFromVector
.extern func_0204cfa4

.global func_ov095_0221bf8c
func_ov095_0221bf8c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    add r0, r5, #0x200
    ldrh r0, [r0, #0x98]
    cmp r0, #0x0
    bne .L_0221c04c
    ldrsh r0, [r5, #0xac]
    cmp r0, #0xff
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221c04c
    ldr r3, [r5, #0x230]
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x234]
    sub r4, r3, r2
    sub r6, r1, r0
    mov r0, r4
    mov r1, r6
    bl func_0204cfa4
    add r1, r5, #0x200
    ldrh r1, [r1, #0x4]
    cmp r1, #0x0
    bne .L_0221c014
    cmp r0, #0x10000
    ble .L_0221c04c
    cmp r0, #0x60000
    cmplt r6, #0x50000
    bge .L_0221c04c
    mov r0, #0x30000
    rsb r0, r0, #0x0
    cmp r6, r0
    ble .L_0221c04c
.L_0221c014:
    add r0, r5, #0xb0
    add r1, r5, #0x22c
    bl VecFx32Object_Assign
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x3c]
    blx r2
    mov r0, r5
    mov r1, r4
    rsb r2, r6, #0x0
    bl Actor_SetDirectionFromVector
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_0221c04c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov095_0221bf8c, . - func_ov095_0221bf8c
