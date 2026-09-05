.text
; Matching fallback for the portable implementation in src/game/overlay34_runtime_scene.c.
.extern GamePhaseLoadScene_Init
.extern Heap_Alloc
.extern data_020e5900
.extern gHeapContext

.global Overlay34ResultScene_Update
Overlay34ResultScene_Update:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x8]
    cmp r2, #0x0
    beq .L_0206f1a4
    cmp r2, #0x1
    beq .L_0206f1d8
    b .L_0206f1f4
.L_0206f1a4:
    ldr r1, .L_0206f1fc
    add ip, r2, #0x1
    ldr r3, .L_0206f200
    mov r0, #0x9c
    mov r2, #0x4
    str ip, [r4, #0x8]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0206f1f4
    ldr r2, [r4, #0x24]
    mov r1, #0x16
    bl GamePhaseLoadScene_Init
    b .L_0206f1f4
.L_0206f1d8:
    cmp r4, #0x0
    beq .L_0206f1ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0206f1ec:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0206f1f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0206f1fc: .word data_020e5900
.L_0206f200: .word gHeapContext
.size Overlay34ResultScene_Update, . - Overlay34ResultScene_Update
