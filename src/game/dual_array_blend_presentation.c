#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a display blend presentation backed by two arrays of three SDK
 * animation elements.  It randomizes element retargeting, coordinates an
 * eight-state GameWork handshake, and writes main/sub background offsets and
 * blend registers during frame and scanline callbacks.
 */

typedef struct BlendElement { u8 bytes[0x9c]; } BlendElement;
typedef struct DualArrayBlendPresentation {
    void **vtable; u32 flags04; void *callback08; s32 callbackTag0c;
    s32 state10; s32 timer14; s32 engine18; s32 active1c;
    BlendElement first20[3]; BlendElement second1f4[3]; u32 random3c8;
} DualArrayBlendPresentation;
typedef s32 (*ElementMethod)(void *);
typedef s32 (*TaggedCallback)(void *);

#define ELEM_S32(e, off) (*(s32 *)((e)->bytes + (off)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *gDualArrayBlendPresentationVtable;
extern const void *data_020d63d0[];
extern const void *data_020d63e0[];
extern void *data_021055dc;
extern void *gGameWork;
extern u8 gSystemState[];
extern const s16 data_020c36c4[];
extern void *func_0201e250(void *);
extern void *func_0201e28c(void *);
extern void func_02094ad4(void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_020948e4(void *, s32, s32);
extern s32 func_02094d28(void *, s32, s32, s32);
extern u32 genrand_int32(void);
extern s32 func_020918f4(u32 *, s32);
extern s32 func_0209189c(u32 *, s32, s32);
extern void func_02092418(void *);
extern void func_020afd0c(volatile void *, s32, s32, s32, s32);
extern void GameWork_SetFlag(void *, s32);
extern void GameWork_ClearFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
extern void ExtendedCallbackState_SetReferencesAndReset(void *, void *, void *);
extern void BlendElement_DestroyNoOp(void *);
#ifdef __cplusplus
}
#endif

void BlendElement_StartDuration(BlendElement *, s32);
void DualArrayBlendPresentation_RetargetMirrored(DualArrayBlendPresentation *);
void DualArrayBlendPresentation_RetargetSeparated(DualArrayBlendPresentation *);
s32 DualArrayBlendPresentation_UpdateTransition(
    DualArrayBlendPresentation *, s32, s32);
void DualArrayBlendPresentation_RetargetCompletedRandomly(
    DualArrayBlendPresentation *);

/*
 * Initialize the base and construct both three-element, 0x9c-stride SDK arrays.
 * Seed random3c8, retain engine, initialize mirrored element endpoints spaced
 * by 0x8000, set GameWork flag 0x3d2, enable the object, install the initial
 * callback pair, and return self. Array construction/destruction is an SDK ABI
 * boundary represented by the documented matching assembly.
 */
DualArrayBlendPresentation *DualArrayBlendPresentation_Init(
    DualArrayBlendPresentation *self, s32 engine)
{
    s32 i;
    func_0201e250(self);
    self->vtable = (void **)gDualArrayBlendPresentationVtable;
    for (i = 0; i < 3; i++) {
        func_02094ad4(&self->first20[i]);
        func_02094ad4(&self->second1f4[i]);
    }
    self->random3c8 = genrand_int32();
    self->engine18 = engine;
    for (i = 0; i < 3; i++) {
        s32 offset = (2 - i) << 15;
        func_02094bbc(&self->first20[i], 0x100000 - offset, 0, 0);
        func_02094bbc(&self->second1f4[i], offset, 0, 0);
    }
    GameWork_SetFlag(gGameWork, 0x3d2);
    self->active1c = 1;
    self->flags04 = ((self->flags04 | 2) & ~1) | 1;
    ExtendedCallbackState_SetReferencesAndReset(self, (void *)data_020d63d0[0],
                  (void *)data_020d63d0[1]);
    return self;
}

