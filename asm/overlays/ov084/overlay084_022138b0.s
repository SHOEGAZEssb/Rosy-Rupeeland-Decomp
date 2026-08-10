.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern Heap_Free
.extern func_02005058
.extern ActorExtendedType2_Destroy

.global func_ov084_022138b0
func_ov084_022138b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x298
    bl func_02005058
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov084_022138b0, . - func_ov084_022138b0
