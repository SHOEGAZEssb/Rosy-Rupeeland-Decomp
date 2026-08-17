#include "tingle/game_work.h"

/*
 * Allocation and reset logic for the game's 0x5F14-byte global work object.
 * Most member names remain offset-based until their consumers are decompiled;
 * comments therefore describe observed initialization rather than game meaning.
 */

extern void *Heap_Alloc(u32 size, const char *tag, u32 alignment, void *heap);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void *GamePhaseProgress_GetOrCreateGlobal(void);
extern void func_02027bd4(void *context, void *state);

extern void *gHeapContext;

/* Default UTF-16 player name followed by the four-byte heap allocation tag. */
GameWorkInitialData gGameWorkInitialData = {
    {
        0x30C7, 0x30D0, 0x30C3, 0x30B0,
    },
    "GMWK",
};

GameWork *gGameWork;

/* Allocate the singleton from the main heap and initialize it when successful. */
void GameWork_Create(void)
{
    GameWork *work =
        (GameWork *)Heap_Alloc(sizeof(GameWork), gGameWorkInitialData.tag, 4,
                               &gHeapContext);

    if (work != 0) {
        GameWork_Init(work);
    }
    gGameWork = work;
}

/* Restore the existing singleton to the same state used immediately after creation. */
void GameWork_Reset(void)
{
    GameWork_Init(gGameWork);
}

#ifdef MATCHING
/*
 * MWCC's C output differs only in one r2/r12 allocation. Labels in an inline
 * assembly function acquire redundant fallthrough branches, so the backward
 * branches below use their exact ARM encodings. The portable C remains below.
 */
