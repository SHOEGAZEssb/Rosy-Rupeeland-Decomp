.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern data_ov050_0220e384
.extern Overlay050Effect_Destroy

.global Overlay050Effect_Delete
Overlay050Effect_Delete:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220d8b0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Overlay050Effect_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220d8b0: .word data_ov050_0220e384
.size Overlay050Effect_Delete, . - Overlay050Effect_Delete
