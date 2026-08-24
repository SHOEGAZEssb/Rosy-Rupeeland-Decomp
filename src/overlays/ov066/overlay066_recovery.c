#include "tingle/types.h"

/*
 * Overlay 66 owns a touch-driven particle presentation. A controller retains
 * up to one hundred circular slots, resolves their pairwise overlap, clamps
 * them to an editable rectangle, and submits the shared sprite group.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov066_02210efc[], data_ov066_02210f20[];
extern const u8 data_ov066_02210f4c[], data_ov066_02210fc0[];
extern const char data_ov066_02210f54[], data_ov066_02210f64[];
extern const char data_ov066_02210f74[], data_ov066_02210f88[];
extern const char data_ov066_02210f98[], data_ov066_02210fb4[];
extern void *data_020f4e14[], *data_020f4e18[], *data_021052fc;
extern void *gDebugFont[], *gTouchPanelManager;
extern u8 gHeapContext[], gSystemState[];
extern u32 gFrameVCount;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Scene_Init(void *);
extern void *Scene_Destroy(void *);
extern void Scene_SetFlags03(void *);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void DisplayBrightness_StartMainTransition(s32, s32, s32);
extern void DisplayBrightness_StartSubTransition(s32, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32, u32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_Printf(void *, s32, s32, const char *, ...);
extern void GraphicsSpriteCanvas_DrawLine(void *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteCanvas_NoOp(void *);
extern void TouchPanelManager_GetPoint(void *);
extern void GamePhaseState_UpdateRenderHelpers(void *);
extern void GamePhaseAreaScene_Update(void *);
extern void *GraphicsSpriteGroup_CreateState(void *, void *, void *, void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteGroup_ReleaseState(void *, void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteGroup_Clear(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern void func_02071b94(void *, s32, s32, s32, void **, void **, void **);
extern void func_02071bdc(void *, void *);
extern void func_02071c38(void *, void *);
extern void func_02071c94(void *, void *);
extern s32 func_020beb18(s32);
extern s32 func_020be8c0(s32, s32);
extern s32 func_020beb6c(s32, s32);
extern s32 func_020beae4(s32);
extern s32 Fx32Vector2_Magnitude(s32, s32);
extern s32 func_020adc90(s32, s32);
#ifdef __cplusplus
}
#endif

void *func_ov066_0220fe40(void *, s32, s32);
void *func_ov066_022107ac(void *, s32, s32, s32, s32, s32, s32, s32);
void *func_ov066_02210958(void *, s32, s32, s32, s32);
void *func_ov066_0221096c(void *);
void *func_ov066_02210514(void *, const void *);
void *func_ov066_02210458(void *, const void *, s32, void *,
                          void *, void *, void *, s32);
void *func_ov066_02210e54(void *);
void *func_ov066_02210e70(void *, const void *, const void *);
s32 func_ov066_0220fee0(void *);
void func_ov066_02210a9c(void *);
s32 func_ov066_02210a00(void *, const void *, s32, s32);
void func_ov066_02210550(void *, const void *, s32, s32);
void func_ov066_02210b20(void *, void *, void *);

/* Multiply two signed Q12 values using the retail rounding convention. */
static s32 fxMul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Narrow a Q12 position to the signed pixel range used by the sprite state. */
static s32 Overlay066_PositionPixel(s32 value)
{
    return (s32)((u32)value << 4) >> 16;
}

/* Select or clear the DS two-dimensional object mapping control bit. */
void func_ov066_0220fd20(s32 enabled)
{
    volatile u16 *control = (volatile u16 *)0x04000304;
    *control = (u16)((*control & 0x7fff) | (enabled << 15));
}

/* Initialize a compact vtable-backed pair of signed coordinates. */
void *func_ov066_0220fe40(void *record, s32 x, s32 y)
{
    FIELD(const void *, record, 0) = data_ov066_02210efc;
    FIELD(s32, record, 4) = x;
    FIELD(s32, record, 8) = y;
    return record;
}

