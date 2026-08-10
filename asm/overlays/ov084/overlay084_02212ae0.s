.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern Heap_Alloc
.extern data_ov084_022141c8
.extern data_ov084_0221439c
.extern VecFx32Triple_Init
.extern ActorExtendedType2_Init
.extern ActorExtendedType2_GetDescriptorValue2A
.extern gHeapContext

.global func_ov084_02212ae0
func_ov084_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02212b54
    mov r1, #0x0
    str r0, [r4, #0x0]
    str r1, [r4, #0x298]
    add r0, r4, #0x200
    strh r1, [r0, #0x9c]
    strh r1, [r0, #0x9e]
    strh r1, [r0, #0xa0]
    strh r1, [r0, #0xa2]
    ldr r0, [r4, #0x260]
    ldr r1, .L_02212b58
    orr ip, r0, #0x20
    ldr r3, .L_02212b5c
    mov r0, #0x30
    mov r2, #0x4
    str ip, [r4, #0x260]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02212b3c
    bl VecFx32Triple_Init
.L_02212b3c:
    str r0, [r4, #0x2a4]
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2A
    str r0, [r4, #0x114]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02212b54: .word data_ov084_022141c8
.L_02212b58: .word data_ov084_0221439c
.L_02212b5c: .word gHeapContext
.size func_ov084_02212ae0, . - func_ov084_02212ae0
