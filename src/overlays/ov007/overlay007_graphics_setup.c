#include "tingle/types.h"

/*
 * Overlay 7 graphics setup. This recovered routine configures the DS sub
 * display, loads one graphics triplet, transfers its components, and installs
 * identity affine transforms for two backgrounds.
 */

typedef struct Overlay007GraphicsResourceSet {
    void *first;
    void *second;
    void *third;
} Overlay007GraphicsResourceSet;

typedef struct Overlay007AffineMatrix {
    s32 first;
    s32 second;
    s32 third;
    s32 fourth;
} Overlay007AffineMatrix;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *gDisplayBrightnessPair;
extern void GXS_SetGraphicsMode(s32 mode);
extern void GX_SetBankForSubBG(s32 bank);
extern void func_020aea7c(s32 value);
extern void GraphicsResourceSet_Init(Overlay007GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(Overlay007GraphicsResourceSet *set,
                                     void *manager, s32 first, s32 second,
                                     s32 third);
extern void func_020b44e8(void);
extern void *GraphicsCharacterResource_GetUploadSize(void *resource);
extern void func_020b198c(void *destination, s32 offset, void *source);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern void *GraphicsPaletteResource_GetUploadSize(void *resource);
extern void func_020b1ff0(void *destination, s32 offset, void *source);
extern void GraphicsBgMapResource_UploadToSubBg(void *resource, s32 first, s32 second);
extern void GraphicsResourceSet_ReleaseHandles(Overlay007GraphicsResourceSet *set);
extern void func_020afd28(volatile void *registers,
                          const Overlay007AffineMatrix *matrix, s32 width,
                          s32 height, s32 centerX, s32 centerY);
extern void *DisplayBrightnessPair_GetScreen(void *context, s32 first, s32 second);
extern void DisplayBrightness_StartTransition(void *object, s32 first, s32 second, s32 third);
extern void GraphicsResourceSet_Destroy(Overlay007GraphicsResourceSet *set);
#ifdef __cplusplus
}
#endif

/*
 * Select sub graphics mode 5. Replace sub DISPCNT bits 8..12 with 0x11, set
 * sub-BG VRAM bank 4, call func_020aea7c(0x80), configure sub BG0CNT
 * 0x04001008 by preserving bits 0/1/6, setting 0x3C00, and selecting priority
 * 3, then clear word 0x04001010. Initialize a temporary resource set and load
 * IDs 0x9061..0x9063 through data_020f4e18. Synchronize; copy the first
 * resource's +0x24 destination from GraphicsCharacterResource_GetUploadSize via func_020b198c; synchronize
 * and copy the second resource's GraphicsPaletteResource_GetUploadSize data to its GraphicsBgResourceData_GetDecoded
 * destination via func_020b1ff0; synchronize, apply 0/0 to the third resource,
 * and finalize through GraphicsResourceSet_ReleaseHandles.
 *
 * Apply the identity 20.12 matrix {0x1000,0,0,0x1000} with zero extents/centers
 * to sub BG2/BG3 blocks 0x04001020/0x04001030. Set state +0xD4 to 2, call
 * DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1,2), pass its result to
 * DisplayBrightness_StartTransition(result,-16,0,10), destroy the temporary resource set, and
 * return no value. All MMIO destinations, resource IDs, and transfer ordering
 * are confirmed; helper-level SDK semantics remain partially unidentified.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay007_SetupGraphics(void *state)
{
    Overlay007GraphicsResourceSet set;
    Overlay007AffineMatrix matrix = {0x1000, 0, 0, 0x1000};
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
    volatile u16 *subBg0cnt = (volatile u16 *)0x04001008;
    void *destination;
    void *source;
    void *effect;

    GXS_SetGraphicsMode(5);
    *subDispcnt = (*subDispcnt & ~0x1f00) | 0x1100;
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    *subBg0cnt = (*subBg0cnt & 0x43) | 0x3c00;
    *subBg0cnt = (*subBg0cnt & ~3) | 3;
    *(volatile u32 *)0x04001010 = 0;

    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0x9061, 0x9062, 0x9063);
    func_020b44e8();
    destination = *(void **)((u8 *)set.first + 0x24);
    source = GraphicsCharacterResource_GetUploadSize(set.first);
    func_020b198c(destination, 0, source);
    func_020b44e8();
    destination = GraphicsBgResourceData_GetDecoded(set.second);
    source = GraphicsPaletteResource_GetUploadSize(set.second);
    func_020b1ff0(destination, 0, source);
    func_020b44e8();
    GraphicsBgMapResource_UploadToSubBg(set.third, 0, 0);
    GraphicsResourceSet_ReleaseHandles(&set);
    func_020afd28((volatile void *)0x04001020, &matrix, 0, 0, 0, 0);
    func_020afd28((volatile void *)0x04001030, &matrix, 0, 0, 0, 0);
    *(s32 *)((u8 *)state + 0xd4) = 2;
    effect = DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1, 2);
    DisplayBrightness_StartTransition(effect, -16, 0, 10);
    GraphicsResourceSet_Destroy(&set);
}
