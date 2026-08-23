#include "tingle/types.h"
#include "tingle/system.h"

/*
 * Overlay 40 state and display setup helpers. These recovered routines arm a
 * timed presentation, select table-backed motion bounds, initialize the
 * sub-screen scene base, and construct two fixed arrays of vector records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *renderer, u8 orientation);
extern void func_0209a07c(void *object);
extern void func_0209a0d8(void *object, const void *first, const void *second,
                          const void *third, s32 value, s32 enabled);
extern void Sound_Play(void *sound, s32 parameter, s32 id);
extern s32 func_020be4e4(void);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void *func_ov040_021fce00(void *object);
extern void func_ov040_021ff8b0(void *scene, s32 duration);
extern void func_ov040_0220255c(s32, s32, s32, s32, s32);
extern void GXS_SetGraphicsMode(s32 mode);
extern void GX_SetBankForSubBG(s32 bank);
extern void func_020aea7c(s32 value);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void VecFx32Object_Init(void *object);
extern void VecFx32Object_Destroy(void *object);
extern void *VecFx32Object_InitCopy(void *destination, const void *source);
extern void func_ov040_02200118(void *object, const void *position);
extern void Sound_PlayDirectSequence(void *sound, s32 parameter, s32 id);
extern void GraphicsResourceSet_Init(void *set);
extern void GraphicsResourceSet_Load(void *set, void *archive, s32 first,
                                     s32 second, s32 third);
extern void GraphicsResourceSet_Destroy(void *set);
extern void func_020b44e8(void);
extern void *func_0207043c(void);
extern void func_020b198c(void *destination, s32 slot, void *source);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern void *func_02070888(void *resource);
extern void func_020b1ff0(void *destination, s32 slot, void *source);
extern void GraphicsBgMapResource_UploadToSubBg(void *resource, s32 first, s32 second);
extern void GraphicsResourceSet_ReleaseHandles(void *set);
extern void func_020afd28(volatile void *reg, const void *transform,
                          s32 a2, s32 a3, s32 a4, s32 a5);
extern void *DisplayBrightnessPair_GetScreen(void *resource, s32 index);
extern void DisplayBrightness_StartTransition(void *object, s32 x, s32 y, s32 value);
extern void *func_0209a208(void *scene, s32 first, s32 second, s32 third,
                           void *argument, s32 value);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *font);
extern void *func_ov040_02200108(void *destination, const void *source);
extern void func_ov040_02202244(void *scene, s32 mode);
extern u8 data_ov040_022038a0[];
extern const s32 data_ov040_022038d0[];
extern const s32 data_ov040_02203ea4[];
extern const s32 data_ov040_02203fbc[];
extern const s32 data_ov040_02204114[];
extern void *data_ov040_02203e3c[];
extern void *data_ov040_0220429c[];
extern void *gSoundContext;
extern void *gDebugFont;
extern void *data_020f4e18;
extern void *gDisplayBrightnessPair;
#ifdef __cplusplus
}
#endif

/* Signed 20.12 fixed-point multiplication with the retail rounding bias. */
static s32 state_fx_mul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/*
 * Advance the address-derived event schedule selected by scene +0xB34. Each
 * schedule entry contains an event code and delay; +0xBB8 is its index and
 * +0xBBC is the active countdown. Event codes configure motion fields
 * +0xADC/+0xAE0, presentation mode, audio, and the +0xAE4/+0xBD4 gates. Code 4
 * is a confirmed no-action entry, while code 9 inserts a 30-frame transition
 * to code 10. Returns no value; scene presentation and audio state may change.
 */
