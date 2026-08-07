    .text
/* Exact fallback; see src/overlays/ov022/overlay022_emitter_runtime.c. */


.global func_ov022_021fd2dc
func_ov022_021fd2dc:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov022_021fd2dc, . - func_ov022_021fd2dc
