#include "tingle/checked_fs.h"
#include "tingle/types.h"

/* Overlay 12 LWO object-viewer scene construction and Nintendo DS 3D setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const void *data_ov012_021fe670[];
extern const void *data_ov012_021fe6a4[];
extern const u32 data_ov012_021fe4d0[];
extern const char data_ov012_021fe6b8[];
extern const char data_ov012_021fe6d4[];
extern const char data_ov012_021fe6dc[];
extern const char data_ov012_021fe6e4[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void Scene_Init(void *);
extern void Scene_SetFlags03(void *);
extern void func_02091e28(void *);
extern void func_02077ae8(void *);
extern void Graphics3DLightSet_Init(void *);
extern void func_02092364(void *);
extern void func_020923a4(void *);
extern void func_020755bc(void *);
extern void *func_02002700(s32, const char *, s32, void *);
extern s32 func_020bf1f8(s32, s32);
extern void func_020b4554(void *, s32);
extern void G3X_Init(void);
extern void *Heap_Alloc(s32, const char *, s32, void *);
extern void *func_020774ac(void *, s32, s32);
extern void *func_02077ca0(void *, void *, void *, s32, s32);
extern void func_ov012_021fce00(void *);
extern void func_ov012_021fd5ac(void *);
extern void func_ov012_021fd004(u32);
extern void GX_DispOn(void);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void func_02092638(s32, s32, s32, s32);
extern void func_ov012_021fd020(u32);
extern void func_ov012_021fd044(s32);
extern void func_ov012_021fd080(s32);
extern void func_020b0300(u32, s32, s32, s32, s32);
extern void func_ov012_021fd0bc(void *, s32, s32, s32);
extern void func_ov012_021fd0c4(void *, s32, s32, s32);
extern void func_ov012_021fd0d4(void *, s32, u32, u32, u32, u32, u32, u32);
extern void func_ov012_021fd63c(void *);
extern void func_ov012_021fd148(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize scene/member bases and recovered vtables; load the single LWO
 * viewer data file into +0x7C and record its 24-byte entry count at +0x184;
 * allocate/configure the +0x78 and +0x154 render resources; apply viewer
 * defaults; configure both displays and DS 3D registers; initialize the
 * transform/draw slot; select resource zero; set scene flags; and return
 * state. Failed file opens/short reads follow the original partial-init path.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fd170(void *state)
{
    FSFile file;
    s32 sceneFields[2];
    s32 length;
    void *allocation;
    u32 intensity;

    Scene_Init(state);
    func_02091e28((u8 *)state + 0x24);
    FIELD(const void *, state, 0x00) = data_ov012_021fe670;
    FIELD(const void *, state, 0x24) = data_ov012_021fe6a4;
    func_02077ae8((u8 *)state + 0x80);
    Graphics3DLightSet_Init((u8 *)state + 0x114);
    func_ov012_021fce00((u8 *)state + 0x158);
    func_02092364((u8 *)state + 0x1c4);
    func_020923a4((u8 *)state + 0x1c4);
    FIELD(s32, state, 0x74) = 0;
    func_020755bc(data_020f4e14);

    CheckedFS_InitFile(&file);
    if (CheckedFS_OpenFile(&file, data_ov012_021fe6b8)) {
        length = CheckedFS_GetFileLength(&file);
        FIELD(void *, state, 0x7c) =
            func_02002700(length, data_ov012_021fe6d4, 4, gHeapContext);
        FIELD(s32, state, 0x184) = func_020bf1f8(length, 0x18);
        FIELD(s32, state, 0x188) = 0;
        if (CheckedFS_ReadFile(&file, FIELD(void *, state, 0x7c), length) ==
            length) {
            func_020b4554(FIELD(void *, state, 0x7c), length);
            CheckedFS_CloseFile(&file);
        }
    }

    G3X_Init();
    allocation = Heap_Alloc(0x624, data_ov012_021fe6dc, 4, gHeapContext);
    if (allocation != 0) allocation = func_020774ac(allocation, 1, 2);
    FIELD(void *, state, 0x78) = allocation;

    allocation = Heap_Alloc(0x18, data_ov012_021fe6e4, 4, gHeapContext);
    if (allocation != 0) {
        allocation = func_02077ca0(allocation, data_020f4e18,
                                    FIELD(void *, state, 0x78), 0x611a,
                                    0x611b);
    }
    FIELD(void *, state, 0x154) = allocation;
    FIELD(s32, state, 0x18c) = 0;
    FIELD(s32, state, 0x190) = 0;
    func_ov012_021fd5ac(state);

    FIELD(s32, state, 0x6c) = 0x11;
    func_ov012_021fd004(0);
    GX_DispOn();
    GX_SetGraphicsMode(1, 0, 1);
    func_02092638(0, 1, 2, 3);
    FIELD(s32, state, 0x70) = 0x10;
    *(volatile u32 *)0x04001000 |= 0x10000;
    func_ov012_021fd020(0);
    func_ov012_021fd044(1);
    func_ov012_021fd080(1);
    *(volatile u32 *)0x04000540 = 2;
    intensity = FIELD(u32, state, 0x194);
    func_020b0300((u16)(intensity | (intensity << 5) | (intensity << 10)),
                  0x1f, 0x7fff, 0x3f, 0);
    *(volatile u32 *)0x040004c4 = 0;
    *(volatile u32 *)0x04000580 = 0xbfff0000;

    FIELD(s32, state, 0x80) = 1;
    func_ov012_021fd0bc((u8 *)state + 0x80, 0, 0, 0x4000);
    func_ov012_021fd0c4((u8 *)state + 0x80, 0, 0, 0);
    func_ov012_021fd0d4((u8 *)state + 0x114, 0, 0x1000, (u32)-0x1000,
                         (u32)-0x1000, 0x1f, 0x1f, 0x1f);
    func_ov012_021fd63c(state);
    Scene_SetFlags03(state);
    sceneFields[0] = (s32)data_ov012_021fe4d0[0];
    sceneFields[1] = (s32)data_ov012_021fe4d0[1] - 0x48;
    func_ov012_021fd148((u8 *)state + 0x24, sceneFields[0], sceneFields[1], 0);
    return state;
}
