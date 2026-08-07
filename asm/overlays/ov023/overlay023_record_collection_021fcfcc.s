.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern func_0207419c
.extern func_020927b8
.extern func_020c0c24
.extern func_ov023_021fce2c


    .global func_ov023_021fcfcc
func_ov023_021fcfcc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_0207419c
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_021fcff4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fcff4:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq L_021fd010
    ldr r3, L_021fd020
    mov r1, #0x18
    mov r2, #0x8
    bl func_020c0c24
L_021fd010:
    add r0, r4, #0x8
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd020: .word func_ov023_021fce2c
.size func_ov023_021fcfcc, .-func_ov023_021fcfcc

