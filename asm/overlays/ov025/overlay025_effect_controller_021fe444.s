.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_followup.c. */
.extern func_0209189c
.extern func_ov025_021feb08


    .global func_ov025_021fe444
func_ov025_021fe444:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x9c]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fe45c: ; jump table
    ldmia sp!, {r4, pc} ; case 0
    ldmia sp!, {r4, pc} ; case 1
    ldmia sp!, {r4, pc} ; case 2
    b L_021fe48c ; case 3
    ldmia sp!, {r4, pc} ; case 4
    ldmia sp!, {r4, pc} ; case 5
    b L_021fe4ac ; case 6
    ldmia sp!, {r4, pc} ; case 7
    ldmia sp!, {r4, pc} ; case 8
    ldmia sp!, {r4, pc} ; case 9
    ldmia sp!, {r4, pc} ; case 10
    ldmia sp!, {r4, pc} ; case 11
L_021fe48c:
    add r0, r4, #0xf8
    mov r1, #0x4
    mov r2, #0xb
    bl func_0209189c
    mov r1, r0
    mov r0, r4
    bl func_ov025_021feb08
    ldmia sp!, {r4, pc}
L_021fe4ac:
    add r0, r4, #0xf8
    mov r1, #0xf
    mov r2, #0x14
    bl func_0209189c
    mov r1, r0
    mov r0, r4
    bl func_ov025_021feb08
    ldmia sp!, {r4, pc}
.size func_ov025_021fe444, .-func_ov025_021fe444

