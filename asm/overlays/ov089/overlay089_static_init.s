.section .init, 4, 1, 6
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern __register_global_object
.extern data_ov089_02219a24
.extern data_ov089_02219a30
.extern data_ov089_02219a3c
.extern data_ov089_02219a48
.extern data_ov089_02219a54
.extern data_ov089_02219a60
.extern data_ov089_02219a6c
.extern data_ov089_02219a78
.extern data_ov089_02219a84
.extern data_ov089_02219a90
.extern data_ov089_02219a9c
.extern data_ov089_02219aa8
.extern data_ov089_02219ab4
.extern data_ov089_02219ac0
.extern data_ov089_02219acc
.extern data_ov089_02219ad8
.extern data_ov089_02219ae4
.extern data_ov089_02219af0
.extern data_ov089_02219afc
.extern data_ov089_02219b08
.extern data_ov089_02219b14
.extern data_ov089_02219b20
.extern data_ov089_02219b2c
.extern data_ov089_02219b38
.extern data_ov089_02219b44
.extern data_ov089_02219b50
.extern data_ov089_02219b5c
.extern data_ov089_02219b68
.extern data_ov089_02219b74
.extern data_ov089_02219b80
.extern data_ov089_02219b8c
.extern data_ov089_02219b98
.extern func_ov089_022177e0
.extern func_ov089_02218e6c