extern "C" void func_ov040_022022dc(void *scene)
{
    const s32 *schedule;
    s32 index;
    s32 event;

    if (FIELD(s32, scene, 0xbc0) > 0) {
        FIELD(s32, scene, 0xbc0)--;
        return;
    }
    if (FIELD(s32, scene, 0xae4) > 0) return;

    if (FIELD(s32, scene, 0xbb0) == 9) {
        func_ov040_02202244(scene, 0x11);
        FIELD(s32, scene, 0xbc0) = 0x1e;
        FIELD(s32, scene, 0xbb0) = 10;
        return;
    }
    if (--FIELD(s32, scene, 0xbbc) >= 0) return;

    func_ov040_02202244(scene, 0);
    schedule = data_ov040_02204114;
    if (FIELD(s32, scene, 0xb34) == 1)
        schedule = data_ov040_02203ea4;
    else if (FIELD(s32, scene, 0xb34) == 2)
        schedule = data_ov040_02203fbc;

    index = FIELD(s32, scene, 0xbb8);
    if (schedule[index * 2] < 0) {
        index = 0;
        FIELD(s32, scene, 0xbb8) = 0;
    }
    event = schedule[index * 2];

    if (event != 4) {
        FIELD(s32, scene, 0xbb0) = event;
        FIELD(s32, scene, 0xbb4) = schedule[index * 2 + 1] - 0x1e;
        if ((u32)event <= 2) {
            FIELD(s32, scene, 0xadc) = data_ov040_022038d0[event];
            FIELD(s32, scene, 0xae0) =
                state_fx_mul(FIELD(s32, scene, 0x848), 0x4800);
            func_ov040_02202244(scene, 3);
        } else if (event == 3) {
            s32 vector[4];
            s32 original = FIELD(s32, scene, 0x78);
            func_ov040_02200108(vector, FIELD(void *, scene, 0xb44));
            FIELD(s32, scene, 0xadc) = 0x80000 - vector[1];
            VecFx32Object_Destroy(vector);
            FIELD(s32, scene, 0xadc) =
                state_fx_mul(FIELD(s32, scene, 0xadc), 0x1333);
            if (original == FIELD(s32, scene, 0xadc))
                FIELD(s32, scene, 0xadc) += 0xa000;
            FIELD(s32, scene, 0xae0) =
                state_fx_mul(FIELD(s32, scene, 0x848), 0x4800);
            func_ov040_02202244(scene, 3);
        }

        if (event == 5) {
            func_ov040_02202244(scene, 4);
            FIELD(s32, scene, 0xae4) = 1;
            Sound_Play(gSoundContext, 0x12c, 0x0d);
        }
        if (event == 6) {
            func_ov040_02202244(scene, 6);
            FIELD(s32, scene, 0xae4) = 1;
            FIELD(s32, scene, 0xbd4) = 0;
        } else if (event == 7) {
            func_ov040_02202244(scene, 10);
            FIELD(s32, scene, 0xae4) = 1;
            FIELD(s32, scene, 0xbd4) = 4;
        }
    }

    FIELD(s32, scene, 0xbbc) = schedule[index * 2 + 1];
    FIELD(s32, scene, 0xbb8) = index + 1;
}

/*
 * Configure the +0xB44 presentation for the confirmed 0x103B resource triple,
 * clear its flag bit 1, play sounds 0x11 and 5, set the primary object's +0x7C
 * mode to 11, and arm a 110-frame interval. Returns no value; scene, renderer,
 * and audio state change.
 */