static DualArrayBlendPresentation *teardown_blend(
    DualArrayBlendPresentation *self)
{
    s32 i;
    self->vtable = (void **)gDualArrayBlendPresentationVtable;
    if (self->engine18 == 1) {
        volatile u32 *dispcnt = (volatile u32 *)0x04000000;
        *dispcnt = (*dispcnt & ~0x1f00) |
                   ((((*(volatile u32 *)0x04001000 & 0x1f00) >> 8) & ~3) << 8);
        *(volatile u16 *)0x04000050 = 0;
        func_02092418(data_021055dc);
    } else {
        volatile u32 *dispcnt = (volatile u32 *)0x04001000;
        *dispcnt = (*dispcnt & ~0x1f00) |
                   ((((*dispcnt & 0x1f00) >> 8) & ~0x0c) << 8);
        *(volatile u16 *)0x04001050 = 0;
    }
    for (i = 2; i >= 0; i--) {
        BlendElement_DestroyNoOp(&self->second1f4[i]);
        BlendElement_DestroyNoOp(&self->first20[i]);
    }
    func_0201e28c(self);
    return self;
}

/* Restore selected display state, destroy both arrays and base, and return self. */
DualArrayBlendPresentation *DualArrayBlendPresentation_Destroy(DualArrayBlendPresentation *self)
{ return teardown_blend(self); }

/* Run the normal teardown, free self, and return its old address. */
DualArrayBlendPresentation *DualArrayBlendPresentation_DestroyAndFree(
    DualArrayBlendPresentation *self)
{ teardown_blend(self); Heap_Free(self); return self; }

/* Dispatch the recovered tagged callback pair at offsets 0x08/0x0c, or return zero. */
s32 DualArrayBlendPresentation_DispatchCallback(DualArrayBlendPresentation *self)
{
    u8 *adjusted; TaggedCallback callback;
    if (self->callback08 == 0) return 0;
    adjusted = (u8 *)self + (self->callbackTag0c >> 1);
    callback = (self->callbackTag0c & 1)
        ? *(TaggedCallback *)(*(u8 **)adjusted + (s32)self->callback08)
        : *(TaggedCallback *)self->callback08;
    return callback(adjusted);
}

/* Retarget both arrays toward their initial mirrored positions over 120 steps. */
void DualArrayBlendPresentation_RetargetMirrored(DualArrayBlendPresentation *self)
{
    s32 i;
    for (i = 0; i < 3; i++) {
        s32 offset = (2 - i) << 15;
        func_020948e4(self->first20[i].bytes + 0x0c, 2, 0x100000 - offset);
        BlendElement_StartDuration(&self->first20[i], 120);
        func_020948e4(self->second1f4[i].bytes + 0x0c, 2, offset);
        BlendElement_StartDuration(&self->second1f4[i], 120);
    }
}

/* Store signed duration at element offset 0x7c and clear offset 0x80. */
void BlendElement_StartDuration(BlendElement *element, s32 duration)
{ ELEM_S32(element, 0x7c) = (s16)duration; ELEM_S32(element, 0x80) = 0; }

/* Retarget first elements to zero and second elements to 0x100000 over 120 steps. */
void DualArrayBlendPresentation_RetargetSeparated(DualArrayBlendPresentation *self)
{
    s32 i;
    for (i = 0; i < 3; i++) {
        func_020948e4(self->first20[i].bytes + 0x0c, 2, 0);
        BlendElement_StartDuration(&self->first20[i], 120);
        func_020948e4(self->second1f4[i].bytes + 0x0c, 2, 0x100000);
        BlendElement_StartDuration(&self->second1f4[i], 120);
    }
}

/*
 * Step virtual slot 2 on all six elements, sample/cap blend progress at 16,
 * write the selected engine's blend coefficient and plane-enable bits, and
 * return whether the first element's progress reached its duration.
 */
