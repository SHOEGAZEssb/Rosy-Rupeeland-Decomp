.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219ae8
.extern data_ov089_02219aec
.extern data_ov089_02219b48
.extern data_ov089_02219b4c
.extern VecFx32Object_Init
.extern VecFx32Object_Assign

.global func_ov089_02218e80
func_ov089_02218e80:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r0
    mov r4, r1
    bl VecFx32Object_Init
    cmp r6, #0x0
    mov r0, r5
    add r1, r4, #0x18
    beq .L_02218ec8
    bl VecFx32Object_Assign
    ldrb r2, [r4, #0xd4]
    mov r0, #0xc
    ldr r1, .L_02218f18
    smulbb r2, r2, r0
    ldr r2, [r1, r2]
    ldr r3, [r5, #0x4]
    ldr r1, .L_02218f1c
    b .L_02218ee8
.L_02218ec8:
    bl VecFx32Object_Assign
    ldrb r2, [r4, #0xd4]
    mov r0, #0xc
    ldr r1, .L_02218f20
    smulbb r2, r2, r0
    ldr r2, [r1, r2]
    ldr r3, [r5, #0x4]
    ldr r1, .L_02218f24
.L_02218ee8:
    add r2, r3, r2
    str r2, [r5, #0x4]
    ldrb r2, [r4, #0xd4]
    ldr r3, [r5, #0x8]
    smulbb r0, r2, r0
    ldr r0, [r1, r0]
    add r0, r3, r0
    str r0, [r5, #0x8]
    ldr r0, [r5, #0xc]
    add r0, r0, #0xa000
    str r0, [r5, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.L_02218f18: .word data_ov089_02219b48
.L_02218f1c: .word data_ov089_02219b4c
.L_02218f20: .word data_ov089_02219ae8
.L_02218f24: .word data_ov089_02219aec
.size func_ov089_02218e80, . - func_ov089_02218e80