/* Construct the scene, particle controller, display mode, and fade state. */
void *func_ov066_0220fd3c(void *scene, s32 debugEnabled)
{
    s32 i;
    void *controller;
    Scene_Init(scene);
    FIELD(const void *, scene, 0) = data_ov066_02210f20;
    func_ov066_0220fe40((u8 *)scene + 0x30, 0, 0);
    FIELD(s32, scene, 0x3c) = debugEnabled;
    func_ov066_0220fd20(0);
    GX_SetGraphicsMode(1, 0, 0);
    controller = Heap_Alloc(0x1bc, data_ov066_02210f4c, 4, gHeapContext);
    if (controller)
        controller = func_ov066_022107ac(controller, 0x1714, 0x1715,
            0x1716, 0x40, 0x28, 0xc0, 0xb4);
    FIELD(void *, scene, 0x24) = controller;
    for (i = 0; i < 10; ++i) func_ov066_0220fee0(scene);
    FIELD(s32, scene, 0x28) = 1;
    FIELD(s32, scene, 0x2c) = 0;
    DisplayBrightness_StartMainTransition(1, 0x10, 0);
    DisplayBrightness_StartSubTransition(1, 0x10);
    if (debugEnabled) Scene_SetFlags03(scene);
    return scene;
}

/* Preserve the scene's intentional no-op virtual callback. */
void func_ov066_0220fe54(void *scene) { (void)scene; }

/* Destroy the controller and base scene without freeing scene storage. */
void *func_ov066_0220fe58(void *scene)
{
    void *controller;
    FIELD(const void *, scene, 0) = data_ov066_02210f20;
    controller = FIELD(void *, scene, 0x24);
    if (controller) {
        func_ov066_0221096c(controller);
        Heap_Free(controller);
    }
    Scene_Destroy(scene);
    return scene;
}

/* Destroy the controller and base scene, then free scene storage. */
void *func_ov066_0220fe98(void *scene)
{
    func_ov066_0220fe58(scene);
    Heap_Free(scene);
    return scene;
}

/* Add one particle with randomized position, radius, and animation. */
s32 func_ov066_0220fee0(void *scene)
{
    u8 position[12];
    s32 x = (s32)(func_020bf1f8(genrand_int32(), 0x9a) >> 32) + 0x32;
    s32 y = (s32)(func_020bf1f8(genrand_int32(), 0x14) >> 32) + 0x28;
    s32 radius = (s32)(func_020bf1f8(genrand_int32(), 7) >> 32) + 4;
    func_ov066_0220fe40(position, x << 12, y << 12);
    return func_ov066_02210a00(FIELD(void *, scene, 0x24),
                                position, radius << 12, 0);
}

/* Move both edges of the editable rectangle from held directional input. */
static void Overlay066_AdjustBounds(void *controller, u16 held)
{
    if (held & 0x20) {
        FIELD(s32, controller, 0x194) -= 0x6000;
        FIELD(s32, controller, 0x19c) -= 0x6000;
    } else if (held & 0x10) {
        FIELD(s32, controller, 0x194) += 0x6000;
        FIELD(s32, controller, 0x19c) += 0x6000;
    }
    if (held & 0x40) {
        FIELD(s32, controller, 0x198) -= 0x6000;
        FIELD(s32, controller, 0x1a0) -= 0x6000;
    } else if (held & 0x80) {
        FIELD(s32, controller, 0x198) += 0x6000;
        FIELD(s32, controller, 0x1a0) += 0x6000;
    }
}

