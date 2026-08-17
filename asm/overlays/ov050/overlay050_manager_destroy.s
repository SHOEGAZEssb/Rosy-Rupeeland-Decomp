.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_manager_recovery.c.
.extern Heap_Free
.extern data_ov050_0220e384
.extern VecFx32Object_Destroy
.extern Overlay050PairedEffect_Destroy
.extern Overlay050Effect_Destroy
.extern Overlay050EffectManager_RemoveNode

.global Overlay050EffectManager_Destroy
Overlay050EffectManager_Destroy:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6, #0x4]
    b .L_0220d930
.L_0220d904:
    ldr r5, [r4, #0x8]
    mov r0, r6
    mov r1, r4
    bl Overlay050EffectManager_RemoveNode
    cmp r5, #0x0
    beq .L_0220d92c
    mov r0, r5
    bl Overlay050PairedEffect_Destroy
    mov r0, r5
    bl Heap_Free
.L_0220d92c:
    ldr r4, [r4, #0x0]
.L_0220d930:
    cmp r4, #0x0
    bne .L_0220d904
    add r0, r6, #0x20
    bl VecFx32Object_Destroy
    ldr r1, .L_0220d958
    mov r0, r6
    str r1, [r6, #0x0]
    bl Overlay050Effect_Destroy
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_0220d958: .word data_ov050_0220e384
.size Overlay050EffectManager_Destroy, . - Overlay050EffectManager_Destroy
