.text

/* Exact fallback; see src/overlays/ov035/overlay035_particle.c for documented portable C. */

    .extern Presentation_Init
    .extern genrand_int32
    .extern TitleRandom_NextBounded
    .extern func_02094bf0
    .extern func_0209189c
    .extern Presentation_SetPosition
    .extern PresentationScalar_TransitionTo
    .extern func_ov035_021fd274
    .extern data_ov035_02203c40


    .global func_ov035_021fd7f0
func_ov035_021fd7f0: 
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    bl Presentation_Init
    ldr r1, L_021fd9d8
    mov r0, #0x0
    str r1, [r6, #0x0]
    str r0, [r6, #0x9c]
    bl genrand_int32
    str r0, [r6, #0x9c]
    mov r2, #0x1
    add r0, r6, #0x9c
    mov r1, #0x1000
    str r2, [r6, #0x88]
    bl TitleRandom_NextBounded
    mov r1, r0, lsl #0x4
    mov r0, r6
    mov r2, r1
    mov r3, r1
    bl func_02094bf0
    mov r1, #0x800
    add r0, r6, #0x9c
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r1, #0x400
    mov r4, r0
    add r0, r6, #0x9c
    rsb r1, r1, #0x0
    mov r2, #0x400
    bl func_0209189c
    mov r3, r0
    mov r1, r4
    mov r0, r6
    mov r2, #0x1200
    bl Presentation_SetPosition
    mov r2, #0x800
    add r0, r6, #0x1c
    mov r1, #0x1
    rsb r2, r2, #0x0
    bl PresentationScalar_TransitionTo
    add r0, r6, #0x9c
    mov r1, #0x1e
    bl TitleRandom_NextBounded
    add r1, r0, #0x78
    mov r0, r6
    bl func_ov035_021fd274
    mov r4, #0x0
    add r0, r6, #0x9c
    mov r1, #0x7
    str r4, [r6, #0xa0]
    mov r7, r4
    mov r5, r4
    bl TitleRandom_NextBounded
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_021fd9a0
L_021fd8d0: ; jump table
    b L_021fd8ec ; case 0
    b L_021fd908 ; case 1
    b L_021fd924 ; case 2
    b L_021fd940 ; case 3
    b L_021fd95c ; case 4
    b L_021fd978 ; case 5
    b L_021fd994 ; case 6
L_021fd8ec:
    mov r4, #0x1f
    mov r2, r4
    add r0, r6, #0x9c
    mov r1, r7
    bl func_0209189c
    mov r5, r0
    b L_021fd9a0
L_021fd908:
    mov r4, #0x1f
    mov r2, r4
    add r0, r6, #0x9c
    mov r1, r7
    bl func_0209189c
    mov r7, r0
    b L_021fd9a0
L_021fd924:
    add r0, r6, #0x9c
    mov r1, r4
    mov r2, #0x1f
    bl func_0209189c
    mov r4, r0
    mov r7, #0x1f
    b L_021fd9a0
L_021fd940:
    mov r7, #0x1f
    mov r2, r7
    add r0, r6, #0x9c
    mov r1, r4
    bl func_0209189c
    mov r5, r0
    b L_021fd9a0
L_021fd95c:
    add r0, r6, #0x9c
    mov r1, r4
    mov r2, #0x1f
    bl func_0209189c
    mov r7, r0
    mov r5, #0x1f
    b L_021fd9a0
L_021fd978:
    add r0, r6, #0x9c
    mov r1, r4
    mov r2, #0x1f
    bl func_0209189c
    mov r4, r0
    mov r5, #0x1f
    b L_021fd9a0
L_021fd994:
    mov r4, #0x1f
    mov r7, r4
    mov r5, r4
L_021fd9a0:
    add r0, r7, r7, lsr #0x1f
    mov r2, r0, asr #0x1
    orr r1, r4, r7, lsl #0x5
    add r0, r5, r5, lsr #0x1f
    orr r5, r1, r5, lsl #0xa
    add r1, r4, r4, lsr #0x1f
    mov r2, r2, lsl #0x5
    mov r3, r0, asr #0x1
    orr r0, r2, r1, asr #0x1
    strh r5, [r6, #0xa4]
    orr r1, r0, r3, lsl #0xa
    mov r0, r6
    strh r1, [r6, #0xa6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd9d8: .word data_ov035_02203c40
.size func_ov035_021fd7f0, .-func_ov035_021fd7f0

