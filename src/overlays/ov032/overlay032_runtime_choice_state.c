#include "tingle/graphics_bg_map_resource.h"

/* Overlay 32 runtime handoff and two-choice confirmation state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct GraphicsResourceSet {
    void *characterResource;
    void *paletteResource;
    GraphicsBgMapResource *bgMapResource;
} GraphicsResourceSet;

extern void *data_020f4e18[];
extern void *gGameWork;
extern void *gSoundContext;
extern void *gRuntimeContext;
extern u8 data_021f5f18[];
extern u8 data_021e9e00[];
extern u8 gScenarioActionTables[];
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Load(...);
extern void func_020b44e8(void);
extern void GraphicsBgCharacterResource_UploadToMainBg(...);
extern s32 GraphicsResource_GetFormat(void *);
extern void GraphicsBgPaletteResource_UploadToMainBg(...);
extern void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *);
extern void RetailSelectionManager_AdvanceHistory(void *);
extern void GameWork_ClearFlag(...);
extern void GameWork_SetFlag(...);
extern s32 GameWork_TestFlag(...);
extern void RetailPhaseDatabase_UnlockById(...);
extern void RetailSelectionHistory_InsertUniqueId(...);
extern void func_ov032_021fe0e8(void *);
extern void Sound_StopStream(...);
extern void SoundContext_PlayDefaultStream(...);
extern void RetailSaveContext_BeginRecordOperation(...);
extern s32 RetailSaveContext_PollOperation(void *);
extern s32 Overlay032SpriteWrapper_HitTest(...);
extern void func_ov032_021fe2bc(void *, u32);
extern void Sound_Play(...);
extern void func_ov032_021fe10c(void *);
extern void func_ov032_021fe23c(void *, s32);
extern s32 func_ov032_021fe134(void *, s32);
extern s32 RetailSelectionManager_HasInactiveSpecialRecord(void *);
#ifdef __cplusplus
}
#endif

static void set_flag4(void *scene, u32 offset, s32 set)
{
    void *object = FIELD(void *, scene, offset);
    u16 value = FIELD(u16, object, 0x24);
    FIELD(u16, object, 0x24) = set ? value | 4 : value & ~4;
}

static void load_background(void *scene, u32 paletteId)
{
    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1300;
    GraphicsResourceSet_Load((u8 *)scene + 0xf18, data_020f4e18[0], 0xa064, 0xa065, paletteId);
    func_020b44e8();
}

static void upload_background(void *scene)
{
    GraphicsResourceSet *set = (GraphicsResourceSet *)((u8 *)scene + 0xf18);
    GraphicsBgCharacterResource_UploadToMainBg(set->characterResource, 2, 0);
    GraphicsBgPaletteResource_UploadToMainBg(set->paletteResource,
                  GraphicsResource_GetFormat(set->characterResource)
                      ? 0x6000 : 0);
    GraphicsBgMapResource_UploadToMainBg(set->bgMapResource, 2, 0);
    GraphicsResourceSet_ReleaseHandles(set);
    REG16(0x05000000) = 0x24a3;
    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1700;
}

static void install_callback(void *scene, u32 offset, s32 state)
{
    FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, offset);
    FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, offset + 4);
    FIELD(s32, scene, 0xb64) = state;
}

static void reveal_menu(void *scene)
{
    if (FIELD(s32, data_021f5f18, 0x460) > 0) {
        set_flag4(scene, 0x184, 0);
        if (RetailSelectionManager_HasInactiveSpecialRecord(data_021f5f18)) {
            set_flag4(scene, 0x1b4, 0);
            func_ov032_021fe0e8((u8 *)scene + 0x1b4);
        }
    }
    set_flag4(scene, 0xf4, 0);
    set_flag4(scene, 0x154, 0);
    if (FIELD(s32, scene, 0xc1c) > 0) {
        set_flag4(scene, 0x124, 0);
        u32 flag = FIELD(u32, scene, 0xe60 + FIELD(s32, scene, 0xc1c) * 4);
        if (!GameWork_TestFlag(gGameWork, flag)) {
            set_flag4(scene, 0x1e4, 0);
            func_ov032_021fe0e8((u8 *)scene + 0x1e4);
        }
    }
}

/*
 * Runs the state at +0xB64 that loads two alternate BG2 palettes, optionally
 * performs a one-time runtime handoff when +0xF28 is set, and presents a
 * two-choice prompt through wrappers +0x214/+0x244. The first choice returns via
 * callback +0x50 after message 0x23; the second sets GameWork flag 0x3FB and
 * returns via +0x48 after message 0x1A. Runtime cancellation uses callback
 * +0x60, and the +0xF28 shortcut uses +0x58. It always returns zero.
 */