/* Clip the editable rectangle and draw each on-screen diagnostic edge. */
static void Overlay066_DrawBounds(void *controller)
{
    s32 left = FIELD(s32, controller, 0x194);
    s32 top = FIELD(s32, controller, 0x198);
    s32 right = FIELD(s32, controller, 0x19c);
    s32 bottom = FIELD(s32, controller, 0x1a0);
    u16 clipped = 0;
    if (left < 0) { left = 0; clipped |= 1; }
    if (right > 0xff000) { right = 0xff000; clipped |= 2; }
    if (top < 0) { top = 0; clipped |= 4; }
    if (bottom > 0xbf000) { bottom = 0xbf000; clipped |= 8; }
    if (left >= right || top >= bottom) return;
    if (!(clipped & 4)) GraphicsSpriteCanvas_DrawLine(data_020f4e14[0],
        left >> 12, top >> 12, right >> 12, top >> 12, 2);
    if (!(clipped & 1)) GraphicsSpriteCanvas_DrawLine(data_020f4e14[0],
        left >> 12, top >> 12, left >> 12, bottom >> 12, 2);
    if (!(clipped & 8)) GraphicsSpriteCanvas_DrawLine(data_020f4e14[0],
        left >> 12, bottom >> 12, right >> 12, bottom >> 12, 2);
    if (!(clipped & 2)) GraphicsSpriteCanvas_DrawLine(data_020f4e14[0],
        right >> 12, top >> 12, right >> 12, bottom >> 12, 2);
}

/* Process input/touch motion, update particles, and render debug diagnostics. */
s32 func_ov066_0220ff60(void *scene)
{
    u16 pressed, held;
    void *controller = FIELD(void *, scene, 0x24);
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont[0]);
    if (FIELD(s32, scene, 0x3c)) {
        void *runtime = data_021052fc;
        ((void (**)(void *))FIELD(void *, runtime, 0))[2](runtime);
    }
    pressed = FIELD(u16, gSystemState, 6);
    if (pressed & 0x800) FIELD(s32, scene, 0x28) ^= 1;
    else if (pressed & 2) {
        if (scene) ((void (**)(void *))FIELD(void *, scene, 0))[1](scene);
        return 1;
    } else if (pressed & 0x400) GraphicsSpriteCanvas_NoOp(data_020f4e14[0]);
    else if (pressed & 1) func_ov066_0220fee0(scene);
    held = FIELD(u16, gSystemState, 4);
    Overlay066_AdjustBounds(controller, held);
    if (FIELD(s32, scene, 0x28)) {
        if (FIELD(u16, gTouchPanelManager, 0x44) == 1) {
            u8 point[12];
            TouchPanelManager_GetPoint(point);
            if (FIELD(s32, scene, 0x2c)) {
                s32 dx = FIELD(s32, point, 4) - FIELD(s32, scene, 0x34);
                s32 dy = FIELD(s32, point, 8) - FIELD(s32, scene, 0x38);
                FIELD(s32, controller, 0x194) += dx << 12;
                FIELD(s32, controller, 0x19c) += dx << 12;
                FIELD(s32, controller, 0x198) += dy << 12;
                FIELD(s32, controller, 0x1a0) += dy << 12;
            }
            FIELD(s32, scene, 0x2c) = 1;
            FIELD(s32, scene, 0x34) = FIELD(s32, point, 4);
            FIELD(s32, scene, 0x38) = FIELD(s32, point, 8);
        } else FIELD(s32, scene, 0x2c) = 0;
        func_ov066_02210a9c(controller);
    } else FIELD(s32, scene, 0x2c) = 0;
    Overlay066_DrawBounds(controller);
    GraphicsSpriteRenderer_Printf(data_020f4e14[0], 1, 1,
                                   data_ov066_02210f54, gFrameVCount);
    GraphicsSpriteRenderer_Printf(data_020f4e14[0], 1, 2,
        data_ov066_02210f64, FIELD(s32, controller, 0x190));
    GraphicsSpriteRenderer_Printf(gDebugFont[0], 1, 1, data_ov066_02210f74);
    GraphicsSpriteRenderer_Printf(gDebugFont[0], 1, 2, data_ov066_02210f88);
    GraphicsSpriteRenderer_Printf(gDebugFont[0], 1, 3, data_ov066_02210f98);
    GraphicsSpriteRenderer_Printf(gDebugFont[0], 1, 4, data_ov066_02210fb4);
    return 0;
}