.global __sinit_ov089_022195e8
__sinit_ov089_022195e8:
    stmdb sp!, {r3, lr}
    mov r1, #0x0
    ldr r0, .L_02219808
    sub r2, r1, #0xc000
    bl func_ov089_02218e6c
    ldr r0, .L_02219808
    ldr r1, .L_0221980c
    ldr r2, .L_02219810
    bl __register_global_object
    mov r1, #0xd000
    ldr r0, .L_02219814
    sub r2, r1, #0x13000
    bl func_ov089_02218e6c
    ldr r0, .L_02219814
    ldr r1, .L_0221980c
    ldr r2, .L_02219818
    bl __register_global_object
    ldr r0, .L_0221981c
    mov r1, #0x1a000
    mov r2, #0x7000
    bl func_ov089_02218e6c
    ldr r0, .L_0221981c
    ldr r1, .L_0221980c
    ldr r2, .L_02219820
    bl __register_global_object
    ldr r0, .L_02219824
    mov r1, #0xb000
    mov r2, #0x15000
    bl func_ov089_02218e6c
    ldr r0, .L_02219824
    ldr r1, .L_0221980c
    ldr r2, .L_02219828
    bl __register_global_object
    ldr r0, .L_0221982c
    mov r1, #0x0
    mov r2, #0x16000
    bl func_ov089_02218e6c
    ldr r0, .L_0221982c
    ldr r1, .L_0221980c
    ldr r2, .L_02219830
    bl __register_global_object
    ldr r0, .L_02219834
    mov r1, #0xa000
    rsb r1, r1, #0x0
    mov r2, #0x17000
    bl func_ov089_02218e6c
    ldr r0, .L_02219834
    ldr r1, .L_0221980c
    ldr r2, .L_02219838
    bl __register_global_object
    ldr r0, .L_0221983c
    mov r1, #0x18000
    rsb r1, r1, #0x0
    mov r2, #0x8000
    bl func_ov089_02218e6c
    ldr r0, .L_0221983c
    ldr r1, .L_0221980c
    ldr r2, .L_02219840
    bl __register_global_object
    mov r1, #0xe000
    rsb r1, r1, #0x0
    ldr r0, .L_02219844
    add r2, r1, #0x9000
    bl func_ov089_02218e6c
    ldr r0, .L_02219844
    ldr r1, .L_0221980c
    ldr r2, .L_02219848
    bl __register_global_object
    ldr r0, .L_0221984c
    mov r1, #0x0
    mov r2, #0xe000
    bl func_ov089_02218e6c
    ldr r0, .L_0221984c
    ldr r1, .L_0221980c
    ldr r2, .L_02219850
    bl __register_global_object
    ldr r0, .L_02219854
    mov r1, #0x8000
    rsb r1, r1, #0x0
    mov r2, #0xb000
    bl func_ov089_02218e6c
    ldr r0, .L_02219854
    ldr r1, .L_0221980c
    ldr r2, .L_02219858
    bl __register_global_object
    ldr r0, .L_0221985c
    mov r1, #0x9000
    rsb r1, r1, #0x0
    mov r2, #0x2000
    bl func_ov089_02218e6c
    ldr r0, .L_0221985c
    ldr r1, .L_0221980c
    ldr r2, .L_02219860
    bl __register_global_object
    ldr r0, .L_02219864
    mov r1, #0x6000
    rsb r1, r1, #0x0
    sub r2, r1, #0x1000
    bl func_ov089_02218e6c
    ldr r0, .L_02219864
    ldr r1, .L_0221980c
    ldr r2, .L_02219868
    bl __register_global_object
    ldr r0, .L_0221986c
    mov r1, #0x0
    sub r2, r1, #0xa000
    bl func_ov089_02218e6c
    ldr r0, .L_0221986c
    ldr r1, .L_0221980c
    ldr r2, .L_02219870
    bl __register_global_object
    mov r1, #0x9000
    ldr r0, .L_02219874
    sub r2, r1, #0x10000
    bl func_ov089_02218e6c
    ldr r0, .L_02219874
    ldr r1, .L_0221980c
    ldr r2, .L_02219878
    bl __register_global_object
    ldr r0, .L_0221987c
    mov r1, #0x10000
    mov r2, #0x1000
    bl func_ov089_02218e6c
    ldr r0, .L_0221987c
    ldr r1, .L_0221980c
    ldr r2, .L_02219880
    bl __register_global_object
    mov r1, #0xb000
    ldr r0, .L_02219884
    mov r2, r1
    bl func_ov089_02218e6c
    ldr r0, .L_02219884
    ldr r1, .L_0221980c
    ldr r2, .L_02219888
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_02219808: .word data_ov089_02219b44
.L_0221980c: .word func_ov089_022177e0
.L_02219810: .word data_ov089_02219a78
.L_02219814: .word data_ov089_02219b50
.L_02219818: .word data_ov089_02219a30
.L_0221981c: .word data_ov089_02219b5c
.L_02219820: .word data_ov089_02219a54
.L_02219824: .word data_ov089_02219b68
.L_02219828: .word data_ov089_02219a24
.L_0221982c: .word data_ov089_02219b74
.L_02219830: .word data_ov089_02219ad8
.L_02219834: .word data_ov089_02219b80
.L_02219838: .word data_ov089_02219a48
.L_0221983c: .word data_ov089_02219b8c
.L_02219840: .word data_ov089_02219acc
.L_02219844: .word data_ov089_02219b98
.L_02219848: .word data_ov089_02219a3c
.L_0221984c: .word data_ov089_02219ae4
.L_02219850: .word data_ov089_02219a6c
.L_02219854: .word data_ov089_02219af0
.L_02219858: .word data_ov089_02219a9c
.L_0221985c: .word data_ov089_02219afc
.L_02219860: .word data_ov089_02219a90
.L_02219864: .word data_ov089_02219b08
.L_02219868: .word data_ov089_02219a84
.L_0221986c: .word data_ov089_02219b14
.L_02219870: .word data_ov089_02219aa8
.L_02219874: .word data_ov089_02219b20
.L_02219878: .word data_ov089_02219ab4
.L_0221987c: .word data_ov089_02219b2c
.L_02219880: .word data_ov089_02219ac0
.L_02219884: .word data_ov089_02219b38
.L_02219888: .word data_ov089_02219a60
.size __sinit_ov089_022195e8, . - __sinit_ov089_022195e8
