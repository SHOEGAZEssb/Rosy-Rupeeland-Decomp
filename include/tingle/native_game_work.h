#ifndef TINGLE_NATIVE_GAME_WORK_H
#define TINGLE_NATIVE_GAME_WORK_H

#include "tingle/types.h"

enum {
    TINGLE_NATIVE_GAME_WORK_SIZE = 0x5F14,
    TINGLE_NATIVE_GAME_WORK_FLAG_OFFSET = 0x024C,
    TINGLE_NATIVE_GAME_WORK_FLAG_COUNT = 0x180 * 8
};

/*
 * Byte-exact retail GameWork storage. Host pointers must never be written into
 * its four-byte NDS pointer slots; native object ownership lives outside it.
 */
typedef struct TingleNativeGameWork {
    u8 bytes[TINGLE_NATIVE_GAME_WORK_SIZE];
} TingleNativeGameWork;

/* Clears fresh storage, then applies the confirmed retail reset defaults. */
void TingleNativeGameWork_Init(TingleNativeGameWork *work);

/*
 * Applies GameWork_Init's known writes while preserving fields that the retail
 * initializer leaves alone and the unidentified subobject at offset 0x5DF0.
 */
void TingleNativeGameWork_Reset(TingleNativeGameWork *work);

/* Checked native equivalents of the retail flag bit accessors. */
s32 TingleNativeGameWork_SetFlag(TingleNativeGameWork *work, s32 flag);
s32 TingleNativeGameWork_TestFlag(const TingleNativeGameWork *work, s32 flag);
s32 TingleNativeGameWork_ClearFlag(TingleNativeGameWork *work, s32 flag);

#endif
