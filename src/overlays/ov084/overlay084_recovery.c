#include "tingle/types.h"

/*
 * Recovered overlay 84 attachment, currency-transfer, and target actor family.
 * Three ActorExtendedType2 variants share fixed-point vector helpers. The main
 * actor owns a three-point Bezier path and transfers currency at its midpoint;
 * the second stores a target path, and the third manages a terminal attachment
 * transition. Shared class layouts remain offset based.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *);
typedef void (*V0)(void *);
typedef void (*V1)(void *, void *);
typedef void (*V2)(void *, void *, s32);

extern "C" void *gHeapContext, *gSoundContext, *gLupyContext, *data_021052fc;
extern "C" u16 gActorInteractionResourceState;
extern "C" const s16 data_020c9670[], data_020e6f94[];
extern "C" const u16 data_020e7318[];
extern "C" u8 data_ov084_02214108[], data_ov084_02214118[],
    data_ov084_02214140[], data_ov084_022141c8[];
extern "C" u8 data_ov084_0221439c[], data_ov084_022143a4[],
    data_ov084_02214400[];
extern "C" u8 data_ov084_022145d4[], data_ov084_022145e4[],
    data_ov084_022145ec[], data_ov084_02214640[];
extern "C" void *ActorExtendedType2_Init(void *, const void *);
extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void ActorExtendedType2_CopyAdjustedDescriptor(void *, void *);
extern "C" void ActorExtendedType2_InitializeReentryState(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue2A(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue2C(void *);
extern "C" s32 ActorExtendedType2_IsInteractionEligible(void *);
extern "C" void ActorExtendedType2_ResetTerminalAttachmentState(void *, void *);
extern "C" s32 ActorExtendedType2_TriggerStoredTargetCallback(void *);
extern "C" void ActorExtendedType2_UpdateTargetMotion(void *, void *);
extern "C" void ActorExtendedType2_UpdateFrame(void *);
extern "C" void Actor_SaveAndForceFlags(void *);
extern "C" void Actor_RefreshTerrainHeight(void *);
extern "C" s32 Actor_GetCachedTerrainHeight(void *);
extern "C" void *Heap_Alloc(s32, void *, s32, void *);
extern "C" void *Heap_Free(void *);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void VecFx32Triple_Init(void *);
extern "C" void VecFx32Triple_Destroy(void *);
extern "C" void VecFx32Triple_Set(void *, const void *, const void *,
                                  const void *);
extern "C" void VecFx32Bezier_Evaluate3D(void *, const void *, s32);
extern "C" void func_020adff0(const void *, const void *, void *);
extern "C" void func_020adfbc(const void *, const void *, void *);
extern "C" s32 func_020adc90(s32, s32);
extern "C" s32 func_020befec(s32, s32);
extern "C" s32 Fx32Vector2_Magnitude(s32, s32);
extern "C" void Actor_TurnTowardVector(void *, s32, s32, s32);
extern "C" void Actor_TurnTowardTargetPosition(void *, void *, s32);
extern "C" void func_020349b8(void *, s32, s32);
extern "C" void Sound_StopEffect(void *, s32, s32);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" s32 GamePhaseCurrencyHud_GetCurrency(void *);
extern "C" void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern "C" void *ActorMotionAreaFollower_GetPosition(void *);
extern "C" void *func_02022cb0(void *, void *, void *, s32, s32, s32);
extern "C" void PresentationList_AppendObject(void *, void *);
extern "C" void InteractionRecordAllocator_ReleaseOwner(void *, void *);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" void *func_020536b8(void *);
extern "C" void *func_020537f0(void *);

extern "C" void func_ov084_02212cbc(void *, const void *, s32);
extern "C" void func_ov084_02212d28(void *, const void *, const void *);
extern "C" void func_ov084_022131fc(void *, s32, s32, s32);
extern "C" void func_ov084_022134f0(void *);
extern "C" void func_ov084_02213b2c(void *, const void *);
extern "C" void func_ov084_02213bc8(void *);
extern "C" void func_ov084_02213e10(void *, const void *, const void *);
extern "C" void func_ov084_02213e48(void *, const void *, s32);

static void *vm(void *a, u32 o) {
    return F(void *, F(void *, a, 0), o);
}
static bool pair_is(void *a, const void *x, const void *y) {
    return F(void *, a, 0x218) == F(void *, x, 0) &&
           (F(void *, a, 0x21c) == F(void *, y, 4) || F(void *, a, 0x218) == 0);
}
static void clear_vectors(void *a) {
    func_ov084_022131fc((u8 *)a + 0x38, 0, 0, 0);
    func_ov084_022131fc((u8 *)a + 0x88, 0, 0, 0);
    func_ov084_022131fc((u8 *)a + 0x98, 0, 0, 0);
}

/* Construct the Bezier/currency actor and its owned three-vector path. */
extern "C" void *func_ov084_02212ae0(void *a, const void *c) {
    ActorExtendedType2_Init(a, c);
    F(void *, a, 0) = data_ov084_022141c8;
    F(s32, a, 0x298) = 0;
    F(s16, a, 0x29c) = F(s16, a, 0x29e) = F(s16, a, 0x2a0) = F(s16, a, 0x2a2) =
        0;
    F(u32, a, 0x260) |= 0x20;
    void *p = Heap_Alloc(0x30, data_ov084_0221439c, 4, gHeapContext);
    if (p)
        VecFx32Triple_Init(p);
    F(void *, a, 0x2a4) = p;
    F(s32, a, 0x114) = ActorExtendedType2_GetDescriptorValue2A(a);
    return a;
}
/* Destroy the owned path and actor while retaining allocation. */
extern "C" void *func_ov084_02212b60(void *a) {
    F(void *, a, 0) = data_ov084_022141c8;
    if (F(void *, a, 0x2a4)) {
        VecFx32Triple_Destroy(F(void *, a, 0x2a4));
        Heap_Free(F(void *, a, 0x2a4));
    }
    ActorExtendedType2_Destroy(a);
    return a;
}
/* Destroy and free the Bezier/currency actor. */ extern "C" void *
func_ov084_02212ba0(void *a) {
    func_ov084_02212b60(a);
    Heap_Free(a);
    return a;
}
/* Copy an adjusted descriptor and expose the current attachment phase. */
extern "C" void func_ov084_02212be8(void *a, void *d) {
    ActorExtendedType2_CopyAdjustedDescriptor(a, d);
    if (F(u16, a, 0x2a0) & 1)
        F(u16, d, 0x1a) = (F(u16, d, 0x1a) & ~1u) | 4;
    else
        F(u16, d, 0x1a) = (F(u16, d, 0x1a) & ~4u) | 1;
}
/* Initialize the path endpoints around the linked target. */
extern "C" void func_ov084_02212c28(void *a) {
    F(s16, a, 0x29c) = F(s16, a, 0x29e) = 0;
    u8 x[16], y[16], m[16];
    func_ov084_02212cbc(x, (u8 *)a + 0x18, 0x800);
    func_ov084_02212cbc(y, (u8 *)F(void *, a, 0x228) + 0x18, 0x800);
    func_ov084_02212d28(m, x, y);
    VecFx32Object_Destroy(y);
    VecFx32Object_Destroy(x);
    VecFx32Triple_Set(F(void *, a, 0x2a4), (u8 *)a + 0x18,
                      (u8 *)F(void *, a, 0x228) + 0x18, m);
    F(u32, a, 0x14) |= 6;
    VecFx32Object_Destroy(m);
}
/* Construct a fixed-point scaled vector. */ extern "C" void
func_ov084_02212cbc(void *o, const void *v, s32 k) {
    VecFx32Object_Init(o);
    F(s32, o, 4) = (s32)(((s64)F(s32, v, 4) * k + 0x800) >> 12);
    F(s32, o, 8) = (s32)(((s64)F(s32, v, 8) * k + 0x800) >> 12);
    F(s32, o, 12) = (s32)(((s64)F(s32, v, 12) * k + 0x800) >> 12);
}
/* Construct the sum of two vectors. */ extern "C" void
func_ov084_02212d28(void *o, const void *l, const void *r) {
    VecFx32Object_Init(o);
    func_020adff0(l ? (u8 *)l + 4 : 0, r ? (u8 *)r + 4 : 0, (u8 *)o + 4);
}
/* Return the null interaction result. */ extern "C" s32
func_ov084_02212d60(void) {
    return 0;
}
/* Forward a temporary copy to the inherited target-motion callback. */
extern "C" void func_ov084_02212d68(void *a, const void *p) {
    u8 v[16];
    VecFx32Object_InitCopy(v, p);
    ActorExtendedType2_UpdateTargetMotion(a, v);
    VecFx32Object_Destroy(v);
}
/* Advance the short entry delay and install the active callback pair. */
extern "C" s32 func_ov084_02212d98(void *a) {
    F(u32, a, 0x260) &= ~1u;
    F(u8, a, 0x24c) = 0;
    if (!((M0)vm(a, 0x38))(a) && ++F(s16, a, 0x25a) > 10) {
        F(s16, a, 0x25a) = F(s16, a, 0x256) = 0;
        F(void *, a, 0x218) = F(void *, data_ov084_02214108, 0x30);
        F(void *, a, 0x21c) = F(void *, data_ov084_02214108, 0x34);
        F(u32, a, 0x260) |= 4;
        u16 s = data_020e7318[F(u16, a, 0x4e)];
        if (s != 0xffff)
            Sound_StopEffect(gSoundContext, s >> 7, s & 0x7f);
    }
    return 0;
}

