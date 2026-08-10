#include "tingle/types.h"

/*
 * Overlay 41 resource cleanup and mode-transition helpers. These recovered
 * routines release graphics handles, rebuild the controller for mode one, and
 * read heap-owned binary resources through the game-file SDK wrapper.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void GraphicsResourceSet_ReleaseHandles(void *);
void func_02003e38(void *);
void __destroy_arr(void *, s32, s32, void *);
void func_02099fb0(void *);
void Heap_Free(void *);
void func_02058d28(void *);
void func_ov041_021ff6b8(void *);
void func_ov041_021fd01c(void *);
void func_ov041_021ff6f8(void *, void *);
void *DisplayBrightnessPair_GetScreen(void *, s32);
void DisplayBrightness_StartTransition(void *, s32, s32, s32);
void func_ov041_022013cc(void *, s32, s32, s32);
void Sound_Play(void *, s32, s32);
void GameFile_Init(void *);
s32 GameFile_Open(void *, const char *);
s32 GameFile_GetLength(void *);
void GameFile_Read(void *, void *, s32);
void GameFile_Close(void *);
void GameFile_Destroy(void *);
void OS_Halt(void);
void *func_02003e20(s32, const void *, s32, void *);
void func_ov041_021fce00(void *);
extern void *gSoundContext;
extern u8 gHeapContext;
extern u8 gDisplayBrightnessPair;
extern const char data_ov041_02205984[];
}

/*
 * Release the controller's twenty embedded graphics-resource sets, its two
 * optional heap buffers, and the object at offset 0x14. The owner pointers are
 * cleared; the function has no return value or direct hardware effects.
 */
extern "C" void func_ov041_021fdeb4(void *owner)
{
    static const u16 offsets[] = {
        0xfc, 0x108, 0x114, 0x120, 0x12c, 0x138, 0x144,
        0x9c, 0xa8, 0xb4, 0xc0, 0xcc, 0xd8, 0xe4,
        0x48, 0x54, 0x60, 0x6c, 0x78, 0x84
    };
    for (u32 i = 0; i < sizeof(offsets) / sizeof(offsets[0]); ++i)
        GraphicsResourceSet_ReleaseHandles((u8 *)owner + offsets[i]);

    if (FIELD(void *, owner, 0x170) != 0) {
        func_02003e38(FIELD(void *, owner, 0x170));
        FIELD(void *, owner, 0x170) = 0;
    }
    if (FIELD(void *, owner, 0x16c) != 0) {
        func_02003e38(FIELD(void *, owner, 0x16c));
        FIELD(void *, owner, 0x16c) = 0;
    }

    void *object = FIELD(void *, owner, 0x14);
    if (object != 0) {
        __destroy_arr((u8 *)object + 0x64, 4, 12, (void *)func_ov041_021fce00);
        func_02099fb0(object);
        Heap_Free(object);
        FIELD(void *, owner, 0x14) = 0;
    }
}

/*
 * Rebuild the graphics controller in mode one, restore its linked runtime
 * object, start two palette transitions, configure a motion effect, and play
 * sound 0xF8. The routine mutates owner state and display/audio SDK state.
 */
extern "C" void func_ov041_021fdfd0(void *owner)
{
    func_02058d28(gSoundContext);
    FIELD(s32, owner, 0x1f8) = 1;
    func_ov041_021ff6b8(FIELD(void *, owner, 0x10));
    func_ov041_021fdeb4(owner);
    FIELD(s32, owner, 0x1f4) = 1;
    func_ov041_021fd01c(owner);
    func_ov041_021ff6f8(FIELD(void *, owner, 0x10), FIELD(void *, owner, 0));
    FIELD(s32, owner, 0x1f8) = 0;

    void *transition = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0);
    DisplayBrightness_StartTransition(transition, 0x10, 0, 0x1e);
    transition = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
    DisplayBrightness_StartTransition(transition, 0x10, 0, 0x1e);
    func_ov041_022013cc(FIELD(void *, owner, 0x0c), 0x0e, 0xa000, 0x140000);
    Sound_Play(gSoundContext, 0xf8, 0);
}

/*
 * Open path, allocate its complete contents from the overlay heap, and store
 * the resulting pointer in slot index at owner+0x168. Failure to open invokes
 * the SDK halt routine. The function has no return value.
 */
extern "C" void func_ov041_021fe088(void *owner, s32 index, const char *path)
{
    u8 file[0x4c];
    GameFile_Init(file);
    if (GameFile_Open(file, path) == 0)
        OS_Halt();
    s32 length = GameFile_GetLength(file);
    void *buffer = func_02003e20(length, data_ov041_02205984, -4, &gHeapContext);
    FIELD(void *, owner, 0x168 + index * 4) = buffer;
    GameFile_Read(file, buffer, length);
    GameFile_Close(file);
    GameFile_Destroy(file);
}
