#include "tingle/game_work.h"

/*
 * Serialization helpers for transferring GameWork through the save buffer.
 * The first 0x40 bytes remain uncompressed; the remaining state uses NitroSDK
 * LZ compression unless compression would be no smaller than the raw payload.
 */

#define GAME_WORK_HEADER_SIZE 0x40
#define GAME_WORK_PAYLOAD_SIZE (sizeof(GameWork) - GAME_WORK_HEADER_SIZE)
#define GAME_WORK_SERIALIZED_RAW 0x80000000U

extern void *func_02003e20(u32 size, const char *tag, s32 alignment,
                           void *heap);
extern void func_02003e38(void *allocation);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void MI_UncompressLZ8(const void *source, void *destination);
extern u32 MI_CompressLZ(const u8 *source, u32 size, u8 *destination);

extern void *gHeapContext;

char gGameWorkBufferTag[8] = "buff";

/*
 * Copy the header and compress the fixed-size GameWork payload into buffer.
 * bufferSize controls the raw copy length and is returned on compression
 * failure; the compressor always consumes the complete GameWork payload.
 */
u32 GameWork_Serialize(GameWork *work, void *buffer, u32 bufferSize)
{
    u32 payloadSize = bufferSize - GAME_WORK_HEADER_SIZE;
    u8 *scratch;
    u32 compressedSize;

    work->serializationFlags &= ~GAME_WORK_SERIALIZED_RAW;
    MI_CpuCopy8(work, buffer, GAME_WORK_HEADER_SIZE);

    /* A negative alignment selects the game heap wrapper's reverse direction. */
    scratch = (u8 *)func_02003e20(sizeof(GameWork), gGameWorkBufferTag, -4,
                                  &gHeapContext);
    MI_CpuCopy8((u8 *)work + GAME_WORK_HEADER_SIZE, scratch, payloadSize);
    compressedSize =
        MI_CompressLZ(scratch, GAME_WORK_PAYLOAD_SIZE,
                      (u8 *)buffer + GAME_WORK_HEADER_SIZE);

    if (compressedSize == 0) {
        /* The raw marker belongs to the serialized header, not live GameWork. */
        ((GameWork *)buffer)->serializationFlags |= GAME_WORK_SERIALIZED_RAW;
        MI_CpuCopy8((u8 *)work + GAME_WORK_HEADER_SIZE,
                    (u8 *)buffer + GAME_WORK_HEADER_SIZE, payloadSize);
        compressedSize = payloadSize;
    }

    func_02003e38(scratch);
    return compressedSize + GAME_WORK_HEADER_SIZE;
}

/*
 * Restore a serialized buffer into GameWork. Bit 31 in the copied header
 * chooses between a length-bounded raw payload and NitroSDK LZ expansion.
 */
void GameWork_Deserialize(GameWork *work, const void *buffer, u32 bufferSize)
{
    u32 payloadSize = bufferSize - GAME_WORK_HEADER_SIZE;

    MI_CpuCopy8(buffer, work, GAME_WORK_HEADER_SIZE);
    if ((work->serializationFlags & GAME_WORK_SERIALIZED_RAW) != 0) {
        MI_CpuCopy8((const u8 *)buffer + GAME_WORK_HEADER_SIZE,
                    (u8 *)work + GAME_WORK_HEADER_SIZE, payloadSize);
    } else {
        MI_UncompressLZ8((const u8 *)buffer + GAME_WORK_HEADER_SIZE,
                         (u8 *)work + GAME_WORK_HEADER_SIZE);
    }
}

/*
 * Exercise a serialize/deserialize cycle on the global work object. The retail
 * routine deliberately passes 0x5ED4 rather than sizeof(GameWork); changing
 * that argument would alter its observed behavior.
 */
void GameWork_CompressionRoundTrip(void)
{
    void *buffer = func_02003e20(sizeof(GameWork), gGameWorkBufferTag, -4,
                                 &gHeapContext);
    u32 serializedSize = GameWork_Serialize(gGameWork, buffer, 0x5ED4);

    GameWork_Deserialize(gGameWork, buffer, serializedSize);
    func_02003e38(buffer);
}