/* Evaluate the twenty-frame Bezier transfer, currency effect, and return path.
 */
extern "C" s32 func_ov084_02212e6c(void *a, s32, s32, s32) {
    F(s16, a, 0xd6) = 6;
    F(u32, a, 0x14) |= 0x40;
    s32 t = func_020befec(F(s16, a, 0x29c) << 12, 20);
    u8 p[16];
    if (!F(s16, a, 0x29e)) {
        VecFx32Object_Assign((u8 *)F(void *, a, 0x2a4) + 0x10,
                             (u8 *)F(void *, a, 0x228) + 0x18);
        u8 x[16], y[16], m[16];
        func_ov084_02212cbc(x, F(void *, a, 0x2a4), 0x800);
        func_ov084_02212cbc(y, (u8 *)F(void *, a, 0x228) + 0x18, 0x800);
        func_ov084_02212d28(m, x, y);
        VecFx32Object_Destroy(y);
        VecFx32Object_Destroy(x);
        VecFx32Object_Assign((u8 *)F(void *, a, 0x2a4) + 0x20,
                             (u8 *)F(void *, a, 0x228) + 0x18);
        VecFx32Object_Destroy(m);
    }
    VecFx32Bezier_Evaluate3D(p, F(void *, a, 0x2a4), t);
    u16 phase = (u16)func_020befec(F(s16, a, 0x29c) << 15, 20);
    F(s32, p, 12) += data_020c9670[(phase >> 4) * 2] * 40;
    VecFx32Object_Assign((u8 *)a + 0x18, p);
    clear_vectors(a);
    if (++F(s16, a, 0x29c) > 20) {
        if (!F(s16, a, 0x29e)) {
            F(s16, a, 0x29e) = 1;
            F(s16, a, 0x29c) = 0;
            s32 amount = F(s32, a, 0x114),
                held = GamePhaseCurrencyHud_GetCurrency(gLupyContext);
            if (held <= amount)
                amount = held - 1;
            GamePhaseCurrencyHud_AddCurrency(gLupyContext, -amount, 0);
            F(u32, a, 0x14) &= ~0x30000u;
            Sound_Play(gSoundContext, 0, 0x20);
            void *e = Heap_Alloc(0x44, data_ov084_022143a4, 4, gHeapContext);
            if (e)
                e = func_02022cb0(e,
                                  ActorMotionAreaFollower_GetPosition(
                                      (u8 *)data_021052fc + 0x2fbc),
                                  a, -amount, 0x2000, -0xc0);
            PresentationList_AppendObject((u8 *)data_021052fc + 0x2f7c, e);
            if (F(s32, a, 0x298) + amount < 0x7fff)
                F(s32, a, 0x298) += amount;
            u8 q[16], x[16], y[16], m[16];
            VecFx32Object_InitCopy(q, F(void *, a, 0x2a4));
            func_ov084_02212cbc(x, (u8 *)F(void *, a, 0x228) + 0x18, 0x800);
            func_ov084_02212cbc(y, q, 0x800);
            func_ov084_02212d28(m, x, y);
            VecFx32Object_Destroy(y);
            VecFx32Object_Destroy(x);
            VecFx32Triple_Set(F(void *, a, 0x2a4),
                              (u8 *)F(void *, a, 0x228) + 0x18, q, m);
            VecFx32Object_Destroy(m);
            VecFx32Object_Destroy(q);
        } else {
            F(s16, a, 0x29e) = 0;
            F(u16, a, 0x2a0) |= 1;
            F(void *, a, 0x228) = F(void *, data_021052fc, 0x2ea4);
            F(void *, a, 0x218) = F(void *, data_ov084_02214108, 0x20);
            F(void *, a, 0x21c) = F(void *, data_ov084_02214108, 0x24);
            F(void *, a, 0x220) = F(void *, data_ov084_02214108, 8);
            F(void *, a, 0x224) = F(void *, data_ov084_02214108, 0xc);
            F(s16, a, 0x2a2) = F(s16, a, 0x29c) = 0;
            F(u32, a, 0x14) &= ~6u;
        }
    }
    VecFx32Object_Destroy(p);
    return 0;
}
/* Store three scalar components after the VecFx32Object header. */
extern "C" void func_ov084_022131fc(void *v, s32 x, s32 y, s32 z) {
    F(s32, v, 4) = x;
    F(s32, v, 8) = y;
    F(s32, v, 12) = z;
}
/* Count released interaction resources before terminal reset. */
extern "C" void func_ov084_0221320c(void *a, void *d) {
    ++gActorInteractionResourceState;
    ActorExtendedType2_ResetTerminalAttachmentState(a, d);
}
/* Run the launch approach and transition to the normal callback family. */
extern "C" s32 func_ov084_0221322c(void *a, void *d) {
    F(u32, a, 0x14) &= ~0x40u;
    if (!ActorExtendedType2_GetDescriptorValue2C(a)) {
        if (F(s16, a, 0x29c) >= 0x10e) {
            func_ov084_022134f0(a);
            F(u16, F(void *, a, 0x54), 0x24) |= 4;
            return 0;
        }
        if (F(s16, a, 0x29c) > 0xef) {
            F(u32, a, 0x260) &= ~3u;
            if (F(s16, a, 0x29c) == 0xf0)
                F(u32, a, 0x14) |= 0x40;
            F(s32, a, 0x24) += 0x6000;
            ++F(s16, a, 0x29c);
            F(s16, a, 0xd6) = 0x11;
            return 0;
        }
    }
    if (F(s16, a, 0x29c) < 0xf0) {
        F(u32, a, 0x260) |= 3;
        if (!((M0)vm(a, 0x38))(a)) {
            if (!(F(u16, d, 0x1a) & 2)) {
                void *collection =
                    GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
                if (!(F(u32, F(void *, collection, 0x2e7c), 0xd0) & 0x100)) {
                    u8 p[16];
                    VecFx32Object_InitCopy(p, (u8 *)a + 0x18);
                    if (F(s16, a, 0x29c) % 60 > 20) {
                        F(s32, p, 4) += ((F(s32, a, 0x1c) -
                                          F(s32, F(void *, a, 0x228), 0x1c)) >>
                                         12)
                                        << 12;
                        F(s32, p, 8) += ((F(s32, a, 0x20) -
                                          F(s32, F(void *, a, 0x228), 0x20)) >>
                                         12)
                                        << 12;
                    }
                    F(u32, a, 0xd0) |= 2;
                    ((V1)vm(a, 0xd0))(a, p);
                    VecFx32Object_Destroy(p);
                }
                ++F(s16, a, 0x29c);
            } else {
                F(void *, a, 0x218) = F(void *, data_ov084_02214108, 0x28);
                F(void *, a, 0x21c) = F(void *, data_ov084_02214108, 0x2c);
            }
        }
    } else
        func_ov084_022134f0(a);
    return 0;
}
/* Initialize reentry or restore the active attachment callback set. */
extern "C" void func_ov084_0221341c(void *a) {
    ActorExtendedType2_InitializeReentryState(a);
    F(u32, a, 0x14) &= ~0x40u;
    if (!F(s32, a, 0x1fc)) {
        F(u16, a, 0x2a0) &= ~1u;
        F(s32, a, 0x298) = 0;
        F(u32, a, 0x14) |= 6;
        F(u32, a, 0x10) |= 0x1f0000;
        return;
    }
    F(u16, a, 0x2a0) |= 1;
    F(void *, a, 0x228) = F(void *, data_021052fc, 0x2ea4);
    F(void *, a, 0x218) = F(void *, data_ov084_02214108, 0x48);
    F(void *, a, 0x21c) = F(void *, data_ov084_02214108, 0x4c);
    F(void *, a, 0x220) = F(void *, data_ov084_02214108, 0);
    F(void *, a, 0x224) = F(void *, data_ov084_02214108, 4);
    F(u32, a, 0x14) &= ~6u;
    F(u32, a, 0x10) &= ~0x1f0000u;
    F(s16, a, 0x2a2) = F(s16, a, 0x29c) = 0;
}
/* Leave the transfer sequence and restore the terminal idle state. */
extern "C" void func_ov084_022134f0(void *a) {
    F(u32, a, 0xd0) &= ~0x200u;
    F(s16, a, 0x24e) = 0;
    Actor_SaveAndForceFlags(a);
    if (F(void *, a, 0x274))
        InteractionRecordAllocator_ReleaseOwner(F(void *, a, 0x274), a);
    clear_vectors(a);
    F(void *, a, 0x218) = F(void *, data_ov084_02214108, 0x18);
    F(void *, a, 0x21c) = F(void *, data_ov084_02214108, 0x1c);
    s16 s = data_020e6f94[F(u16, a, 0x4e)];
    if (s)
        func_020349b8(a, s, 0);
    F(u32, a, 0x14) |= 6;
    F(u32, a, 0x10) |= 0x1f0000;
    F(u16, a, 0x2a0) &= ~1u;
    F(u32, a, 0x260) = (F(u32, a, 0x260) & 0xfffff7fc) | 0x4000;
    F(u32, a, 0x14) &= ~0x40u;
    F(s32, a, 0x24) = Actor_GetCachedTerrainHeight(a);
    F(s16, a, 0xd6) = 0x11;
}
/* Reject interaction during either protected callback state. */ extern "C" s32
func_ov084_02213608(void *a) {
    if (pair_is(a, (u8 *)data_ov084_02214108 + 0x38, data_ov084_02214140) ||
        pair_is(a, (u8 *)data_ov084_02214108 + 0x10, data_ov084_02214118))
        return 0;
    return ActorExtendedType2_IsInteractionEligible(a);
}
/* Return the default false capability. */ extern "C" s32
func_ov084_022136b0(void) {
    return 0;
}
/* Copy another actor position into an output vector. */ extern "C" void
func_ov084_022136b8(void *o, void *a) {
    VecFx32Object_InitCopy(o, (u8 *)a + 0x18);
}
/* Return runtime flag 0x80. */ extern "C" u32 func_ov084_022136c8(void *a) {
    return F(u32, a, 0xd0) & 0x80;
}
/* Return whether runtime flag 0x40 is set. */ extern "C" bool
func_ov084_022136d4(void *a) {
    return (F(u32, a, 0xd0) & 0x40) != 0;
}
/* Return the default false predicate. */ extern "C" s32
func_ov084_022136e8(void) {
    return 0;
}
/* No-op vtable callback. */ extern "C" void func_ov084_022136f0(void) {
}
/* No-op vtable callback. */ extern "C" void func_ov084_022136f4(void) {
}
/* Return the fixed descriptor constant. */ extern "C" s32
func_ov084_022136f8(void) {
    return 0x10;
}
/* Return the actor position vector. */ extern "C" void *
func_ov084_02213700(void *a) {
    return (u8 *)a + 0x18;
}
/* Return the fixed interaction range. */ extern "C" s32
func_ov084_02213708(void) {
    return 0xc0000;
}
/* Forward descriptor notification through vmethod 0x108. */ extern "C" void
func_ov084_02213710(void *a, void *d) {
    ((V2)vm(a, 0x108))(a, d, 0);
}
/* Forward alternate descriptor notification through vmethod 0x108. */
extern "C" void func_ov084_02213728(void *a, void *d) {
    ((V2)vm(a, 0x108))(a, d, 0);
}
/* Return the default false query. */ extern "C" s32 func_ov084_02213740(void) {
    return 0;
}
/* Mark the actor's pending target state. */ extern "C" void
func_ov084_02213748(void *a) {
    F(u32, a, 0x260) |= 0x10;
}
/* Require flag 8, active motion, and no inherited block. */ extern "C" s32
func_ov084_02213758(void *a) {
    return (F(u32, a, 0x260) & 8) &&
           ((F(u32, a, 0x260) & 2) && !((M0)vm(a, 0xa8))(a));
}
/* Test actor subtype eight. */ extern "C" bool func_ov084_022137a0(void *a) {
    return F(u8, a, 0x24c) == 8;
}
/* Reject only state 0x10. */ extern "C" bool func_ov084_022137b4(void *a) {
    return F(s16, a, 0xd6) != 0x10;
}
/* Test primary action states five and six. */ extern "C" bool
func_ov084_022137d4(void *a) {
    return F(s16, a, 0xd6) == 5 || F(s16, a, 0xd6) == 6;
}
/* Test secondary action states nine and ten. */ extern "C" bool
func_ov084_022137ec(void *a) {
    return F(s16, a, 0xd8) == 9 || F(s16, a, 0xd8) == 10;
}
/* Test primary action states nine and ten. */ extern "C" bool
func_ov084_02213804(void *a) {
    return F(s16, a, 0xd6) == 9 || F(s16, a, 0xd6) == 10;
}
/* Return the first fixed radius. */ extern "C" s32 func_ov084_0221381c(void) {
    return 0x800;
}
/* Return the second fixed radius. */ extern "C" s32 func_ov084_02213824(void) {
    return 0x800;
}
/* No-op vtable callback. */ extern "C" void func_ov084_0221382c(void) {
}
/* Toggle the auxiliary sprite visibility bit. */ extern "C" void
func_ov084_02213830(void *a, s32 show) {
    void *s = F(void *, a, 0x288);
    if (show)
        F(u16, s, 0x24) &= ~4u;
    else
        F(u16, s, 0x24) |= 4;
}
/* Return the fixed auxiliary radius. */ extern "C" s32
func_ov084_02213850(void) {
    return 0x20000;
}

