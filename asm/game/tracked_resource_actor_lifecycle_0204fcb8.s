; Matching retail form; see src/game/tracked_resource_actor_lifecycle.c.
.extern Heap_Free
.extern data_020e2e9c
.extern func_02030f98
.extern func_0203130c
.extern func_02031488
.extern Type7Actor_ClearGlobalRelationshipToActor
.text

    .global func_0204fcb8
func_0204fcb8: ; 0x0204fcb8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r0, .L_0204fd04
    mov ip, #0x0
    str r0, [r4, #0x0]
    str ip, [r4, #0x1ec]
    add r2, r4, #0x100
    ldrh r3, [r2, #0xf0]
    sub r1, ip, #0x8000
    mov r0, r4
    and r1, r3, r1
    strh r1, [r2, #0xf0]
    ldr r1, [r4, #0x1f4]
    bic r1, r1, #0x1
    str r1, [r4, #0x1f4]
    strh ip, [r2, #0xf8]
    str ip, [r4, #0x1fc]
    ldmia sp!, {r4, pc}
.L_0204fd04: .word data_020e2e9c
.size func_0204fcb8, . - func_0204fcb8

    .global func_0204fd08

func_0204fd08: ; 0x0204fd08
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fd5c
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fd4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fd4c:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fd5c: .word data_020e2e9c
.size func_0204fd08, . - func_0204fd08

    .global func_0204fd60

func_0204fd60: ; 0x0204fd60
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fdbc
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fda4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fda4:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fdbc: .word data_020e2e9c
.size func_0204fd60, . - func_0204fd60

    .global func_0204fdc0

func_0204fdc0: ; 0x0204fdc0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fe14
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fe04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fe04:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fe14: .word data_020e2e9c
.size func_0204fdc0, . - func_0204fdc0