extern "C" void func_ov040_021ff42c(void *scene)
{
    void *primary = FIELD(void *, scene, 0x48);
    void *presentation = FIELD(void *, scene, 0xb44);
    const u8 *resource = (const u8 *)0x103b;
    FIELD(s32, primary, 0x34) = 0x14;
    FIELD(s32, primary, 0x38) = 6;
    FIELD(s32, scene, 0xb7c) = 0;
    FIELD(s32, scene, 0xb84) = 0;
    FIELD(s32, scene, 0xb94) = 1;
    FIELD(s32, scene, 0xb90) = 0;
    FIELD(s32, scene, 0xb78) = -15;
    func_0209a07c(presentation);
    func_0209a0d8(presentation, resource, resource + 1, resource + 2,
                  FIELD(s32, primary, 0), 1);
    void *renderer = FIELD(void *, presentation, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(renderer, 3);
    FIELD(u16, renderer, 0x24) &= (u16)~2;
    Sound_Play(gSoundContext, 300, 0x11);
    Sound_Play(gSoundContext, 300, 5);
    FIELD(s32, FIELD(void *, primary, 0x0c), 0x7c) = 11;
    func_ov040_021ff8b0(scene, 110);
}

/*
 * Configure the same presentation for the 0x103B resource, choosing state one
 * or two from signed word +0xB28, enabling renderer flag bit 1, and playing
 * sounds 0x13 and 5. A non-positive +0xB28 arms 2000 frames and primary mode
 * 7; otherwise it arms 180 frames with mode 11. Returns no value. The exact
 * fallback preserves the SDK division helper's secondary-register result used
 * to derive +0xB74; the portable expression records its inferred intent.
 */
extern "C" void func_ov040_021ff514(void *scene)
{
    void *primary = FIELD(void *, scene, 0x48);
    void *presentation = FIELD(void *, scene, 0xb44);
    const u8 *resource = (const u8 *)0x103b;
    FIELD(s32, scene, 0xb7c) = 0;
    FIELD(s32, scene, 0xb84) = 0;
    FIELD(s32, scene, 0xb94) = 1;
    FIELD(s32, scene, 0xb90) = FIELD(s32, scene, 0xb28) <= 0 ? 2 : 1;
    FIELD(s32, scene, 0xb74) = func_020befec(func_020be4e4(), 6) - 3;
    FIELD(s32, scene, 0xb78) = -17;
    func_0209a07c(presentation);
    func_0209a0d8(presentation, resource, resource + 1, resource + 2,
                  FIELD(s32, primary, 0), 1);
    void *renderer = FIELD(void *, presentation, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(renderer, 0);
    FIELD(u16, renderer, 0x24) |= 2;
    Sound_Play(gSoundContext, 300, 0x13);
    Sound_Play(gSoundContext, 300, 5);
    FIELD(s32, FIELD(void *, primary, 0x0c), 0x7c) = 11;
    if (FIELD(s32, scene, 0xb28) <= 0) {
        func_ov040_021ff8b0(scene, 2000);
        FIELD(s32, FIELD(void *, primary, 0x0c), 0x7c) = 7;
    } else {
        func_ov040_021ff8b0(scene, 180);
    }
}

/*
 * Arm scene word +0xAB4 with the requested duration and select state one, or
 * state two for durations of at least 2000. If +0xB10 references a renderer,
 * set its orientation to 0x13 and set bit 1 in its halfword flags at +0x24.
 * Returns no value; only scene and optional renderer state change.
 */
extern "C" void func_ov040_021ff8b0(void *scene, s32 duration)
{
    FIELD(s32, scene, 0xabc) = 1;
    FIELD(s32, scene, 0xab4) = duration;
    if (duration >= 2000) FIELD(s32, scene, 0xabc) = 2;
    if (FIELD(void *, scene, 0xb10) != 0) {
        void *renderer = FIELD(void *, FIELD(void *, scene, 0xb10), 0x0c);
        GraphicsSpriteState_SetAnimationIndex(renderer, 0x13);
        FIELD(u16, renderer, 0x24) |= 2;
    }
}

/*
 * Select a motion-bound pair for mode. Modes one and two use confirmed fields
 * in the overlay table at 0x022038A0; other modes index the pointer table at
 * 0x02203E3C. Reset +0x840/+0x850 and store the mode at +0x854. Returns no
 * value and changes only the supplied scene record.
 */
extern "C" void func_ov040_02202244(void *scene, s32 mode)
{
    const s32 *pair;
    if (mode == 1) pair = (const s32 *)(data_ov040_022038a0 + 0x94);
    else if (mode == 2) pair = (const s32 *)(data_ov040_022038a0 + 0x7c);
    else pair = (const s32 *)data_ov040_02203e3c[mode];
    FIELD(s32, scene, 0x854) = mode;
    FIELD(s32, scene, 0x850) = 0;
    FIELD(s32, scene, 0x840) = 0;
    FIELD(s32, scene, 0x84c) = pair[0];
    FIELD(s32, scene, 0x844) = pair[1];
}

/*
 * Initialize the overlay's base scene and sub-engine display configuration.
 * Stores the vtable at +0 and argument at +0x48, selects sub BG VRAM and BG0,
 * clears sub BG0 scroll registers, and sets +0x50. Returns the scene. This
 * writes Nintendo DS display registers at 0x04001000 and 0x04001008.
 */
extern "C" void *func_ov040_02202590(void *scene, void *argument)
{
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;
    volatile u16 *subBg0 = (volatile u16 *)0x04001008;
    func_ov040_021fce00(scene);
    FIELD(void *, scene, 0) = data_ov040_0220429c;
    FIELD(void *, scene, 0x48) = argument;
    GXS_SetGraphicsMode(0);
    *subDisplay = (*subDisplay & ~0x1f00) | 0x1100;
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    func_ov040_0220255c(0, 0, 0x1c, 0, 1);
    *subBg0 = (*subBg0 & ~3) | 3;
    *(volatile u32 *)((u8 *)subBg0 + 8) = 0;
    FIELD(s32, scene, 0x50) = 1;
    return scene;
}

/*
 * Construct 0x50 vector records of size 0x10 at +4 and another 0x50 at
 * +0xAA4, then clear the 0x50 pointer slots at +0x824. The second and third
 * incoming arguments are unused. Returns the original owner pointer.
 */
extern "C" void *func_ov040_02202ea4(void *owner, s32 unused1, s32 unused2,
                                      s32 arrayCookie)
{
    (void)unused1;
    (void)unused2;
    __construct_array((u8 *)owner + 4, 0x50, 0x10, VecFx32Object_Init,
                      VecFx32Object_Destroy);
    __construct_array((u8 *)owner + 0xaa4, 0x50, 0x10, VecFx32Object_Init,
                      VecFx32Object_Destroy);
    (void)arrayCookie;
    for (s32 index = 0x4f; index >= 0; index--)
        FIELD(void *, owner, 0x824 + index * 4) = 0;
    return owner;
}

typedef void (*Overlay040ObjectPlace)(void *scene, void *object, s32 x, s32 y,
                                      s32 zero, s32 orientation);

/* Create one object from a consecutive resource triple and place it via vtable. */
static void *create_sub_object(void *scene, s32 resource, void *argument,
                               s32 x, s32 y, s32 orientation)
{
    void *object = func_0209a208(scene, resource, resource + 1, resource + 2,
                                 argument, 2);
    Overlay040ObjectPlace place =
        *(Overlay040ObjectPlace *)FIELD(void *, scene, 0);
    place(scene, object, x, y, 0, orientation);
    return object;
}

/*
 * Configure sub-screen graphics and BG0, load resources 0x9064..0x9066,
 * program two affine registers, configure data_020F4DC8, and create six
 * objects at +0x58..+0x6C from triples 0x13C3 and 0x13C6. Finally initialize
 * the debug-font halfword and pending-orientation fields +0x70..+0x84.
 * `argument` is passed unchanged to each object factory. Returns no value;
 * graphics registers, resources, objects, and debug-font state are modified.
 */
extern "C" void func_ov040_02202640(void *scene, void *argument)
{
    u32 resources[3];
    s32 transform[4] = {0x1000, 0, 0, 0x1000};

    GXS_SetGraphicsMode(0);
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1100;
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    func_ov040_0220255c(0, 0, 0x1c, 0, 1);
    *(volatile u16 *)0x04001008 =
        (*(volatile u16 *)0x04001008 & (u16)~3) | 3;
    *(volatile u16 *)0x04001010 = 0;

    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18, 0x9064, 0x9065, 0x9066);
    func_020b44e8();
    func_020b198c(FIELD(void *, (void *)resources[0], 0x24), 0,
                  func_0207043c());
    func_020b44e8();
    func_020b1ff0(GraphicsBgResourceData_GetDecoded((void *)resources[1]), 0,
                  func_02070888((void *)resources[1]));
    func_020b44e8();
    GraphicsBgMapResource_UploadToSubBg((void *)resources[2], 0, 0);
    func_020b44e8();
    GraphicsResourceSet_ReleaseHandles(resources);

    func_020afd28((volatile void *)0x04001020, transform, 0, 0, 0, 0);
    func_020afd28((volatile void *)0x04001030, transform, 0, 0, 0, 0);
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1), -0x10, 0, 10);

    FIELD(void *, scene, 0x58) =
        create_sub_object(scene, 0x13c3, argument, 0xdc000, 0x5f000, 0);
    FIELD(void *, scene, 0x5c) =
        create_sub_object(scene, 0x13c3, argument, 0x1c000, 0x5f000, 3);
    FIELD(void *, scene, 0x60) =
        create_sub_object(scene, 0x13c3, argument, 0x80000, 0xab000, 0);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x60), 0x0c), 6);
    FIELD(void *, scene, 0x64) =
        create_sub_object(scene, 0x13c6, argument, 0x80000, 0x0f000, 2);
    FIELD(void *, scene, 0x68) =
        create_sub_object(scene, 0x13c6, argument, 0x80000, 0x70000, 5);
    FIELD(void *, scene, 0x6c) =
        create_sub_object(scene, 0x13c6, argument, 0x80000, 0x60000, 6);

    FIELD(s16, GraphicsSpriteRenderer_GetObjectPaletteAddress(gDebugFont), 8) = 0x3ff;
    FIELD(s32, scene, 0x70) = -1;
    FIELD(s32, scene, 0x74) = -1;
    FIELD(s32, scene, 0x78) = -1;
    FIELD(s32, scene, 0x7c) = -1;
    FIELD(s32, scene, 0x80) = 0xa0;
    FIELD(s32, scene, 0x84) = -1;
    FIELD(s32, scene, 0x50) = 0;
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Advance the +0xB44 presentation toward orientation 6 and react when its
 * renderer completion bit becomes set. With +0xB28 exhausted it configures
 * resource triple 0x1001/0x1007/0x1008, updates nested fields +0x78/+0x7C,
 * and plays sounds 1 and 3; otherwise it configures 0x1001/0x100F/0x1010 and
 * arms +0xB9C. Before completion, `position` is advanced using +0xB74/+0xB78,
 * bounced at Y=0xC0000, and clamped to X=0x10000..0xF0000. Returns no value;
 * scene, position, renderer, presentation, and audio state may change.
 */
