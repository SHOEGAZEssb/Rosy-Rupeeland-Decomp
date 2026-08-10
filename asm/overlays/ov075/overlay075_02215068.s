.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217410
.extern ActorExtendedType2_GetDescriptorValue25
.extern ActorExtendedLinked_Init
.extern func_ov075_02215044
.extern func_ov075_022158bc

.global func_ov075_02215068
func_ov075_02215068:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinked_Init
    ldr r1, .L_022150c0
    mov r0, #0x0
    str r1, [r4, #0x0]
    str r0, [r4, #0x2a4]
    add r0, r4, #0x29c
    add r1, r4, #0x68
    bl func_ov075_02215044
    ldr r1, [r4, #0x260]
    mov r0, r4
    orr r1, r1, #0x200000
    str r1, [r4, #0x260]
    bl ActorExtendedType2_GetDescriptorValue25
    mvn r1, #0x0
    cmp r0, r1
    beq .L_022150b8
    mov r0, r4
    bl func_ov075_022158bc
.L_022150b8:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022150c0: .word data_ov075_02217410
.size func_ov075_02215068, . - func_ov075_02215068
