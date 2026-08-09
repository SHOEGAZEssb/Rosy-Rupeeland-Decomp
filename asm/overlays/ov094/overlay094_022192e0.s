.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern func_02094d28
.extern func_02094dd4
.extern func_020afca0
.extern func_ov094_02217bc8

.global func_ov094_022192e0
func_ov094_022192e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02094dd4
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq .L_02219300
    cmp r0, #0x1
    b .L_02219338
.L_02219300:
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    ldrne r0, [r4, #0x9c]
    mov r2, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x9c]
    mov r0, r4
    sub r3, r2, #0x4
    mov r1, #0x1
    bl func_02094d28
    mov r1, r0
    ldr r0, .L_02219340
    bl func_020afca0
.L_02219338:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02219340: .word 0x4000050
.size func_ov094_022192e0, . - func_ov094_022192e0
