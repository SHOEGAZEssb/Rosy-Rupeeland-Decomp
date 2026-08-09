.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e80
.extern func_02071eb8
.extern func_02073ef8
.extern func_0209548c

.global func_ov094_0221800c
func_ov094_0221800c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221803c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xc0]
    bl func_02073ef8
    add r0, r4, #0xb0
    bl func_02071eb8
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221803c: .word data_ov094_02219e80
.size func_ov094_0221800c, . - func_ov094_0221800c
