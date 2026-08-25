#include "tingle/types.h"

/* Overlay 30 board-screen resource loading, labels, and window configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern void *data_020f4e14[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov030_021fe3e0(s32, s32, s32, s32, s32);
extern void func_ov030_021fe414(s32, s32, s32, s32, s32);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_020b44e8(void);
extern void GraphicsResourceSet_ApplyToMainBg(void *, s32, u32);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern void GraphicsSpriteRenderer_SetTextGridObjectMode(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configures main BG0/BG1, then loads either resource family 0xB102..0xB105 or
 * 0xB106..0xB109 according to mode +0x390. The first triple is uploaded to BG0
 * at 0x6000; the second is uploaded to BG1 at 0x4000 after formatting three
 * 16-halfword labels at +0x2CC/+0x2EC/+0x30C. Mode 1 uses values 5000/500/10,
 * while the other mode uses 10000/1000/100. It initializes offsets +0x338/
 * +0x33C to 16, selects renderer bank 2, sets main display mode bits to 4,
 * enables window masks 0x1F/0x3E, sets scene display bits 0 and 1, and destroys
 * the temporary resources. Returns void; resource, scene, and display MMIO state
 * change through SDK helpers and direct Nintendo DS register writes.
 */
extern "C" void func_ov030_021fe554(void *scene)
{
    func_ov030_021fe3e0(0, 1, 0x18, 4, 1);
    func_ov030_021fe414(2, 1, 0x1a, 4, 1);
    u32 resources[3];
    GraphicsResourceSet_Init(resources);

    if (FIELD(s32, scene, 0x390) == 1)
        GraphicsResourceSet_Load(resources, data_020f4e18[0],
                                 0xb102, 0xb103, 0xb105);
    else
        GraphicsResourceSet_Load(resources, data_020f4e18[0],
                                 0xb106, 0xb107, 0xb109);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 0, 0x6000);

    if (FIELD(s32, scene, 0x390) == 1) {
        GraphicsResourceSet_Load(resources, data_020f4e18[0],
                                 0xb102, 0xb103, 0xb104);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x2cc, 5000, 0xff676980, 0);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x2ec, 500, 0xff676980, 0);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x30c, 10, 0xff676980, 0);
    } else {
        GraphicsResourceSet_Load(resources, data_020f4e18[0],
                                 0xb106, 0xb107, 0xb108);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x2cc, 10000, 0xff676980, 0);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x2ec, 1000, 0xff676980, 0);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x30c, 100, 0xff676980, 0);
    }
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 1, 0x4000);
    FIELD(s32, scene, 0x33c) = 0x10;
    FIELD(s32, scene, 0x338) = 0x10;
    GraphicsSpriteRenderer_SetTextGridObjectMode(data_020f4e14[0], 2);

    volatile u32 *dispCnt = (volatile u32 *)0x04000000;
    *dispCnt = (*dispCnt & ~0xe000) | 0x8000;
    volatile u16 *winIn = (volatile u16 *)0x0400004a;
    *winIn = (*winIn & ~0x3f00) | 0x1f00;
    *winIn = (*winIn & ~0x003f) | 0x003e;
    FIELD(u32, scene, 0x48) |= 3;
    GraphicsResourceSet_Destroy(resources);
}
