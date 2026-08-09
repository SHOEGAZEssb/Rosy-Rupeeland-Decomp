.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern Heap_Free
.extern func_02005058
.extern func_0203b61c
.extern func_0204cd7c

.global func_ov081_022140c8
func_ov081_022140c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x244
    bl func_0204cd7c
    add r0, r4, #0x214
    bl func_02005058
    mov r0, r4
    bl func_0203b61c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov081_022140c8, . - func_ov081_022140c8
