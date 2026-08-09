.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Free
.extern data_ov089_02219928
.extern func_0203b61c
.extern func_ov089_02217904

.global func_ov089_022178d4
func_ov089_022178d4:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217900
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_ov089_02217904
    mov r0, r4
    bl func_0203b61c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217900: .word data_ov089_02219928
.size func_ov089_022178d4, . - func_ov089_022178d4