/* Advance shared phase render helpers and the current area scene. */
s32 func_ov066_02210410(void *scene)
{
    (void)scene;
    GamePhaseState_UpdateRenderHelpers((u8 *)data_021052fc + 0x24);
    GamePhaseAreaScene_Update(FIELD(void *, data_021052fc, 0x2fb8));
    return 0;
}

/* Free one caller-owned allocation and return its former identity. */
void *func_ov066_02210444(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}

/* Copy the two coordinate fields from a shared position record. */
void *func_ov066_02210514(void *slot, const void *position)
{
    FIELD(const void *, slot, 0) = data_ov066_02210efc;
    FIELD(s32, slot, 4) = FIELD(s32, position, 4);
    FIELD(s32, slot, 8) = FIELD(s32, position, 8);
    return slot;
}

/* Construct one particle slot and its hidden graphics sprite state. */
void *func_ov066_02210458(void *slot, const void *position, s32 radius,
    void *group, void *resourceA, void *resourceB, void *resourceC, s32 animation)
{
    void *sprite;
    func_ov066_02210514(slot, position);
    func_ov066_0220fe40((u8 *)slot + 0xc, 0, 0);
    FIELD(s32, slot, 0x18) = radius;
    FIELD(s32, slot, 0x1c) = fxMul(fxMul(radius, radius), 0x3244);
    sprite = GraphicsSpriteGroup_CreateState(group, resourceA, resourceB,
                                              resourceC, 1);
    FIELD(void *, slot, 0x20) = sprite;
    GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
    FIELD(u16, sprite, 0x24) |= 0xa;
    FIELD(u8, sprite, 0x3a) = 0;
    return slot;
}

/* Release the graphics state owned by one particle slot. */
void *func_ov066_02210534(void *slot)
{
    void *sprite = FIELD(void *, slot, 0x20);
    GraphicsSpriteGroup_ReleaseState(FIELD(void *, sprite, 0), sprite);
    return slot;
}

/* Integrate a particle inside bounds and publish or hide its sprite position. */
void func_ov066_02210550(void *slot, const void *bounds, s32 damping, s32 attraction)
{
    s32 radius = FIELD(s32, slot, 0x18);
    s32 x = FIELD(s32, slot, 4), y = FIELD(s32, slot, 8);
    s32 vx = FIELD(s32, slot, 0x10), vy = FIELD(s32, slot, 0x14) + 0x333;
    s32 left = FIELD(s32, bounds, 0) + radius;
    s32 top = FIELD(s32, bounds, 4) + radius;
    s32 right = FIELD(s32, bounds, 8) - radius;
    s32 bottom = FIELD(s32, bounds, 0xc) - radius;
    if (x < left) {
        if (vx < 0) vx = fxMul(vx, -damping);
        x += fxMul(attraction, left - x);
    }
    if (x > right) {
        if (vx > 0) vx = fxMul(vx, -damping);
        x += fxMul(attraction, right - x);
    }
    if (y < top) {
        if (vy < 0) vy = fxMul(vy, -damping);
        y += fxMul(attraction, top - y);
    }
    if (y > bottom) {
        if (vy > 0) vy = fxMul(vy, -damping);
        y += fxMul(attraction, bottom - y);
    }
    FIELD(s32, slot, 0x10) = vx;
    FIELD(s32, slot, 0x14) = vy;
    FIELD(s32, slot, 4) = x + vx;
    FIELD(s32, slot, 8) = y + vy;
    x = Overlay066_PositionPixel(FIELD(s32, slot, 4));
    y = Overlay066_PositionPixel(FIELD(s32, slot, 8));
    if (x >= -16 && x < 272 && y >= -16 && y < 208) {
        FIELD(s16, FIELD(void *, slot, 0x20), 0x2c) = (s16)x;
        FIELD(s16, FIELD(void *, slot, 0x20), 0x2e) = (s16)y;
        FIELD(u16, FIELD(void *, slot, 0x20), 0x24) &= ~8u;
    } else FIELD(u16, FIELD(void *, slot, 0x20), 0x24) |= 8;
}

