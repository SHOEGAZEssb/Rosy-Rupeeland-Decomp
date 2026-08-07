    .text
    .extern func_02095860
    .extern func_02095940

/* Exact fallback for record stop and lookup; see src/overlays/ov015/overlay015_record_layout.c. */
    .global func_ov015_021fda50
    .global func_ov015_021fda78

func_ov015_021fda50:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    add r5, r0, #0xfc
    mov r4, #0xac
L_021fda60:
    mla r0, r6, r4, r5
    bl func_02095940
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_021fda60
    ldmia sp!, {r4, r5, r6, pc}

    .global func_ov015_021fda78
func_ov015_021fda78: ; 0x021fda78
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r9, r0
    mov r7, #0x0
    mov r8, r1
    add r6, r9, #0xfc
    mov r5, r7
    mov r4, #0x4
    mov r10, #0xac
    b L_021fdac0
L_021fda9c:
    mla r0, r7, r10, r6
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_02095860
    cmp r0, #0x0
    movne r0, r7
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    add r7, r7, #0x1
L_021fdac0:
    ldr r0, [r9, #0x300]
    cmp r7, r0
    blt L_021fda9c
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}

    .size func_ov015_021fda50, func_ov015_021fda78 - func_ov015_021fda50
    .size func_ov015_021fda78, . - func_ov015_021fda78
