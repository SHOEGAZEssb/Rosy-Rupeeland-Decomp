.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern VecFx32Object_Init

.global func_ov089_022186b4
func_ov089_022186b4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl VecFx32Object_Init
    ldr r0, [r5, #0x4]
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x4]
    ldr r0, [r5, #0x8]
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x8]
    ldr r0, [r5, #0xc]
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov089_022186b4, . - func_ov089_022186b4
