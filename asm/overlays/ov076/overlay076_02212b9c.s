.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Heap_Free
.extern data_ov076_02214950
.extern ActorExtendedLinked_Destroy
.extern Sound_StopEffect
.extern gSoundContext

.global func_ov076_02212b9c
func_ov076_02212b9c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02212bd8
    mov r4, r0
    ldr r0, .L_02212bdc
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c4
    mov r2, #0x8
    bl Sound_StopEffect
    mov r0, r4
    bl ActorExtendedLinked_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02212bd8: .word data_ov076_02214950
.L_02212bdc: .word gSoundContext
.size func_ov076_02212b9c, . - func_ov076_02212b9c
