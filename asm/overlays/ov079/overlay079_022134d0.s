.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern ActorExtendedType2_SelectRandomDescriptorCallback
.extern func_ov079_0221317c
.extern func_ov079_0221340c
.extern genrand_int32

.global func_ov079_022134d0
func_ov079_022134d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x0
    str r0, [r5, #0x228]
    mov r4, r1
    str r0, [r5, #0x2a0]
    bl genrand_int32
    mov r0, r5
    bl func_ov079_0221340c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x1e]
    mov r0, r5
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    bl func_ov079_0221317c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl ActorExtendedType2_SelectRandomDescriptorCallback
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov079_022134d0, . - func_ov079_022134d0
