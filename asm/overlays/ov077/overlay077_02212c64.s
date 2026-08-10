.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Free
.extern data_ov077_02217118
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_Destroy

.global func_ov077_02212c64
func_ov077_02212c64:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02212cb4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02212c8c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02212c8c:
    add r0, r4, #0x2b4
    bl VecFx32Object_Destroy
    add r0, r4, #0x2a4
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02212cb4: .word data_ov077_02217118
.size func_ov077_02212c64, . - func_ov077_02212c64
