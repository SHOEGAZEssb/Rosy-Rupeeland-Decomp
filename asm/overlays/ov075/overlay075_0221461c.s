.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_022171bc
.extern func_02004fe0
.extern func_020050a4
.extern func_0203b514

.global func_ov075_0221461c
func_ov075_0221461c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203b514
    ldr r1, .L_022146a0
    add r0, r5, #0x20c
    str r1, [r5, #0x0]
    bl func_02004fe0
    mov r2, #0x0
    add r0, r5, #0x20c
    add r1, r5, #0x18
    str r2, [r5, #0x224]
    bl func_020050a4
    add r0, r5, #0x200
    mov r2, #0x0
    strh r2, [r0, #0x20]
    strh r2, [r0, #0x22]
    strh r2, [r5, #0xd6]
    ldr r1, [r5, #0x10]
    orr r1, r1, #0x1f0000
    str r1, [r5, #0x10]
    ldr r1, [r4, #0x34]
    str r1, [r5, #0x21c]
    strh r2, [r0, #0x28]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_02214698
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_02214698:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_022146a0: .word data_ov075_022171bc
.size func_ov075_0221461c, . - func_ov075_0221461c