extern "C" s32 func_ov032_02200618(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        load_background(scene, 0xa069);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1:
        upload_background(scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 2:
        RetailSelectionManager_AdvanceHistory(data_021f5f18);
        if (FIELD(s32, scene, 0xf28)) {
            GameWork_ClearFlag(gGameWork, 0x15a);
            GameWork_SetFlag(gGameWork, 0x18);
            GameWork_SetFlag(gGameWork, 0x1f0);
            GameWork_SetFlag(gGameWork, 0x398);
            RetailPhaseDatabase_UnlockById(data_021e9e00, 10);
            typedef void (*Callback)(void);
            ((Callback)FIELD(void *, FIELD(void *, gScenarioActionTables, 0x70), 4))();
            const u32 ids[] = {0x68, 0x36, 0x35, 0x34, 0x2e};
            for (u32 i = 0; i < 5; ++i) RetailSelectionHistory_InsertUniqueId(data_021f5f18, ids[i]);
        }
        set_flag4(scene, 0x2d4, 0);
        func_ov032_021fe0e8((u8 *)scene + 0x2d4);
        Sound_StopStream(gSoundContext, 0);
        RetailSaveContext_BeginRecordOperation(gRuntimeContext, -1, 0, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 3: {
        s32 result = RetailSaveContext_PollOperation(gRuntimeContext);
        if (result == 1) {
            FIELD(s32, gGameWork, 0x44) = 0;
            FIELD(s32, gGameWork, 0x48) = 0;
            FIELD(s32, scene, 0xb64) = 10;
        } else if (result != 0) install_callback(scene, 0x60, 0);
        break;
    }
    case 10:
        SoundContext_PlayDefaultStream(gSoundContext, 0x12);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 11:
        load_background(scene, 0xa06a);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 12:
        upload_background(scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 13:
        set_flag4(scene, 0x2d4, 1);
        FIELD(u16, FIELD(void *, scene, 0xb14), 0x2c) = 0x80;
        FIELD(u16, FIELD(void *, scene, 0xb14), 0x2e) = 0x6c;
        set_flag4(scene, 0xb14, 0);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 14:
        if (FIELD(s32, scene, 0xb84) &&
            Overlay032SpriteWrapper_HitTest((u8 *)scene + 0xb14, (u8 *)scene + 0xb54, -1, -1))
            FIELD(s32, scene, 0xb64) = FIELD(s32, scene, 0xf28) ? 80 : 15;
        break;
    case 15:
        REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1300;
        set_flag4(scene, 0xb14, 1);
        set_flag4(scene, 0x214, 0);
        set_flag4(scene, 0x244, 0);
        func_ov032_021fe2bc(scene, 0x18);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 16:
        if (FIELD(s32, scene, 0xb84) &&
            Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x214, (u8 *)scene + 0xb54, -1, -1)) {
            Sound_Play(gSoundContext, 0x81, 0);
            set_flag4(scene, 0x214, 1); set_flag4(scene, 0x244, 1);
            func_ov032_021fe10c(scene);
            func_ov032_021fe23c(scene, 1);
            FIELD(s32, scene, 0xb64) = 90;
        } else if (FIELD(s32, scene, 0xb84) &&
                   Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x244, (u8 *)scene + 0xb54, -1, -1)) {
            Sound_Play(gSoundContext, 0x81, 1);
            set_flag4(scene, 0x214, 1); set_flag4(scene, 0x244, 1);
            func_ov032_021fe10c(scene);
            FIELD(s32, scene, 0xb64) = 100;
        } else {
            func_ov032_021fe134(scene, 0);
        }
        break;
    case 80:
        REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1300;
        set_flag4(scene, 0xb14, 1);
        install_callback(scene, 0x58, 10);
        break;
    case 90:
        reveal_menu(scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 91:
        func_ov032_021fe2bc(scene, 0x23);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 92:
        if (func_ov032_021fe134(scene, 0)) install_callback(scene, 0x50, 10);
        break;
    case 100:
        GameWork_SetFlag(gGameWork, 0x3fb);
        func_ov032_021fe2bc(scene, 0x1a);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 101:
        if (func_ov032_021fe134(scene, 1)) install_callback(scene, 0x48, 0);
        break;
    }
    return 0;
}