s32 DualArrayBlendPresentation_UpdateTransition(
    DualArrayBlendPresentation *self, s32 first, s32 second)
{
    s32 i, alpha = func_02094d28(self->first20, 1, first, second);
    for (i = 0; i < 3; i++) {
        ((ElementMethod)(*(void ***)(&self->first20[i]))[2])(&self->first20[i]);
        ((ElementMethod)(*(void ***)(&self->second1f4[i]))[2])(&self->second1f4[i]);
    }
    if (alpha > 16) alpha = 16;
    if (self->engine18 == 1) {
        func_020afd0c((void *)0x04000050, 3, 0x3c, alpha, 16 - alpha);
        *(volatile u32 *)0x04000000 |= 0x0300;
    } else {
        func_020afd0c((void *)0x04001050, 0x0c, 0x33, alpha, 16 - alpha);
        *(volatile u32 *)0x04001000 |= 0x0c00;
    }
    return ELEM_S32(&self->first20[0], 0x80) >=
           ELEM_S32(&self->first20[0], 0x7c);
}

/* Randomly retarget each completed element and choose a new duration in [60,120]. */
void DualArrayBlendPresentation_RetargetCompletedRandomly(
    DualArrayBlendPresentation *self)
{
    s32 i;
    for (i = 0; i < 3; i++) {
        if (((ElementMethod)(*(void ***)(&self->first20[i]))[2])(&self->first20[i])) {
            func_020948e4(self->first20[i].bytes + 0x0c, 2,
                          func_020918f4(&self->random3c8, 16) << 12);
            BlendElement_StartDuration(&self->first20[i],
                          func_0209189c(&self->random3c8, 60, 120));
        }
        if (((ElementMethod)(*(void ***)(&self->second1f4[i]))[2])(&self->second1f4[i])) {
            func_020948e4(self->second1f4[i].bytes + 0x0c, 2,
                          (0x100 - func_020918f4(&self->random3c8, 16)) << 12);
            BlendElement_StartDuration(&self->second1f4[i],
                          func_0209189c(&self->random3c8, 60, 120));
        }
    }
}

/*
 * Drive the confirmed eight-state GameWork protocol using flags 0x38e,
 * 0x3cf, 0x3d0, 0x3d1, and 0x3d2.  States alternate array transitions with
 * flag waits/random retargeting; the final transition installs data_020d63e0.
 * Always return zero, disabling active1c immediately while flag 0x38e is set.
 */
s32 DualArrayBlendPresentation_Update(DualArrayBlendPresentation *self)
{
    if (GameWork_TestFlag(gGameWork, 0x38e)) { self->active1c = 0; return 0; }
    self->active1c = 1;
    switch (self->state10) {
    case 0: DualArrayBlendPresentation_RetargetSeparated(self); self->state10++; self->timer14 = 0; break;
    case 1: if (DualArrayBlendPresentation_UpdateTransition(self, 0, 0x20)) { GameWork_ClearFlag(gGameWork,0x3d2); self->state10++; self->timer14=0; } break;
    case 2: if (GameWork_TestFlag(gGameWork,0x3cf)) { GameWork_ClearFlag(gGameWork,0x3cf); GameWork_SetFlag(gGameWork,0x3d2); DualArrayBlendPresentation_RetargetMirrored(self); self->state10++; self->timer14=0; } else DualArrayBlendPresentation_RetargetCompletedRandomly(self); break;
    case 3: if (DualArrayBlendPresentation_UpdateTransition(self,0x20,0)) { GameWork_ClearFlag(gGameWork,0x3d2); self->state10++; self->timer14=0; } break;
    case 4: if (GameWork_TestFlag(gGameWork,0x3d0)) { GameWork_ClearFlag(gGameWork,0x3d0); GameWork_SetFlag(gGameWork,0x3d2); DualArrayBlendPresentation_RetargetSeparated(self); self->state10++; self->timer14=0; } break;
    case 5: if (DualArrayBlendPresentation_UpdateTransition(self,0,0x20)) { GameWork_ClearFlag(gGameWork,0x3d2); self->state10++; self->timer14=0; } break;
    case 6:
        if (GameWork_TestFlag(gGameWork,0x3cf)) { GameWork_ClearFlag(gGameWork,0x3cf); GameWork_SetFlag(gGameWork,0x3d2); DualArrayBlendPresentation_RetargetMirrored(self); self->state10=3; self->timer14=0; }
        else if (GameWork_TestFlag(gGameWork,0x3d1)) { GameWork_ClearFlag(gGameWork,0x3d1); GameWork_SetFlag(gGameWork,0x3d2); DualArrayBlendPresentation_RetargetMirrored(self); self->state10++; self->timer14=0; }
        else DualArrayBlendPresentation_RetargetCompletedRandomly(self); break;
    case 7: if (DualArrayBlendPresentation_UpdateTransition(self,0x20,0)) { GameWork_ClearFlag(gGameWork,0x3d2); ExtendedCallbackState_SetReferencesAndReset(self,(void *)data_020d63e0[0],(void *)data_020d63e0[1]); } break;
    }
    return 0;
}