/* Convert an integer screen bound through the overlay's fixed-point helpers. */
static s32 Overlay066_ConvertBound(s32 value)
{
    s32 angle = func_020beb18(value << 12);
    s32 transformed = value > 0 ? func_020be8c0(0x3f000000, angle)
                                : func_020beb6c(angle, 0x3f000000);
    return func_020beae4(transformed);
}

/* Construct the controller bounds, pointer pool, sprite group, and resources. */
void *func_ov066_022107ac(void *controller, s32 resourceA, s32 resourceB,
    s32 resourceC, s32 left, s32 top, s32 right, s32 bottom)
{
    s32 i;
    FIELD(s32, controller, 0x190) = 0;
    FIELD(s32, controller, 0x1b4) = 0xb33;
    FIELD(s32, controller, 0x1b8) = 0x1800 - 0xb33;
    func_ov066_02210958((u8 *)controller + 0x194,
        Overlay066_ConvertBound(left), Overlay066_ConvertBound(top),
        Overlay066_ConvertBound(right), Overlay066_ConvertBound(bottom));
    for (i = 0; i < 100; ++i) FIELD(void *, controller, i * 4) = 0;
    FIELD(void *, controller, 0x1a4) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    func_02071b94(data_020f4e18[0], resourceA, resourceB, resourceC,
        (void **)((u8 *)controller + 0x1a8),
        (void **)((u8 *)controller + 0x1ac),
        (void **)((u8 *)controller + 0x1b0));
    return controller;
}

/* Store four fixed-point bounds in their shared controller record. */
void *func_ov066_02210958(void *bounds, s32 left, s32 top, s32 right, s32 bottom)
{
    FIELD(s32, bounds, 0) = left;
    FIELD(s32, bounds, 4) = top;
    FIELD(s32, bounds, 8) = right;
    FIELD(s32, bounds, 0xc) = bottom;
    return bounds;
}

/* Destroy every particle, the shared sprite group, and loaded resources. */
void *func_ov066_0221096c(void *controller)
{
    s32 i;
    for (i = 0; i < FIELD(s32, controller, 0x190); ++i) {
        void *slot = FIELD(void **, controller, 0)[i];
        if (slot) { func_ov066_02210534(slot); Heap_Free(slot); }
    }
    GraphicsSpriteGroup_Clear(FIELD(void *, controller, 0x1a4));
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14[0],
                                           FIELD(void *, controller, 0x1a4));
    func_02071bdc(data_020f4e18[0], FIELD(void *, controller, 0x1a8));
    func_02071c38(data_020f4e18[0], FIELD(void *, controller, 0x1ac));
    func_02071c94(data_020f4e18[0], FIELD(void *, controller, 0x1b0));
    return controller;
}

/* Allocate and append one particle slot, returning whether capacity remained. */
s32 func_ov066_02210a00(void *controller, const void *position,
                         s32 radius, s32 animation)
{
    void *slot;
    s32 count = FIELD(s32, controller, 0x190);
    if (count >= 100) return 0;
    slot = Heap_Alloc(0x24, data_ov066_02210fc0, 4, gHeapContext);
    if (slot) slot = func_ov066_02210458(slot, position, radius,
        FIELD(void *, controller, 0x1a4), FIELD(void *, controller, 0x1a8),
        FIELD(void *, controller, 0x1ac), FIELD(void *, controller, 0x1b0),
        animation);
    FIELD(void **, controller, 0)[count] = slot;
    FIELD(s32, controller, 0x190) = count + 1;
    return 1;
}

