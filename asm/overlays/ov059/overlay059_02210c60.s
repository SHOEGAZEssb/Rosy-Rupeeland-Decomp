.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210cf8
.extern func_ov059_02210dfc
.extern func_ov059_02210f34

.global func_ov059_02210c60
func_ov059_02210c60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    sub r5, r6, #0x1
    add r4, r6, #0x1
    mov r7, r0
    cmp r5, r4
    bgt .L_02210c9c
.L_02210c7c:
    cmp r5, #0x0
    blt .L_02210c90
    mov r0, r7
    mov r1, r5
    bl func_ov059_02210cf8
.L_02210c90:
    add r5, r5, #0x1
    cmp r5, r4
    ble .L_02210c7c
.L_02210c9c:
    mov r0, r7
    mov r1, r6
    bl func_ov059_02210dfc
    mov r0, r7
    mov r1, #0x1
    bl func_ov059_02210f34
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov059_02210c60, . - func_ov059_02210c60