/* Construct the target-motion actor and its local vectors. */ extern "C" void *
func_ov084_02213858(void *a, const void *c) {
    ActorExtendedType2_Init(a, c);
    F(void *, a, 0) = data_ov084_02214400;
    VecFx32Object_Init((u8 *)a + 0x298);
    F(s16, a, 0x2a8) = F(s16, a, 0x2aa) = 0;
    return a;
}
/* Destroy target-motion state while retaining allocation. */ extern "C" void *
func_ov084_02213890(void *a) {
    VecFx32Object_Destroy((u8 *)a + 0x298);
    ActorExtendedType2_Destroy(a);
    return a;
}
/* Destroy and free the target-motion actor. */ extern "C" void *
func_ov084_022138b0(void *a) {
    func_ov084_02213890(a);
    Heap_Free(a);
    return a;
}
/* Acquire an eligible nearby actor and install its target path. */
extern "C" s32 func_ov084_022138d8(void *a, s32, s32, s32) {
    if (ActorExtendedType2_IsInteractionEligible(a)) {
        void *t = func_020536b8(a);
        if (!t)
            t = func_020537f0(a);
        if (t) {
            u8 p[16];
            VecFx32Object_InitCopy(p, (u8 *)t + 0x18);
            F(s32, p, 12) = Actor_GetCachedTerrainHeight(t);
            func_ov084_02213b2c(a, p);
            VecFx32Object_Destroy(p);
            return 1;
        }
    }
    return 0;
}
/* Trigger the stored target callback and use its position when available. */
extern "C" bool func_ov084_02213954(void *a) {
    s32 ok = ActorExtendedType2_TriggerStoredTargetCallback(a);
    if (ok) {
        u8 p[16];
        VecFx32Object_InitCopy(p, (u8 *)F(void *, a, 0x228) + 0x18);
        F(s32, p, 12) = Actor_GetCachedTerrainHeight(F(void *, a, 0x228));
        func_ov084_02213b2c(a, p);
        VecFx32Object_Destroy(p);
    }
    return ok != 0;
}
/* Move toward the selected target, then dispatch the selected completion. */
extern "C" s32 func_ov084_022139ac(void *a) {
    F(u32, a, 0xd0) |= 2;
    F(u32, a, 0x260) &= ~1u;
    F(s16, a, 0xd6) = 6;
    F(u8, a, 0x24c) = 2;
    void *t = F(void *, a, 0x228);
    s32 k = ((M0)vm(a, 0x144))(a);
    Actor_TurnTowardVector(a, F(s32, t, 0x1c) - F(s32, a, 0x1c),
                  F(s32, t, 0x20) - F(s32, a, 0x20), k);
    if (((M0)vm(a, 0x38))(a)) {
        F(u8, a, 0x24c) = 2;
        return 0;
    }
    if (F(s16, a, 0x2a8) == 1)
        func_ov084_02213bc8(a);
    else if (F(s16, a, 0x2a8) == 3)
        ((V0)vm(a, 0xe8))(a);
    return 0;
}
/* Resolve an alternate target state and its completion behavior. */
extern "C" s32 func_ov084_02213a74(void *a) {
    F(u32, a, 0x260) &= ~1u;
    F(u8, a, 0x24c) = 7;
    if (((M0)vm(a, 0x38))(a))
        return 0;
    s16 s = F(s16, a, 0x2a8);
    if (s == 1)
        func_ov084_02213bc8(a);
    else if (s == 2 && !func_020536b8(a))
        func_ov084_02213bc8(a);
    else if (s == 3)
        ((V0)vm(a, 0xe8))(a);
    return 0;
}
/* Install return motion before the inherited target update. */ extern "C" void
func_ov084_02213b0c(void *a, void *d) {
    func_ov084_02213bc8(a);
    ActorExtendedType2_UpdateTargetMotion(a, d);
}
/* Start a fixed-duration motion toward an explicit target vector. */
extern "C" void func_ov084_02213b2c(void *a, const void *p) {
    F(s16, a, 0x2a8) = 1;
    VecFx32Object_Assign((u8 *)a + 0x298, (u8 *)a + 0x18);
    VecFx32Object_Assign((u8 *)a + 0xb0, p);
    Actor_SaveAndForceFlags(a);
    clear_vectors(a);
    F(s16, a, 0xae) = F(s16, a, 0x2aa) = 0x18;
    F(s16, a, 0xac) = 2;
    F(u32, a, 0xd0) |= 0x1000;
}
/* Start a distance-scaled return motion. */ extern "C" void
func_ov084_02213bc8(void *a) {
    F(s16, a, 0x2a8) = 3;
    VecFx32Object_Assign((u8 *)a + 0xb0, (u8 *)a + 0x22c);
    VecFx32Object_Assign((u8 *)a + 0x298, (u8 *)a + 0x18);
    clear_vectors(a);
    s32 d = Fx32Vector2_Magnitude(F(s32, a, 0x29c) - F(s32, a, 0xb4),
                          F(s32, a, 0x2a0) - F(s32, a, 0xb8));
    F(s16, a, 0xae) =
        d < 0x30000 ? 0x18
        : d < 0x100001
            ? (s16)((func_020befec(d - 0x30000, 0xd0) * 0x24 >> 12) + 0x18)
            : 0x3c;
    F(s16, a, 0x2aa) = F(s16, a, 0xae);
    F(s16, a, 0xac) = 2;
    F(u32, a, 0xd0) |= 0x1000;
}
/* Interpolate the target path and commit completion when its timer expires. */
extern "C" s32 func_ov084_02213cb0(void *a, s32, s32, s32) {
    if (F(s16, a, 0xac) == 0xff)
        return 0;
    s32 k = ((M0)vm(a, 0x144))(a);
    Actor_TurnTowardTargetPosition(a, (u8 *)a + 0xb0, k);
    F(s16, a, 0xd6) = 6;
    if (F(s16, a, 0xae) < 1) {
        ((V0)vm(a, 0x40))(a);
        F(u32, a, 0x260) &= ~0x20u;
        VecFx32Object_Assign((u8 *)a + 0x18, (u8 *)a + 0xb0);
        Actor_RefreshTerrainHeight(a);
        return 2;
    }
    --F(s16, a, 0xae);
    u8 d[16], q[16], m[16], path[48], p[16];
    func_ov084_02213e10(d, (u8 *)a + 0xb0, (u8 *)a + 0x298);
    func_ov084_02213e48(q, d, 0x2000);
    func_ov084_02212d28(m, (u8 *)a + 0x298, q);
    VecFx32Object_Destroy(q);
    VecFx32Object_Destroy(d);
    F(s32, m, 12) += 0x18000;
    VecFx32Triple_Init(path);
    VecFx32Triple_Set(path, (u8 *)a + 0x298, (u8 *)a + 0xb0, m);
    s32 t = func_020befec((F(u16, a, 0x2aa) - F(s16, a, 0xae)) * 0x1000,
                          F(u16, a, 0x2aa));
    VecFx32Bezier_Evaluate3D(p, path, t);
    VecFx32Object_Assign((u8 *)a + 0x18, p);
    VecFx32Object_Destroy(p);
    VecFx32Triple_Destroy(path);
    VecFx32Object_Destroy(m);
    return 1;
}
/* Construct lhs minus rhs. */ extern "C" void
func_ov084_02213e10(void *o, const void *l, const void *r) {
    VecFx32Object_Init(o);
    func_020adfbc(l ? (u8 *)l + 4 : 0, r ? (u8 *)r + 4 : 0, (u8 *)o + 4);
}
/* Construct a vector divided by a fixed-point scalar. */ extern "C" void
func_ov084_02213e48(void *o, const void *v, s32 d) {
    VecFx32Object_Init(o);
    F(s32, o, 4) = func_020adc90(F(s32, v, 4), d);
    F(s32, o, 8) = func_020adc90(F(s32, v, 8), d);
    F(s32, o, 12) = func_020adc90(F(s32, v, 12), d);
}
/* No-op vtable callback. */ extern "C" void func_ov084_02213e90(void) {
}

