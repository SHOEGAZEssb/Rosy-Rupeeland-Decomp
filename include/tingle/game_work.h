#ifndef TINGLE_GAME_WORK_H
#define TINGLE_GAME_WORK_H

#include "tingle/types.h"

#define GAME_WORK_POINTER_BANK_COUNT 2
#define GAME_WORK_POINTER_BANK_SIZE 128

typedef struct GameWorkPointerEntry {
    u16 value0;
    u16 value2;
    void *pointer;
} GameWorkPointerEntry;

typedef struct GameWorkDualPointerBank {
    u16 count0;
    u16 padding2;
    GameWorkPointerEntry entries0[50];
    u16 count1;
    u16 padding196;
    GameWorkPointerEntry entries1[50];
} GameWorkDualPointerBank;

typedef struct GameWorkPackedEntry {
    u16 value0;
    u16 value2;
    u16 value4;
    u16 value6;
    u32 value : 29;
    u32 flags : 3;
} GameWorkPackedEntry;

typedef struct GameWorkPair {
    u16 value0;
    u16 value2;
} GameWorkPair;

typedef struct GameWorkInitialData {
    u16 defaultName[16];
    char tag[8];
} GameWorkInitialData;

typedef struct GameWork {
    u32 unknown0000;
    u32 serializationFlags;
    u8 unknown0008[8];
    u16 playerName[16];
    u8 unknown0030[0x10];
    u32 currency;
    u32 unknown0044;
    u32 unknown0048;
    u16 values004C[256];
    u8 bytes024C[0x180];
    void *pointerBanks[GAME_WORK_POINTER_BANK_COUNT]
                      [GAME_WORK_POINTER_BANK_SIZE];
    u32 values07CC[32];
    u16 unknown084C;
    u16 unknown084E;
    u32 values0850[220];
    u32 values0BC0[100];
    u32 values0D50[100];
    u8 bytes0EE0[8];
    u8 bytes0EE8[128];
    u8 bytes0F68[128];
    GameWorkDualPointerBank dualBanks[18];
    u32 unknown48B8;
    GameWorkPointerEntry entries48BC[200];
    u16 unknown4EFC;
    u16 padding4EFE;
    u16 triples4F00[120][3];
    s32 unknown51D0;
    u8 unknown51D4[0x1C];
    GameWorkPackedEntry packedEntries[256];
    u8 unknown5DF0[0x20];
    u32 unknown5E10;
    GameWorkPair pairs5E14[30];
    u8 bytes5E8C[8];
    u8 bytes5E94[128];
} GameWork;

typedef char GameWorkPointerEntrySizeCheck[
    sizeof(GameWorkPointerEntry) == 8 ? 1 : -1];
typedef char GameWorkDualPointerBankSizeCheck[
    sizeof(GameWorkDualPointerBank) == 0x328 ? 1 : -1];
typedef char GameWorkPackedEntrySizeCheck[
    sizeof(GameWorkPackedEntry) == 0xC ? 1 : -1];
typedef char GameWorkInitialDataSizeCheck[
    sizeof(GameWorkInitialData) == 0x28 ? 1 : -1];
typedef char GameWorkSizeCheck[sizeof(GameWork) == 0x5F14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern GameWorkInitialData gGameWorkInitialData;
extern GameWork *gGameWork;

void GameWork_Create(void);
void GameWork_Reset(void);
void GameWork_Init(GameWork *work);
void GameWork_ClearPointerBank(GameWork *work, int bank);
void GameWork_SetFlag(GameWork *work, int flag);
int GameWork_TestFlag(GameWork *work, int flag);
void GameWork_ClearFlag(GameWork *work, int flag);
u32 GameWork_Serialize(GameWork *work, void *buffer, u32 bufferSize);
void GameWork_Deserialize(GameWork *work, const void *buffer, u32 bufferSize);
void GameWork_CompressionRoundTrip(void);

#ifdef __cplusplus
}
#endif

#endif
