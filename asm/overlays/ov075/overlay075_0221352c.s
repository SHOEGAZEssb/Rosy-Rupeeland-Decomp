.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216db0
.extern data_ov075_02217168
.extern func_02003e20
.extern func_02004fe0
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_ov075_02212ae0
.extern gHeapContext

.global func_ov075_0221352c
func_ov075_0221352c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov075_02212ae0
    ldr r1, .L_022135b8
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r1, #0x0
    strh r1, [r0, #0xa8]
    str r1, [r4, #0x2ac]
    add r0, r4, #0x2b0
    bl func_02004fe0
    ldr r1, [r4, #0x26c]
    mov r2, #0x0
    mov r0, r4
    str r2, [r1, #0x4]
    bl ActorExtendedType2_GetDescriptorValue2A
    cmp r0, #0x0
    movle r0, #0x1
    ble .L_02213580
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2A
.L_02213580:
    add r1, r4, #0x200
    strh r0, [r1, #0xaa]
    ldrsh r0, [r1, #0xaa]
    ldr r1, .L_022135bc
    ldr r3, .L_022135c0
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    bl func_02003e20
    str r0, [r4, #0x2a4]
    ldr r1, [r4, #0xd0]
    mov r0, r4
    orr r1, r1, #0x20000
    str r1, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.L_022135b8: .word data_ov075_02216db0
.L_022135bc: .word data_ov075_02217168
.L_022135c0: .word gHeapContext
.size func_ov075_0221352c, . - func_ov075_0221352c
