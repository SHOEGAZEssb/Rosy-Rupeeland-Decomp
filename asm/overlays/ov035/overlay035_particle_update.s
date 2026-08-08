.text

/* Exact fallback; see src/overlays/ov035/overlay035_particle.c for documented portable C. */

    .extern func_020948d4
    .extern func_0209189c


    .global func_ov035_021fd9dc
func_ov035_021fd9dc: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x60]
    add r0, r4, #0x5c
    add r1, r1, #0x400
    bl func_020948d4
    add r0, r4, #0x9c
    mvn r1, #0x1
    mov r2, #0x2
    bl func_0209189c
    ldr r1, [r4, #0xa0]
    add r2, r1, r0
    str r2, [r4, #0xa0]
    ldr r1, [r4, #0x10]
    add r0, r4, #0xc
    add r1, r2, r1
    bl func_020948d4
    ldmia sp!, {r4, pc}
.size func_ov035_021fd9dc, .-func_ov035_021fd9dc

