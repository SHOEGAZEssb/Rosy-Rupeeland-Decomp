.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern func_020befec


    .global func_ov023_021fd328
func_ov023_021fd328:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x20
    subs r2, r2, #0x18
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0xb8
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x68
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x1a
    bl func_020befec
    ldr r2, [r4, #0x38]
    cmp r0, #0x4
    ldr r2, [r2, #0xc]
    movge r0, #0x3
    ldr r1, [r4, #0x34]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov023_021fd328, .-func_ov023_021fd328

