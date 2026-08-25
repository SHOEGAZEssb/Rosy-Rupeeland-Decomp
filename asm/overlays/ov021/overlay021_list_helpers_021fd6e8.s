    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global Overlay021_List_GetSelectedRow
Overlay021_List_GetSelectedRow:
    ldr r1, [r0, #0x58]
    ldr r2, [r0, #0x4c]
    ldr r1, [r1, #0x14]
    mov r0, #0xc
    mla r0, r1, r0, r2
    bx lr
    .size Overlay021_List_GetSelectedRow, . - Overlay021_List_GetSelectedRow

