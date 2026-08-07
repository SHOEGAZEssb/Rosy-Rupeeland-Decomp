#include "tingle/types.h"

/* Overlay 18 completed-path overlap classification against scene descriptors. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern s32 data_020c37e4;
extern u8 data_020d7a48[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern s32 func_020befec(s32, s32);
extern s32 func_ov018_021fe19c(void *, const void *);
extern s32 func_ov018_021fe1d8(void *, const void *);
extern s32 func_ov018_021ffa14(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Search data_020D7A48's 0x24-byte descriptors for the first eligible entry
 * whose signed type +0 matches state +0x19C, whose completion/exclusion flags
 * +0x1C/+0x1E are clear, and whose translated bounds overlap point-buffer +0x58.
 * The descriptor origin must also lie inside the recovered polygon. Require the
 * overlap rectangle to cover at least 30 percent of both the path bounds and
 * descriptor bounds. On success, clear classification +0x420, set descriptor
 * flag +0x1C and global flag 0x3AE, optionally mark the per-entry discovery byte
 * and flag 0x3CA, then return one. Return zero otherwise; +0x194 tracks the last
 * descriptor examined and +0x420 remains 1 or becomes 2 when only geometric
 * preconditions were reached. GameWork flags and discovery state may change;
 * no direct hardware access occurs. The semantic names of the descriptor flags
 * and classification values remain inferred from this control flow.
 */
extern "C" s32 func_ov018_021fe214(void *state)
{
    void *buffer = FIELD(void *, state, 0x58);
    s32 descriptorCount = data_020c37e4;

    FIELD(s32, state, 0x420) = 1;
    for (s32 index = 0; index < descriptorCount; index++) {
        void *descriptor = data_020d7a48 + index * 0x24;
        FIELD(void *, state, 0x194) = descriptor;

        if (FIELD(s16, descriptor, 0) != FIELD(s32, state, 0x19c))
            continue;
        if (GameWork_TestFlag(gGameWork, FIELD(u16, descriptor, 0x1c)))
            continue;
        if (FIELD(u16, descriptor, 0x1e) != 0 &&
            GameWork_TestFlag(gGameWork, FIELD(u16, descriptor, 0x1e)))
            continue;

        s32 originX = func_ov018_021fe19c(state, descriptor);
        s32 originY = func_ov018_021fe1d8(state, descriptor);
        s32 descriptorLeft = originX + FIELD(s16, descriptor, 0x10);
        s32 descriptorTop = originY + FIELD(s16, descriptor, 0x12);
        s32 descriptorRight = originX + FIELD(s16, descriptor, 0x14);
        s32 descriptorBottom = originY + FIELD(s16, descriptor, 0x16);
        s32 bufferLeft = FIELD(s16, buffer, 0x1c);
        s32 bufferTop = FIELD(s16, buffer, 0x1e);
        s32 bufferRight = FIELD(s16, buffer, 0x20);
        s32 bufferBottom = FIELD(s16, buffer, 0x22);

        if (bufferRight < descriptorLeft || bufferLeft >= descriptorRight ||
            bufferBottom < descriptorTop || bufferTop >= descriptorBottom)
            continue;

        s32 overlapLeft = bufferLeft > descriptorLeft
                              ? bufferLeft : descriptorLeft;
        s32 overlapRight = bufferRight < descriptorRight
                               ? bufferRight : descriptorRight;
        s32 overlapTop = bufferTop > descriptorTop
                             ? bufferTop : descriptorTop;
        s32 overlapBottom = bufferBottom < descriptorBottom
                                ? bufferBottom : descriptorBottom;

        if (!func_ov018_021ffa14(buffer, originX, originY))
            continue;

        s32 scaledOverlap =
            (overlapRight - overlapLeft) * (overlapBottom - overlapTop) * 100;
        FIELD(s32, state, 0x420) = 2;
        s32 bufferArea =
            (bufferRight - bufferLeft) * (bufferBottom - bufferTop);
        if (func_020befec(scaledOverlap, bufferArea) < 30)
            continue;
        s32 descriptorArea = (descriptorRight - descriptorLeft) *
                             (descriptorBottom - descriptorTop);
        if (func_020befec(scaledOverlap, descriptorArea) < 30)
            continue;

        FIELD(s32, state, 0x420) = 0;
        GameWork_SetFlag(gGameWork, FIELD(u16, descriptor, 0x1c));
        GameWork_SetFlag(gGameWork, 0x3ae);
        if (FIELD(s32, state, 0x54) != 1) {
            u8 *discovery = (u8 *)gGameWork + 0x5e94;
            if (discovery[index] == 0) {
                discovery[index] = 1;
                GameWork_SetFlag(gGameWork, 0x3ca);
            }
        }
        return 1;
    }
    return 0;
}
