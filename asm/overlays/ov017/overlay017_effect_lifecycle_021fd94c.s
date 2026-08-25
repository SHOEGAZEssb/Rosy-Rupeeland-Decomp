    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_lifecycle.c. */
    .extern data_ov017_02201670
    .extern Presentation_Init
    .extern Presentation_SetPosition
    .extern Overlay017_Transform_Init
    .extern Overlay017Transform_ReplaceResource
    .extern Overlay017_UpdateEffectTransform
    .extern genrand_int32
.global Overlay017_Effect_Init
Overlay017_Effect_Init:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl Presentation_Init
    ldr r1, L_021fda18
    add r0, r4, #0xbc
    str r1, [r4, #0x0]
    bl Overlay017_Transform_Init
    ldr r0, [sp, #0x18]
    mov ip, #0x0
    strh r0, [r4, #0x9c]
    strh ip, [r4, #0x9e]
    ldr r2, [sp, #0x1c]
    strh r7, [r4, #0x9a]
    strh r2, [r4, #0xa0]
    str ip, [r4, #0xb4]
    mov r1, r6
    mov r3, r5
    mov r0, r4
    mov r2, #0x200000
    str ip, [r4, #0xb8]
    bl Presentation_SetPosition
    mov r0, #0xc
    str r0, [r4, #0xa4]
    mov r0, #0x0
    str r0, [r4, #0xa8]
    str r0, [r4, #0xac]
    str r0, [r4, #0xb0]
    str r0, [r4, #0xb8]
    str r0, [r4, #0xb4]
    ldrh r1, [sp, #0x20]
    add r0, r4, #0xbc
    bl Overlay017Transform_ReplaceResource
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xdc]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xe0]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xe4]
    mov r0, r4
    bl Overlay017_UpdateEffectTransform
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fda18: .word data_ov017_02201670
    .size Overlay017_Effect_Init, . - Overlay017_Effect_Init

