.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern Heap_Free

.global Overlay050Effect_Destroy
Overlay050Effect_Destroy:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_0220d8d8
.L_0220d8c4:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_0220d8d4
    bl Heap_Free
.L_0220d8d4:
    mov r0, r4
.L_0220d8d8:
    cmp r0, #0x0
    bne .L_0220d8c4
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size Overlay050Effect_Destroy, . - Overlay050Effect_Destroy
