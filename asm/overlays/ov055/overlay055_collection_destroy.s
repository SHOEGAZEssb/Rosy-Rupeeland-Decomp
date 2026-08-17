.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern Heap_Free
.extern __destroy_arr
.extern AnimationResourceState_Destroy

.global func_ov055_0220e7cc
func_ov055_0220e7cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_0220e7e4
    bl Heap_Free
.L_0220e7e4:
    ldr r3, .L_0220e800
    mov r0, r4
    mov r1, #0x3
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e800: .word AnimationResourceState_Destroy
.size func_ov055_0220e7cc, . - func_ov055_0220e7cc
