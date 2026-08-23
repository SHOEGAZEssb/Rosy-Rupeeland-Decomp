.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Actor_PlayRadialSpatialSound
.extern Sound_StopEffect
.extern gSoundContext

.global func_ov088_0221a930
func_ov088_0221a930:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r3, [r0, #0x1a]
    ldr r2, .L_0221a984
    mov r1, #0x1fc
    bic r3, r3, #0x2000
    strh r3, [r0, #0x1a]
    ldr r0, [r2, #0x0]
    mov r2, #0x4
    bl Sound_StopEffect
    ldr r1, .L_0221a988
    mov r0, r4
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    mov r0, #0x1
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x6c]
    ldmia sp!, {r4, pc}
.L_0221a984: .word gSoundContext
.L_0221a988: .word 0xfe05
.size func_ov088_0221a930, . - func_ov088_0221a930