/* Resolve every unique particle pair, integrate all slots, and animate once. */
void func_ov066_02210a9c(void *controller)
{
    s32 i, j, count = FIELD(s32, controller, 0x190);
    for (i = 0; i < count; ++i)
        for (j = 0; j < i; ++j)
            func_ov066_02210b20(controller,
                FIELD(void **, controller, 0)[i],
                FIELD(void **, controller, 0)[j]);
    for (i = 0; i < count; ++i)
        func_ov066_02210550(FIELD(void **, controller, 0)[i],
            (u8 *)controller + 0x194, FIELD(s32, controller, 0x1b8),
            FIELD(s32, controller, 0x1b4));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, controller, 0x1a4));
}

/* Initialize a zero two-component displacement record. */
void *func_ov066_02210e54(void *vector)
{
    return func_ov066_0220fe40(vector, 0, 0);
}

/* Calculate the two-component displacement from second to first. */
void *func_ov066_02210e70(void *output, const void *first, const void *second)
{
    func_ov066_02210e54(output);
    FIELD(s32, output, 4) = FIELD(s32, first, 4) - FIELD(s32, second, 4);
    FIELD(s32, output, 8) = FIELD(s32, first, 8) - FIELD(s32, second, 8);
    return output;
}

/* Resolve overlap between two circular particles using mass-weighted impulses. */
void func_ov066_02210b20(void *controller, void *first, void *second)
{
    u8 delta[12];
    s32 distance, nx, ny, overlap, totalMass, impulse;
    func_ov066_02210e70(delta, second, first);
    nx = FIELD(s32, delta, 4);
    ny = FIELD(s32, delta, 8);
    distance = Fx32Vector2_Magnitude(nx, ny);
    if (distance <= 0 || distance >= FIELD(s32, first, 0x18) +
                                      FIELD(s32, second, 0x18)) return;
    nx = func_020adc90(nx, distance);
    ny = func_020adc90(ny, distance);
    impulse = fxMul(FIELD(s32, second, 0x10) - FIELD(s32, first, 0x10), nx) +
              fxMul(FIELD(s32, second, 0x14) - FIELD(s32, first, 0x14), ny);
    totalMass = FIELD(s32, first, 0x1c) + FIELD(s32, second, 0x1c);
    if (impulse < 0) {
        s32 response = func_020adc90(
            fxMul(impulse, FIELD(s32, controller, 0x1b8) + 0x1000), totalMass);
        FIELD(s32, first, 0x10) += fxMul(fxMul(response, nx),
                                         FIELD(s32, second, 0x1c));
        FIELD(s32, first, 0x14) += fxMul(fxMul(response, ny),
                                         FIELD(s32, second, 0x1c));
        FIELD(s32, second, 0x10) -= fxMul(fxMul(response, nx),
                                          FIELD(s32, first, 0x1c));
        FIELD(s32, second, 0x14) -= fxMul(fxMul(response, ny),
                                          FIELD(s32, first, 0x1c));
    }
    overlap = distance - FIELD(s32, first, 0x18) - FIELD(s32, second, 0x18);
    impulse = func_020adc90(fxMul(FIELD(s32, controller, 0x1b4), overlap),
                            totalMass);
    FIELD(s32, first, 4) += fxMul(fxMul(impulse, nx),
                                  FIELD(s32, second, 0x1c));
    FIELD(s32, first, 8) += fxMul(fxMul(impulse, ny),
                                  FIELD(s32, second, 0x1c));
    FIELD(s32, second, 4) -= fxMul(fxMul(impulse, nx),
                                   FIELD(s32, first, 0x1c));
    FIELD(s32, second, 8) -= fxMul(fxMul(impulse, ny),
                                   FIELD(s32, first, 0x1c));
}
