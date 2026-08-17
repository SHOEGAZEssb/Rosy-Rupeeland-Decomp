.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern func_020befec

    .global Overlay032Widget_HitTestRow
Overlay032Widget_HitTestRow:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x1a
    subs r2, r2, #0x28
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0xa1
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x6e
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x16
    bl func_020befec
    ldr r2, [r4, #0x4c]
    ldr r1, [r4, #0xc]
    cmp r0, #0x5
    ldr r2, [r2, #0xc]
    movge r0, #0x4
    add r1, r1, #0x1
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
.size Overlay032Widget_HitTestRow, .-Overlay032Widget_HitTestRow