extern "C" void func_ov040_021ff630(void *scene, void *position)
{
    void *presentation = FIELD(void *, scene, 0xb44);
    void *renderer = FIELD(void *, presentation, 0x0c);

    if (FIELD(s32, scene, 0xb94) < 0x16) {
        s32 phase = ++FIELD(s32, scene, 0xb94);
        if (phase == 0x0b) {
            GraphicsSpriteState_SetAnimationIndex(renderer, 1);
        } else if (phase == 0x16) {
            GraphicsSpriteState_SetAnimationIndex(renderer, 2);
            Sound_Play(gSoundContext, 0x12c, 5);
        }
    }

    if (FIELD(u8, renderer, 0x38) == 6) {
        if ((FIELD(u16, renderer, 0x24) & 1) == 0) return;
        FIELD(s32, scene, 0xb94) = 0;
        void *primary = FIELD(void *, scene, 0x48);
        void *factoryValue = FIELD(void *, primary, 0);
        func_0209a07c(presentation);
        if (FIELD(s32, scene, 0xb28) <= 0) {
            FIELD(s32, scene, 0xb7c) = -1;
            const u8 *resource = (const u8 *)0x1007;
            func_0209a0d8(presentation, resource, resource - 6, resource + 1,
                          (s32)factoryValue, 1);
            GraphicsSpriteState_SetAnimationIndex(renderer, 2);
            FIELD(u16, renderer, 0x24) |= 2;
            void *nested = FIELD(void *, primary, 0x0c);
            FIELD(s32, nested, 0x78) = 8;
            FIELD(s32, nested, 0x7c) = 7;
            Sound_Play(gSoundContext, 0x12c, 1);
            Sound_Play(gSoundContext, 0x12c, 3);
        } else {
            const u8 *resource = (const u8 *)0x100f;
            func_0209a0d8(presentation, resource, resource - 0x0e,
                          resource + 1, (s32)factoryValue, 2);
            GraphicsSpriteState_SetAnimationIndex(renderer, 0x1d);
            FIELD(u16, renderer, 0x24) |= 2;
            FIELD(s32, scene, 0xb9c) = 0x50;
        }
        return;
    }

    s32 oldCounter = FIELD(s32, scene, 0xb78)++;
    FIELD(s32, position, 8) += (oldCounter >> 1) * 0x1000;
    FIELD(s32, position, 4) += FIELD(s32, scene, 0xb74) * 0x1000;
    if (FIELD(s32, position, 8) >= 0xc0000) {
        FIELD(s32, scene, 0xb94)++;
        FIELD(s32, position, 8) = 0xc0000;
        FIELD(s32, scene, 0xb74) /= 2;
        FIELD(s32, scene, 0xb78) = -6;
        if (FIELD(s32, scene, 0xb94) == 0x19) {
            GraphicsSpriteState_SetAnimationIndex(renderer, 6);
            FIELD(u16, renderer, 0x24) &= (u16)~2;
            FIELD(s32, scene, 0xb78) = 0;
        }
    }
    if (FIELD(s32, position, 4) > 0xf0000)
        FIELD(s32, position, 4) = 0xf0000;
    else if (FIELD(s32, position, 4) < 0x10000)
        FIELD(s32, position, 4) = 0x10000;
}

