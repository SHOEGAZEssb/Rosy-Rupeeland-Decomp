.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */



    .global func_ov023_021fd398
func_ov023_021fd398:
    ldr r1, [r0, #0x38]
    ldr r2, [r0, #0x2c]
    ldr r1, [r1, #0x14]
    mov r0, #0x18
    mla r0, r1, r0, r2
    bx lr
.size func_ov023_021fd398, .-func_ov023_021fd398