/* Return one unconditionally without changing state. */
s32 DualArrayBlendPresentation_ReportComplete(
    DualArrayBlendPresentation *self)
{ (void)self; return 1; }

/*
 * When active, write the first value from each array into the selected engine's
 * BG offset registers and select the corresponding two background priorities.
 */
void DualArrayBlendPresentation_ApplyFrameOffsets(DualArrayBlendPresentation *self)
{
    u32 x, y;
    if (!self->active1c) return;
    x = (u32)(ELEM_S32(&self->first20[0],0x10) >> 12) & 0x1ff;
    y = (u32)(ELEM_S32(&self->second1f4[0],0x10) >> 12) & 0x1ff;
    if (self->engine18 == 1) {
        *(volatile u32 *)0x04000010 = x | 0x00100000;
        *(volatile u32 *)0x04000014 = y | 0x01f00000;
        *(volatile u16 *)0x04000008 = (*(volatile u16 *)0x04000008 & ~3) | 2;
        *(volatile u16 *)0x0400000a = (*(volatile u16 *)0x0400000a & ~3) | 1;
    } else {
        *(volatile u32 *)0x04001018 = x | 0x00100000;
        *(volatile u32 *)0x0400101c = y | 0x01f00000;
        *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & ~3) | 1;
        *(volatile u16 *)0x0400100e &= (u16)~3;
    }
}

/*
 * Per-scanline callback: when active and line is below 0xc0, select nearby
 * elements from the two arrays, combine their fixed-point offsets with a
 * 32-entry sine table indexed by system time, write selected-engine BG offsets,
 * and alternate the relevant two BG priorities every 0x20 scanlines.
 */
void DualArrayBlendPresentation_ApplyScanlineOffsets(DualArrayBlendPresentation *self, s32 line)
{
    s32 upper, lower, phase, wave;
    if (!self->active1c || line >= 0xc0) return;
    upper = (line + 0x10) / 0x40;
    lower = (line - 0x10) / 0x40;
    phase = (line + ((u32)*(s32 *)(gSystemState + 0x64) >> 2)) & 0x1f;
    wave = data_020c36c4[phase];
    if (upper < 3) {
        u32 packed = ((u32)(ELEM_S32(&self->first20[upper],0x10) >> 12)&0x1ff) |
                     (((wave + 0x10) & 0x1ff) << 16);
        *(volatile u32 *)(self->engine18==1 ? 0x04000010 : 0x04001018)=packed;
    }
    if (lower < 3) {
        u32 packed = ((u32)(ELEM_S32(&self->second1f4[lower],0x10)>>12)&0x1ff) |
                     (((wave - 0x10) & 0x1ff) << 16);
        *(volatile u32 *)(self->engine18==1 ? 0x04000014 : 0x0400101c)=packed;
    }
    if (self->engine18 == 1) {
        volatile u16 *r=(volatile u16 *)0x04000008;
        if (((line-0x10)/0x20)&1) { r[0]=(r[0]&~3)|1; r[1]=(r[1]&~3)|2; }
        else { r[0]=(r[0]&~3)|2; r[1]=(r[1]&~3)|1; }
    } else {
        volatile u16 *r=(volatile u16 *)0x0400100c;
        if (((line-0x10)/0x20)&1) { r[0]&=(u16)~3; r[1]=(r[1]&~3)|1; }
        else { r[0]=(r[0]&~3)|1; r[1]&=(u16)~3; }
    }
}