/* Replace the presentation's resource triple, orientation, and flag bit 1. */
static void set_presentation_state(void *scene, s32 resource, s32 orientation,
                                   s32 enabled, bool clearFlag)
{
    void *presentation = FIELD(void *, scene, 0xb44);
    void *renderer;
    const u8 *middle = (const u8 *)resource;
    func_0209a07c(presentation);
    func_0209a0d8(presentation, middle, middle + 1, middle + 2,
                  FIELD(s32, FIELD(void *, scene, 0x48), 0), enabled);
    renderer = FIELD(void *, presentation, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(renderer, (u8)orientation);
    if (clearFlag) FIELD(u16, renderer, 0x24) &= (u16)~2;
    else FIELD(u16, renderer, 0x24) |= 2;
}

/* Copy a temporary vector back through the presentation position interface. */
static void commit_presentation_position(void *scene, void *position)
{
    s32 copy[4];
    VecFx32Object_InitCopy(copy, position);
    func_ov040_02200118(FIELD(void *, scene, 0xb44), copy);
    VecFx32Object_Destroy(copy);
    VecFx32Object_Destroy(position);
}

/*
 * Update the interactive +0xB44 presentation. Held pad bits 0x10/0x20 move it
 * horizontally within X=0x10000..0xF0000 and select directional animations;
 * the +0xB7C state machine drives the triggered rise, waits, animation swaps,
 * optional 120-frame sequence, and return to idle. A nonzero +0xB94 instead
 * advances the bouncing path documented by func_ov040_021ff630. Finally the
 * +0xB9C counter flashes presentation flag bit 2. The three callback arguments
 * after `scene` are unused. Returns no value; scene, presentation, primary
 * object, sound, and renderer state may change.
 */
extern "C" void func_ov040_021ff900(void *scene, s32 unused1, s32 unused2,
                                      s32 unused3)
{
    void *presentation = FIELD(void *, scene, 0xb44);
    void *renderer = FIELD(void *, presentation, 0x0c);
    (void)unused1; (void)unused2; (void)unused3;

    if (FIELD(s32, scene, 0xb7c) == 0) {
        if (FIELD(s32, scene, 0xb94) == 0) {
            s32 movement = 0;
            u16 held = gSystemState.pads[0].held;
            if ((held & 0x30) == 0 && held == 0x40) {
                set_presentation_state(scene, 0x1013, 0x20, 1, true);
                FIELD(s32, scene, 0xb7c) = 1;
                FIELD(s32, scene, 0xb84) = 8;
                FIELD(s32, scene, 0xb78) = -18;
                Sound_Play(gSoundContext, 300, 0x10);
            }
            if (FIELD(s32, scene, 0xb7c) == 0) {
                if (held & 0x20) movement = -0x2000;
                else if (held & 0x10) movement = 0x2000;
                if (movement != 0) {
                    s32 direction = movement < 0 ? 2 : 1;
                    if (FIELD(s32, scene, 0xb84) != direction)
                        set_presentation_state(scene, 0x1017, direction == 2 ? 2 : 6, 1, false);
                    FIELD(s32, scene, 0xb84) = direction;
                    s32 position[4];
                    func_ov040_02200108(position, presentation);
                    FIELD(s32, position, 4) += movement;
                    if (FIELD(s32, position, 4) > 0xf0000) FIELD(s32, position, 4) = 0xf0000;
                    if (FIELD(s32, position, 4) < 0x10000) FIELD(s32, position, 4) = 0x10000;
                    commit_presentation_position(scene, position);
                } else if (FIELD(s32, scene, 0xb84) != 0) {
                    set_presentation_state(scene, 0x100f, 0x1d, 1, false);
                    FIELD(s32, scene, 0xb84) = 0;
                }
                FIELD(s32, FIELD(void *, scene, 0x48), 0x18) = 0;
                if (FIELD(s32, scene, 0xb88) == 1 && ++FIELD(s32, scene, 0xb8c) > 0x3c) {
                    FIELD(s32, scene, 0xb8c) = 0;
                    FIELD(s32, scene, 0xb88) = 0;
                }
            }
        } else {
            s32 position[4];
            func_ov040_02200108(position, presentation);
            if (FIELD(s32, scene, 0xb90) != 0) func_ov040_021ff630(scene, position);
            else {
                s32 old = FIELD(s32, scene, 0xb78)++;
                FIELD(s32, position, 8) += (old >> 1) * 0x1000;
                if (FIELD(s32, position, 8) > 0xc0000) {
                    FIELD(s32, position, 8) = 0xc0000;
                    FIELD(s32, scene, 0xb78) = -6;
                    if (++FIELD(s32, scene, 0xb94) > 2) {
                        FIELD(s32, scene, 0xb94) = 0;
                        set_presentation_state(scene, 0x100f, 0x1d, 2, false);
                        FIELD(s32, scene, 0xb9c) = 0x50;
                    }
                }
            }
            commit_presentation_position(scene, position);
        }
    }

    if (FIELD(s32, scene, 0xb7c) > 0) {
        s32 position[4];
        s32 state = FIELD(s32, scene, 0xb7c);
        func_ov040_02200108(position, presentation);
        if (state == 1) {
            if (++FIELD(s32, scene, 0xb78) == 0) {
                GraphicsSpriteState_SetAnimationIndex(renderer, 0x0d);
                FIELD(u16, renderer, 0x24) |= 2;
                FIELD(s32, scene, 0xb7c) = 2;
                FIELD(s32, scene, 0xb80) = 0;
            }
            FIELD(s32, position, 8) += (FIELD(s32, scene, 0xb78) >> 1) * 0x1000;
        } else if (state == 2) {
            FIELD(s32, scene, 0xb80)++;
            if (FIELD(s32, scene, 0xb88) != 0) FIELD(s32, scene, 0xb80) = 0x10;
            else if (FIELD(s32, scene, 0xb80) >= 0x11) {
                FIELD(s32, scene, 0xb7c) = 3; FIELD(s32, scene, 0xb80) = 0;
            }
        } else if (state == 3) {
            FIELD(s32, position, 8) += (++FIELD(s32, scene, 0xb78) >> 1) * 0x1000;
            if (FIELD(s32, position, 8) > 0xc0000) {
                FIELD(s32, position, 8) = 0xc0000;
                FIELD(s32, scene, 0xb7c) = 4; FIELD(s32, scene, 0xb80) = 0;
                if (FIELD(u8, renderer, 0x38) == 0x26) {
                    GraphicsSpriteState_SetAnimationIndex(renderer, 0x27); FIELD(u16, renderer, 0x24) &= (u16)~2;
                    Sound_Play(gSoundContext, 300, (func_020be4e4() & 1) ? 4 : 0);
                } else {
                    set_presentation_state(scene, 0x1009, 0x18, 1, true);
                    Sound_Play(gSoundContext, 0, 0x57); FIELD(s32, scene, 0xb80) = 0x28;
                }
                FIELD(s32, FIELD(void *, scene, 0x48), 0x1c) = 0;
            }
        } else if (state == 4 && ++FIELD(s32, scene, 0xb80) >= 0x32) {
            set_presentation_state(scene, 0x100f, 0x1d, 1, false);
            FIELD(s32, scene, 0xb7c) = (FIELD(s32, scene, 0xb30) && !FIELD(s32, scene, 0xb98)) ? 5 : 0;
            FIELD(s32, scene, 0xb80) = 0;
        } else if (state == 5) {
            FIELD(s32, scene, 0xb98) = 1;
            s32 timer = ++FIELD(s32, scene, 0xb80);
            if (timer == 0x78) {
                set_presentation_state(scene, 0x103b, 4, 1, true);
                FIELD(s32, FIELD(void *, FIELD(void *, scene, 0x48), 0x0c), 0x78) = 7;
                Sound_PlayDirectSequence(gSoundContext, 0x32, 0x7f);
            } else if (timer > 0x78 && (FIELD(u16, renderer, 0x24) & 1)) {
                GraphicsSpriteState_SetAnimationIndex(renderer, 5); FIELD(u16, renderer, 0x24) |= 2;
                FIELD(s32, scene, 0xb7c) = 6; FIELD(s32, scene, 0xb80) = 0;
            }
        } else if (state == 6 && ++FIELD(s32, scene, 0xb80) >= 0x28) {
            FIELD(s32, scene, 0xb7c) = 0; FIELD(s32, scene, 0xb80) = 0;
        }
        commit_presentation_position(scene, position);
    }
    if (FIELD(s32, scene, 0xb9c) > 0) {
        s32 flash = --FIELD(s32, scene, 0xb9c);
        if (flash & 2) FIELD(u16, presentation, 0x42) |= 4;
        else FIELD(u16, presentation, 0x42) &= (u16)~4;
    }
}