asm void GameWork_Init(register GameWork *work)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r1, #0
    mov r4, r0
    str r1, [r4, #0x40]
    str r1, [r4, #0x44]
    str r1, [r4, #0x48]
    mov r3, r1
    add r0, r4, r1, lsl #1
    add r1, r1, #1
    strh r3, [r0, #0x4c]
    cmp r1, #0x100
    DCD 0xBAFFFFFA
    add r0, r4, #0x200
    mov r1, #0x20
    strh r1, [r0]
    ldr r2, =0x186
    add r0, r4, #0x100
    strh r2, [r0, #0xf6]
    ldr r1, =0x2ad
    mov r2, #0
    strh r1, [r0, #0xf4]
    add r0, r4, r3, lsl #2
    add r3, r3, #1
    str r2, [r0, #0x7cc]
    cmp r3, #0x20
    DCD 0xBAFFFFFA
    mov r1, #0
    add r0, r4, r2
    add r2, r2, #1
    strb r1, [r0, #0x24c]
    cmp r2, #0x180
    DCD 0xBAFFFFFA
    mov r0, r4
    bl GameWork_ClearPointerBank
    mov r0, r4
    mov r1, #1
    bl GameWork_ClearPointerBank
    add r0, r4, #0x800
    mov r1, #1
    strh r1, [r0, #0x4c]
    mov r1, #0
    strh r1, [r0, #0x4e]
    mov r2, r1
    add r0, r4, r1, lsl #2
    add r1, r1, #1
    str r2, [r0, #0x850]
    cmp r1, #0xdc
    DCD 0xBAFFFFFA
    mov r1, #0
    add r0, r4, r2, lsl #2
    add r2, r2, #1
    str r1, [r0, #0xbc0]
    cmp r2, #0x64
    DCD 0xBAFFFFFA
    mov r2, #0
    add r0, r4, r1, lsl #2
    add r1, r1, #1
    str r2, [r0, #0xd50]
    cmp r1, #0x64
    DCD 0xBAFFFFFA
    mov r1, #0
    add r0, r4, r2
    add r2, r2, #1
    strb r1, [r0, #0xee0]
    cmp r2, #8
    DCD 0xBAFFFFFA
    mov r2, #0
    add r0, r4, r1
    add r0, r0, #0x5000
    add r1, r1, #1
    strb r2, [r0, #0xe8c]
    cmp r1, #8
    DCD 0xBAFFFFF9
    mov r1, #0
    add r0, r4, r2
    add r0, r0, #0x5000
    add r2, r2, #1
    strb r1, [r0, #0xe94]
    cmp r2, #0x80
    DCD 0xBAFFFFF9
    mov r2, #0
    add r0, r4, r1
    strb r2, [r0, #0xee8]
    add r1, r1, #1
    strb r2, [r0, #0xf68]
    cmp r1, #0x80
    DCD 0xBAFFFFF9
    mov r0, #0
    mov r3, r0
    mov r1, r0
    mov r6, #0x328
    mla r12, r2, r6, r4
    add r5, r12, #0xf00
    mov r7, r1
    strh r1, [r5, #0xe8]
    add lr, r12, r7, lsl #3
    add r5, lr, #0xf00
    strh r0, [r5, #0xec]
    str r0, [lr, #0xff0]
    add r7, r7, #1
    strh r0, [r5, #0xee]
    cmp r7, #0x32
    DCD 0xBAFFFFF7
    add r5, r12, #0x1100
    mov r7, r0
    strh r0, [r5, #0x7c]
    add lr, r12, r7, lsl #3
    add r5, lr, #0x1100
    strh r3, [r5, #0x80]
    add lr, lr, #0x1000
    str r3, [lr, #0x184]
    add r7, r7, #1
    strh r3, [r5, #0x82]
    cmp r7, #0x32
    DCD 0xBAFFFFF6
    add r2, r2, #1
    cmp r2, #0x12
    DCD 0xBAFFFFE4
    add r0, r4, #0x4000
    str r3, [r0, #0x8b8]
    mov r5, #0
    add r0, r4, r3, lsl #3
    add r1, r0, #0x4800
    strh r5, [r1, #0xbc]
    add r0, r0, #0x4000
    str r5, [r0, #0x8c0]
    add r3, r3, #1
    strh r5, [r1, #0xbe]
    cmp r3, #0xc8
    DCD 0xBAFFFFF6
    add r0, r4, #0x4e00
    strh r5, [r0, #0xfc]
    mov r0, #0
    mov r1, #6
    mla r2, r5, r1, r4
    add r2, r2, #0x4f00
    strh r0, [r2]
    strh r0, [r2, #2]
    add r5, r5, #1
    strh r0, [r2, #4]
    cmp r5, #0x78
    DCD 0xBAFFFFF7
    add r1, r4, #0x200
    mov r2, #0x400
    strh r2, [r1, #0x10]
    strh r2, [r1, #0x12]
    add r1, r4, #0x5000
    mvn r2, #0
    str r2, [r1, #0x1d0]
    add r1, r4, #0x1f8
    add r3, r1, #0x5000
    mov r5, #0
    mov r1, #0xc
    mul r6, r0, r1
    add r2, r4, r6
    add r2, r2, #0x5100
    strh r5, [r2, #0xf0]
    strh r5, [r2, #0xf2]
    strh r5, [r2, #0xf4]
    strh r5, [r2, #0xf6]
    ldr r2, [r3, r6]
    add r0, r0, #1
    and r2, r2, #0xe0000000
    bic r2, r2, #0xe0000000
    str r2, [r3, r6]
    cmp r0, #0x100
    DCD 0xBAFFFFF1
    ldr r0, =gGameWorkInitialData
    add r1, r4, #0x10
    mov r2, #0x20
    bl MI_CpuCopy8
    bl GamePhaseProgress_GetOrCreateGlobal
    add r1, r4, #0xdf0
    add r1, r1, #0x5000
    bl func_02027bd4
    mov r1, #0
    add r0, r4, #0x5000
    str r1, [r0, #0xe10]
    mov r2, r1
    add r0, r4, r1, lsl #2
    add r0, r0, #0x5e00
    strh r2, [r0, #0x14]
    add r1, r1, #1
    strh r2, [r0, #0x16]
    cmp r1, #0x1e
    DCD 0xBAFFFFF8
    add r0, r4, #0x100
    mov r1, #5
    strh r1, [r0, #0xa]
    strh r2, [r0, #0xc]
    strh r2, [r0, #0xe]
    strh r2, [r0, #0x10]
    strh r2, [r4, #0x90]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#else
/*
 * Portable description of the complete singleton reset. Offset-based arrays
 * are kept separate to mirror the retail loops and make future type recovery
 * straightforward.
 */
void GameWork_Init(GameWork *work)
{
    int i;
    int j;

    work->currency = 0;
    work->unknown0044 = 0;
    work->unknown0048 = 0;

    /* Clear the leading scalar tables, then install their nonzero defaults. */
    for (i = 0; i < 256; i++) {
        work->values004C[i] = 0;
    }
    work->values004C[218] = 0x20;
    work->values004C[213] = 0x186;
    work->values004C[212] = 0x2AD;

    for (i = 0; i < 32; i++) {
        work->values07CC[i] = 0;
    }
    for (i = 0; i < 0x180; i++) {
        work->bytes024C[i] = 0;
    }

    /* These banks are cleared through the same helper used by other callers. */
    GameWork_ClearPointerBank(work, 0);
    GameWork_ClearPointerBank(work, 1);

    work->unknown084C = 1;
    work->unknown084E = 0;
    for (i = 0; i < 220; i++) {
        work->values0850[i] = 0;
    }
    for (i = 0; i < 100; i++) {
        work->values0BC0[i] = 0;
    }
    for (i = 0; i < 100; i++) {
        work->values0D50[i] = 0;
    }
    for (i = 0; i < 8; i++) {
        work->bytes0EE0[i] = 0;
    }
    for (i = 0; i < 8; i++) {
        work->bytes5E8C[i] = 0;
    }
    for (i = 0; i < 128; i++) {
        work->bytes5E94[i] = 0;
    }
    for (i = 0; i < 128; i++) {
        work->bytes0EE8[i] = 0;
        work->bytes0F68[i] = 0;
    }

    /* Reset both 50-entry pointer lists in each of the 18 dual-bank records. */
    for (i = 0; i < 18; i++) {
        work->dualBanks[i].count0 = 0;
        for (j = 0; j < 50; j++) {
            work->dualBanks[i].entries0[j].value0 = 0;
            work->dualBanks[i].entries0[j].pointer = 0;
            work->dualBanks[i].entries0[j].value2 = 0;
        }
        work->dualBanks[i].count1 = 0;
        for (j = 0; j < 50; j++) {
            work->dualBanks[i].entries1[j].value0 = 0;
            work->dualBanks[i].entries1[j].pointer = 0;
            work->dualBanks[i].entries1[j].value2 = 0;
        }
    }

    work->unknown48B8 = 0;
    for (i = 0; i < 200; i++) {
        work->entries48BC[i].value0 = 0;
        work->entries48BC[i].pointer = 0;
        work->entries48BC[i].value2 = 0;
    }
    work->unknown4EFC = 0;
    for (i = 0; i < 120; i++) {
        work->triples4F00[i][0] = 0;
        work->triples4F00[i][1] = 0;
        work->triples4F00[i][2] = 0;
    }

    work->values004C[226] = 0x400;
    work->values004C[227] = 0x400;
    work->unknown51D0 = -1;

    /* Clear all scalar fields, including both parts of the packed final word. */
    for (i = 0; i < 256; i++) {
        work->packedEntries[i].value0 = 0;
        work->packedEntries[i].value2 = 0;
        work->packedEntries[i].value4 = 0;
        work->packedEntries[i].value6 = 0;
        work->packedEntries[i].value = 0;
        work->packedEntries[i].flags = 0;
    }

    /* Copy the default name and initialize the still-unidentified subobject. */
    MI_CpuCopy8(gGameWorkInitialData.defaultName, work->playerName,
                sizeof(work->playerName));
    func_02027bd4(GamePhaseProgress_GetOrCreateGlobal(), work->unknown5DF0);

    work->unknown5E10 = 0;
    for (i = 0; i < 30; i++) {
        work->pairs5E14[i].value0 = 0;
        work->pairs5E14[i].value2 = 0;
    }

    work->values004C[95] = 5;
    work->values004C[96] = 0;
    work->values004C[97] = 0;
    work->values004C[98] = 0;
    work->values004C[34] = 0;
}
#endif

/* Clear one of the two 128-pointer banks; other bank indices are ignored. */
void GameWork_ClearPointerBank(GameWork *work, int bank)
{
    int i;

    if (bank == 0) {
        for (i = 0; i < GAME_WORK_POINTER_BANK_SIZE; i++) {
            work->pointerBanks[0][i] = 0;
        }
    } else if (bank == 1) {
        for (i = 0; i < GAME_WORK_POINTER_BANK_SIZE; i++) {
            work->pointerBanks[1][i] = 0;
        }
    }
}