/* Construct the compact terminal-state actor. */ extern "C" void *
func_ov084_02213e94(void *a, const void *c) {
    ActorExtendedType2_Init(a, c);
    F(void *, a, 0) = data_ov084_02214640;
    F(s16, a, 0x298) = 0;
    return a;
}
/* Destroy terminal actor while retaining allocation. */ extern "C" void *
func_ov084_02213ec0(void *a) {
    ActorExtendedType2_Destroy(a);
    return a;
}
/* Destroy and free the terminal actor. */ extern "C" void *
func_ov084_02213ed4(void *a) {
    ActorExtendedType2_Destroy(a);
    Heap_Free(a);
    return a;
}
/* Clear the terminal-state active bit. */ extern "C" void
func_ov084_02213ef0(void *a) {
    F(u16, a, 0x29a) &= ~1u;
}
/* Copy an adjusted descriptor and expose the terminal active bit. */
extern "C" void func_ov084_02213f04(void *a, void *d) {
    ActorExtendedType2_CopyAdjustedDescriptor(a, d);
    if (F(u16, a, 0x29a) & 1)
        F(u16, d, 0x14) = (u16)ActorExtendedType2_GetDescriptorValue2C(a);
}
/* Count stable active frames and enter the terminal attachment callback. */
extern "C" void func_ov084_02213f38(void *a) {
    if (F(u32, a, 0x14) & 0x200000)
        return;
    bool active = (F(u32, a, 0x260) & 2) && !((M0)vm(a, 0xa8))(a);
    bool initial = active && pair_is(a, (u8 *)data_ov084_022145d4 + 0x10,
                                     data_ov084_022145e4);
    if (initial) {
        s32 limit = ActorExtendedType2_GetDescriptorValue2A(a);
        if (F(s16, a, 0x298) < limit)
            ++F(s16, a, 0x298);
        else if (!pair_is(a, (u8 *)data_ov084_022145d4 + 0x18,
                          data_ov084_022145ec)) {
            F(u16, a, 0x29a) |= 1;
            F(u32, a, 0xd0) &= ~0x200u;
            F(s16, a, 0x24e) = 0;
            Actor_SaveAndForceFlags(a);
            if (F(void *, a, 0x274))
                InteractionRecordAllocator_ReleaseOwner(F(void *, a, 0x274), a);
            F(void *, a, 0x218) = F(void *, data_ov084_022145d4, 8);
            F(void *, a, 0x21c) = F(void *, data_ov084_022145d4, 0xc);
            s16 s = data_020e6f94[F(u16, a, 0x4e)];
            if (s)
                func_020349b8(a, s, 0);
            F(u32, a, 0x260) = (F(u32, a, 0x260) & ~3u) | 0x4000;
            F(s16, a, 0x298) = 0;
        }
    }
    ActorExtendedType2_UpdateFrame(a);
}
