#include "tingle/types.h"

/* Overlay 28 randomized sprite-effect resource owner and frame renderer. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov028_021ff2d0[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern u32 genrand_int32(void);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02071f38(void *);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Clear(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void func_02091b6c(void *);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02092cc0(void *, void *, void *);
extern void func_02093998(void *);
extern void func_ov028_021fd668(void *, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs an effect owner around caller font +0. It initializes three
 * resource sets +8/+0x14/+0x20, manager +0x2C, PRNG state +0x54, and renderer
 * +4. Resource triples 0x60..0x62 and 0x4000..0x4002 are loaded, the PRNG is
 * seeded, manager IDs 0x7000/0x7006 are loaded, and a 0xEC-byte controller is
 * allocated/constructed at +0x50. That controller receives bounds 0x60,0x31,
 * 0x80,0x40 at +0xA4..+0xB0. Returns `state`; heap/UI SDK state changes.
 */
extern "C" void *func_ov028_021fd680(void *state, void *font)
{
    func_02071ea4((u8 *)state + 8);
    func_02071ea4((u8 *)state + 0x14);
    func_02071ea4((u8 *)state + 0x20);
    func_02092798((u8 *)state + 0x2c);
    FIELD(u32, state, 0x54) = 0;
    func_02091b6c((u8 *)state + 0x58);
    FIELD(void *, state, 0) = font;
    FIELD(void *, state, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    func_02071ee0((u8 *)state + 0x14, data_020f4e18[0], 0x60, 0x61, 0x62);
    func_02071ee0((u8 *)state + 0x20, data_020f4e18[0],
                  0x4000, 0x4001, 0x4002);
    FIELD(u32, state, 0x54) = genrand_int32();
    func_02092814((u8 *)state + 0x2c, 0x7000);
    func_02092814((u8 *)state + 0x2c, 0x7006);
    void *controller = Heap_Alloc(0xec, data_ov028_021ff2d0,
                                  4, gHeapContext);
    if (controller != 0)
        controller = func_02092cc0(controller, font,
                                   FIELD(void *, state, 0x2c));
    FIELD(void *, state, 0x50) = controller;
    func_ov028_021fd668(controller, 0x60, 0x31, 0x80, 0x40);
    return state;
}

/*
 * Virtually destroys controller +0x50, releases renderer +4, then tears down
 * manager +0x2C and resource sets +0x20/+0x14/+8. Returns `state` without
 * freeing it; owned heap and UI SDK resources are released.
 */
extern "C" void *func_ov028_021fd790(void *state)
{
    void *controller = FIELD(void *, state, 0x50);
    if (controller != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, controller, 0)[1](controller);
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 4));
    func_020927b8((u8 *)state + 0x2c);
    func_02071eb8((u8 *)state + 0x20);
    func_02071eb8((u8 *)state + 0x14);
    func_02071eb8((u8 *)state + 8);
    return state;
}

/*
 * Creates a kind-1 sprite using renderer +4/resources +0x20. PRNG state +0x54
 * chooses selector [0,4] and X/Y independently in [0x20,0x50], then configures
 * zero flags with trailing 0x100 and writes halfword +0x36=0x80. Returns void;
 * sprite SDK and PRNG state change.
 */
extern "C" void func_ov028_021fd7e0(void *state)
{
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4),
                                 (u8 *)state + 0x20, 1);
    s32 selector = func_020918f4((u8 *)state + 0x54, 5);
    s32 x = func_0209189c((u8 *)state + 0x54, 0x20, 0x50);
    s32 y = func_0209189c((u8 *)state + 0x54, 0x20, 0x50);
    func_02073e48(sprite, selector, x, y, 0, 0, 0x100);
    FIELD(u16, sprite, 0x36) = 0x80;
}

/*
 * Clears font +0 over the inferred 0xB0-high area, updates controller +0x50,
 * renders renderer +4, and advances resource set +8. Returns void and changes
 * font, controller, renderer, and resource SDK state.
 */
extern "C" void func_ov028_021fd86c(void *state)
{
    GraphicsSpriteCanvas_FillRect(FIELD(void *, state, 0), 0, 0, 0xff, 0xb0, 0);
    func_02093998(FIELD(void *, state, 0x50));
    GraphicsSpriteGroup_Clear(FIELD(void *, state, 4));
    func_02071f38((u8 *)state + 8);
}
