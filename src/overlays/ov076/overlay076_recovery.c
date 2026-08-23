#include "tingle/types.h"

/*
 * Recovered overlay 76 linked-actor and orbiting-source subsystem.
 *
 * The overlay owns a reactive ActorExtendedLinked actor, the corresponding
 * ActorExtendedLinkSource presentation owner, and a smaller ActorExtendedType2
 * follower. Unknown class members remain address-derived offset accesses.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*Method0)(void *);
typedef void (*Method1)(void *, void *);
typedef void (*Method2)(void *, void *, s32);

extern "C" void *gSoundContext;
extern "C" void *gHeapContext;
extern "C" void *gGameWork;
extern "C" void *data_021052fc;
extern "C" u8 gSystemState[];
extern "C" const s16 data_020c9670[];
extern "C" const s16 data_020e6d3c[];
extern "C" const u16 data_020e7444[];
extern "C" u8 data_ov076_0221480c[];
extern "C" u8 data_ov076_02214848[];
extern "C" u8 data_ov076_02214950[];
extern "C" u8 data_ov076_02214b2c[];
extern "C" u8 data_ov076_02214d08[];
extern "C" u8 data_ov076_02214eec[];

extern "C" void *ActorExtendedLinked_Init(void *, const void *);
extern "C" void *ActorExtendedLinked_Destroy(void *);
extern "C" void *ActorExtendedLinkSource_Init(void *, const void *);
extern "C" void *ActorExtendedLinkSource_Destroy(void *);
extern "C" void ActorExtendedLinkSource_UpdateFrame(void *);
extern "C" void ActorExtendedLinkSource_ClearPartnerLinkedFlag(void *);
extern "C" void ActorExtendedLinkSource_ClearRuntimeFlag2(void *);
extern "C" void *ActorExtendedType2_Init(void *, const void *);
extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void ActorExtendedType2_UpdateFrame(void *);
extern "C" void ActorExtendedType2_InitializePresentation(void *);
extern "C" void ActorExtendedType2_RunRenderCallback(void *, void *, void *);
extern "C" s32 ActorExtendedType2_TryDescriptorInteraction128(void *);
extern "C" void ActorExtendedType2_ApplyContactResponse(void *, void *, s32);
extern "C" void ActorDerivedType1_TrySetStateVector(void *, const void *, s32,
                                                    s32);
extern "C" void Actor_ApplyMotionImpulse(void *, const void *, s32);
extern "C" s32 Actor_GetCachedTerrainHeight(void *);
extern "C" void *Actor_GetCollection(void *);
extern "C" void Actor_SetInteractionFlag2000(void *, s32);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void Type7Actor_HandleObjectInteraction(void *, void *);
extern "C" void *GraphicsSpriteGroup_CreateState(void *, s32, s32, s32, s32);
extern "C" void GraphicsSpriteState_ReleaseFromGroup(void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void
GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(void *, ...);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Add(void *, const void *);
extern "C" void VecFx32Object_Normalize(void *);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *func_0201e0ec(void *);
extern "C" void func_020349b8(void *, ...);
extern "C" void func_02034a60(void *, s32, s32);
extern "C" s32 func_0204cfa4(s32, s32);
extern "C" void Sound_PlayEffectWithParameters(void *, s32, s32, ...);
extern "C" void Sound_PlayOwnedEffect(void *, s32, s32, ...);
extern "C" void Sound_StopEffect(void *, s32, ...);
extern "C" void Sound_SetEffectPitch(void *, s32, ...);
extern "C" s32 Sound_IsEffectPlaying(void *, s32, ...);
extern "C" void func_020a2614(void *, ...);
extern "C" void func_020a2960(void *, ...);
extern "C" s32 func_020adc90(s32, s32);
extern "C" void func_020adfbc(const void *, const void *, void *);
extern "C" s32 func_020ae024(s32, s32);
extern "C" s32 func_020befec(s32, s32);
extern "C" u32 genrand_int32(void);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" void *AuxiliaryTimedSpritePresentation_Init(void *, ...);

extern "C" void func_ov076_02212e18(void *, s32);
extern "C" void func_ov076_022135d0(void *, s32, s32, s32);
extern "C" void func_ov076_022135e0(void *, const void *, s32);
extern "C" void func_ov076_02213628(void *, s32);
extern "C" void func_ov076_02214034(void *, s32);
extern "C" void func_ov076_022145d8(void *, const void *, const void *);

static void *vmethod(void *actor, u32 offset) {
    return F(void *, F(void *, actor, 0), offset);
}

static s32 fx_mul(s32 lhs, s32 rhs) {
    return (s32)(((s64)lhs * rhs + 0x800) >> 12);
}

/* Construct the reactive linked actor and initialize its local timers. */
extern "C" void *func_ov076_02212ae0(void *actor, const void *config) {
    ActorExtendedLinked_Init(actor, config);
    F(void *, actor, 0) = data_ov076_02214950;
    F(u8, actor, 0x29c) = 3;
    F(u8, actor, 0x29d) = 0;
    F(u16, actor, 0x29e) = 0;
    F(u16, actor, 0x2a0) = 0;
    F(u16, actor, 0x2a2) = 600;
    F(u16, actor, 0x2a4) = 0;
    F(u16, actor, 0x2a6) = 0;
    F(u16, actor, 0x2a8) = 0;
    F(u16, actor, 0x2aa) = 10;
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~8u) | 0x220000;
    F(u16, actor, 0x64) = 0x20;
    F(s16, actor, 0x62) = -0x60;
    F(u16, actor, 0x66) = 0x10;
    return actor;
}

/* Destroy the linked actor while retaining its allocation. */
extern "C" void *func_ov076_02212b60(void *actor) {
    F(void *, actor, 0) = data_ov076_02214950;
    Sound_StopEffect(gSoundContext, 0x1c4, 8);
    ActorExtendedLinked_Destroy(actor);
    return actor;
}

/* Destroy and free the linked actor. */
extern "C" void *func_ov076_02212b9c(void *actor) {
    func_ov076_02212b60(actor);
    Heap_Free(actor);
    return actor;
}

/* Forward inherited presentation setup. */
extern "C" void func_ov076_02212be0(void *actor, const void *config) {
    ActorExtendedType2_InitializePresentation(actor);
    (void)config;
}

/* Select the body animation unless a special presentation owns the sprite. */
extern "C" void func_ov076_02212bec(void *actor) {
    if (F(u8, actor, 0x29c) & 0x18)
        return;

    s32 animation = F(s16, actor, 0xda);
    if (animation > 4)
        animation = 4;
    void *sprite = F(void *, actor, 0x54);
    if (F(u8, sprite, 0x38) != animation)
        GraphicsSpriteState_SetAnimationIndex(sprite, animation);
    F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & ~1u;
    F(u16, sprite, 0x30) = 0;
}

/* Track which side of the linked source the actor crossed and apply contact. */
extern "C" void func_ov076_02212c54(void *actor, void *other, s32 contact) {
    s32 dx = F(s32, other, 0x1c) - F(s32, actor, 0x1c);
    s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
    u8 flags = F(u8, actor, 0x29c);

    if (dx < 0) {
        if (!(flags & 1))
            F(s16, actor, 0x29e) += 30;
        flags |= 1;
    } else if (dx > 0 && (flags & 1)) {
        flags &= ~1u;
        F(s16, actor, 0x29e) += 30;
    }
    if (dy < 0) {
        if (!(flags & 2))
            F(s16, actor, 0x29e) += 30;
        flags |= 2;
    } else if (dy > 0 && (flags & 2)) {
        flags &= ~2u;
        F(s16, actor, 0x29e) += 30;
    }
    F(u8, actor, 0x29c) = flags;
    if (F(u16, actor, 0x29e) > 150)
        F(u16, actor, 0x29e) = 150;

    if (((Method0)vmethod(other, 8))(other)) {
        if (F(s16, actor, 0x2a2) > 30)
            F(s16, actor, 0x2a2) -= 30;
        if ((F(u32, other, 0x20c) & 0x1fff) < 15 &&
            (F(u16, actor, 0x29e) > 120 || F(s16, actor, 0x2a0) > 0)) {
            u8 impulse[16];
            VecFx32Object_Init(impulse);
            if (dx != 0 && dy != 0) {
                F(s32, impulse, 4) = dx;
                F(s32, impulse, 8) = dy;
                F(s32, impulse, 12) = 0;
                VecFx32Object_Normalize(impulse);
                func_ov076_02212e18(impulse, 0x1800);
            }
            ((Method2)vmethod(other, 0xb8))(other, impulse, 0);
            VecFx32Object_Destroy(impulse);
        }
    }
    ActorExtendedType2_ApplyContactResponse(actor, other, contact);
}

/* Report that this linked-actor callback has no immediate result. */
extern "C" s32 func_ov076_02212e10(void) {
    return 0;
}

/* Multiply every vector component by one fixed-point scalar. */
extern "C" void func_ov076_02212e18(void *vector, s32 scalar) {
    F(s32, vector, 4) = fx_mul(F(s32, vector, 4), scalar);
    F(s32, vector, 8) = fx_mul(F(s32, vector, 8), scalar);
    F(s32, vector, 12) = fx_mul(F(s32, vector, 12), scalar);
}

/* Forward actor interaction to the player pair before inherited handling. */
extern "C" void func_ov076_02212e70(void *actor, s32 interaction, s32 context,
                                    s32 extra) {
    void *secondary = F(void *, data_021052fc, 0x2ea8);
    if (secondary && !(F(u8, actor, 0x29c) & 0x18)) {
        void *primary = F(void *, data_021052fc, 0x2ea4);
        ActorDerivedType1_TrySetStateVector(primary, (u8 *)actor + 0x18, 0x14,
                                            0);
        Type7Actor_HandleObjectInteraction(secondary, actor);
    }
    Actor_SetInteractionFlag2000(actor, interaction);
    (void)context;
    (void)extra;
}

/* Advance boundary steering, impact feedback, particles, and looping audio. */
extern "C" s32 func_ov076_02212ee0(void *actor, s32, s32, s32) {
    F(u32, actor, 0x260) &= ~1u;
    void *sprite = F(void *, actor, 0x54);
    if (F(u16, sprite, 0x24) & 0x10)
        return 0;
    if (F(u16, actor, 0x29e))
        --F(u16, actor, 0x29e);

    if (F(u8, actor, 0x29c) & 0x18) {
        F(u16, actor, 0x2a0) = 0;
        F(u16, actor, 0x2a2) = 0xffff;
        func_ov076_022135d0((u8 *)actor + 0x38, 0, 0, 0);
        func_ov076_022135d0((u8 *)actor + 0x88, 0, 0, 0);
        func_ov076_022135d0((u8 *)actor + 0x98, 0, 0, 0);
        Sound_StopEffect(gSoundContext, 0x1c4, 8);
        return 0;
    }

    s16 *bounds = (s16 *)((u8 *)F(void *, actor, 0x278) + 4);
    s32 left = bounds[0];
    s32 top = bounds[1];
    s32 right = bounds[2];
    s32 bottom = bounds[3];
    u8 flags = F(u8, actor, 0x29c);
    if ((flags & 1) == 0) {
        if ((F(s32, actor, 0x1c) >> 12) < (s16)(left - (F(s8, actor, 8) - 4)))
            flags |= 1;
    } else if ((s16)(right - (F(s8, actor, 10) + 4)) <
               (F(s32, actor, 0x1c) >> 12)) {
        flags &= ~1u;
    }
    if ((flags & 2) == 0) {
        if ((F(s32, actor, 0x20) >> 12) < (s16)(top - (F(s8, actor, 9) - 4)))
            flags |= 2;
    } else if ((s16)(bottom - (F(s8, actor, 11) + 4)) <
               (F(s32, actor, 0x20) >> 12)) {
        flags &= ~2u;
    }
    F(u8, actor, 0x29c) = flags;

    bool moving = false;
    s16 target_volume;
    if (F(s16, actor, 0x252) == 0) {
        if (F(s16, actor, 0x2a4) < 1) {
            moving = true;
            if (F(s16, actor, 0x2a2) > 0 && --F(s16, actor, 0x2a2) == 0) {
                F(u16, actor, 0x2a0) = 180;
                F(u16, actor, 0x2a2) = 0x564;
            }
            VecFx32Object_Assign((u8 *)actor + 0x78, (u8 *)actor + 0x18);
            F(s32, actor, 0x7c) += (flags & 1) ? 0x8000 : -0x8000;
            F(s32, actor, 0x80) += (flags & 2) ? 0x6000 : -0x6000;
            ((Method1)vmethod(actor, 0xd0))(actor, (u8 *)actor + 0x78);

            if (F(s16, actor, 0x2a0) < 1) {
                if (F(u16, actor, 0x29e) < 120) {
                    target_volume = -0x80;
                } else {
                    func_ov076_02212e18((u8 *)actor + 0x38, 0x1333);
                    target_volume = 0x80;
                }
            } else {
                --F(s16, actor, 0x2a0);
                func_ov076_02212e18((u8 *)actor + 0x38, 0x1800);
                target_volume = 0x100;
            }
            u8 scaled[16];
            func_ov076_022135e0(scaled, (u8 *)actor + 0x38, 0xc000);
            VecFx32Object_Add((u8 *)actor + 0x88, scaled);
            VecFx32Object_Destroy(scaled);
            func_ov076_02213628((u8 *)actor + 0x38, 0x2000);
        } else {
            --F(s16, actor, 0x2a4);
            F(u16, actor, 0xd6) = 3;
            func_ov076_022135d0((u8 *)actor + 0x38, 0, 0, 0);
            F(u16, actor, 0x2a0) = 0;
            F(u16, actor, 0x2a2) = 0x564;
            target_volume = -0x80;
        }
        F(u32, actor, 0x260) |= 1;
    } else {
        F(u16, actor, 0xd6) = 0x16;
        func_ov076_022135d0((u8 *)actor + 0x38, 0, 0, 0);
        F(u16, actor, 0x2a0) = 0;
        F(u16, actor, 0x2a2) = 0x564;
        target_volume = -0x80;
    }

    F(u32, actor, 0x260) &= ~2u;
    if (!(F(u8, actor, 0x29c) & 4)) {
        if (F(s16, actor, 0x252) == 0) {
            F(u16, actor, 0xda) = 0;
        } else if (F(void *, actor, 0x298) &&
                   F(u8, F(void *, actor, 0x298), 0x2ce) > 12 &&
                   (F(s16, actor, 0x25a) & 7) == 0) {
            s32 state = F(s16, actor, 0xda);
            if (state > 4)
                state = 4;
            void *manager = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
            func_020a2960(manager, 0, F(s32, actor, 0x1c) >> 12,
                          ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) -
                              0x20 - state * 9,
                          0x7fff);
        }
    } else {
        F(u8, actor, 0x29c) &= ~4u;
        for (s32 i = 0; i < 4; ++i) {
            s32 angle = (((i - 1) * 0x2710 - 0xdac) & 0xffff) >> 4;
            void *manager = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
            func_020a2614(manager, 1,
                          (F(s32, actor, 0x1c) >> 12) +
                              ((data_020c9670[angle * 2] * 0x14) >> 12),
                          ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) +
                              6 + ((data_020c9670[angle * 2 + 1] * 9) >> 12),
                          0);
        }
        F(u16, actor, 0xda) = F(s16, actor, 0x252) == 0
                                  ? F(u8, actor, 0x29d)
                                  : F(s16, actor, 0xda) + F(u8, actor, 0x29d);
        F(u8, actor, 0x29d) = 0;
        Sound_PlayEffectWithParameters(gSoundContext, 0, 0x5b, 0x7f, 0,
                      F(s16, actor, 0xda) * 0xc0 - 0x300);
    }

    if (++F(s16, actor, 0x25a) > 0xff)
        F(u16, actor, 0x25a) = 0;
    if (F(s16, actor, 0x2a4) == 0) {
        if ((F(u16, actor, 0x2a6) & 7) == 0) {
            u8 position[16];
            VecFx32Object_InitCopy(position, (u8 *)actor + 0x18);
            u32 random = genrand_int32();
            F(s32, position, 4) += (s32)((random & 0x3f) << 12) - 0x20000;
            F(s32, position, 8) +=
                (s32)(((random >> 8) & 0x1f) << 12) - 0x10000;
            void *effect =
                Heap_Alloc(0x14, data_ov076_02214eec, 4, gHeapContext);
            if (effect) {
                random = genrand_int32();
                AuxiliaryTimedSpritePresentation_Init(
                    effect, position, F(void *, sprite, 0), 0x163c, 0x163d,
                    0x163e, random & 3, 4, -1, 1);
            }
            VecFx32Object_Destroy(position);
        }
        ++F(u16, actor, 0x2a6);
    }

    if (F(s16, actor, 0x2aa) < target_volume)
        F(s16, actor, 0x2aa) += 0x10;
    else if (F(s16, actor, 0x2aa) > target_volume)
        F(s16, actor, 0x2aa) -= 0x10;
    s32 playing = Sound_IsEffectPlaying(gSoundContext, 0x1c4);
    if (moving) {
        if (F(s16, actor, 0x2aa) == 0) {
            if (!playing)
                Sound_PlayOwnedEffect(gSoundContext, 0x1c4, 8, actor, 0, 0x100);
            Sound_SetEffectPitch(gSoundContext, 0x1c4, 8, F(s16, actor, 0x2a8));
        } else {
            --F(s16, actor, 0x2aa);
        }
    } else if (playing) {
        Sound_StopEffect(gSoundContext, 0x1c4, 8);
    }

    if (F(s16, actor, 0x2a0) > 0)
        F(u16, sprite, 0x36) = 0x300;
    else if (F(u16, actor, 0x29e) > 120)
        F(u16, sprite, 0x36) = 0x200;
    else
        F(u16, sprite, 0x36) = 0x100;
    return 0;
}

/* Store three vector components after an optional object header. */
extern "C" void func_ov076_022135d0(void *vector, s32 x, s32 y, s32 z) {
    u8 *components = vector ? (u8 *)vector + 4 : (u8 *)vector;
    *(s32 *)(components + 0) = x;
    *(s32 *)(components + 4) = y;
    *(s32 *)(components + 8) = z;
}

/* Construct a vector divided by a fixed-point scalar. */
extern "C" void func_ov076_022135e0(void *output, const void *input,
                                    s32 scalar) {
    VecFx32Object_Init(output);
    F(s32, output, 4) = func_020adc90(F(s32, input, 4), scalar);
    F(s32, output, 8) = func_020adc90(F(s32, input, 8), scalar);
    F(s32, output, 12) = func_020adc90(F(s32, input, 12), scalar);
}

/* Divide an existing vector by a fixed-point scalar. */
extern "C" void func_ov076_02213628(void *vector, s32 scalar) {
    F(s32, vector, 4) = func_020adc90(F(s32, vector, 4), scalar);
    F(s32, vector, 8) = func_020adc90(F(s32, vector, 8), scalar);
    F(s32, vector, 12) = func_020adc90(F(s32, vector, 12), scalar);
}

/* Accumulate a hit on the linked source and trigger impact feedback. */
extern "C" void func_ov076_02213664(void *actor) {
    void *source = F(void *, actor, 0x298);
    F(s32, source, 0x44) = 0x4000;
    F(s32, source, 0x2c4) = 0x4000;
    func_ov076_02214034(source, 0x20);
    (void)genrand_int32();
    F(u8, actor, 0x29c) |= 4;
    ++F(u8, actor, 0x29d);
    F(s16, actor, 0x2a4) += 60;
    if (F(s16, actor, 0x2a4) > 360)
        F(s16, actor, 0x2a4) = 360;
    Sound_Play(gSoundContext, 0x1c4, 1);
    func_02034a60(actor, 0xfd8d, F(u8, actor, 0x29d) * 60);
}

/* Scale an impulse and pass it to the inherited linked-actor response. */
extern "C" void func_ov076_022136f8(void *actor, const void *vector, s32 mode,
                                    s32 extra) {
    (void)extra;
    if (!(F(u32, actor, 0x260) & 0x8000)) {
        u8 scaled[16];
        func_ov076_022135e0(scaled, vector, 0x4000);
        Actor_ApplyMotionImpulse(actor, scaled, mode);
        VecFx32Object_Destroy(scaled);
    }
}

/* Enter the short hidden impact presentation. */
extern "C" void func_ov076_02213740(void *actor) {
    void *sprite = F(void *, actor, 0x54);
    GraphicsSpriteState_SetAnimationIndex(sprite, 5);
    F(u16, sprite, 0x36) = 0;
    F(u16, sprite, 0x24) &= ~3u;
    F(u8, actor, 0x29c) |= 8;
}

/* Enter the alternate bright impact presentation. */
extern "C" void func_ov076_02213780(void *actor) {
    void *sprite = F(void *, actor, 0x54);
    GraphicsSpriteState_SetAnimationIndex(sprite, 0x15);
    F(u16, sprite, 0x36) = 0x100;
    F(u16, sprite, 0x24) &= ~3u;
    F(u8, actor, 0x29c) = (F(u8, actor, 0x29c) & ~8u) | 0x10;
}

/* Construct the linked source and initialize its orbit/presentation state. */
extern "C" void *func_ov076_022137c8(void *actor, const void *config) {
    ActorExtendedLinkSource_Init(actor, config);
    F(void *, actor, 0) = data_ov076_02214d08;
    VecFx32Object_InitComponents((u8 *)actor + 0x2a8, 0, 0, 0x1b000);
    VecFx32Object_InitComponents((u8 *)actor + 0x2b8, 0, 0, 0);
    F(u16, actor, 0x2ca) = 0;
    F(u16, actor, 0x2cc) = 0;
    F(u8, actor, 0x2ce) = 0;
    F(u8, actor, 0x2cf) = 0;
    F(u16, actor, 0x2d0) = 0;
    F(u8, actor, 0x2d2) = 0;
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~8u) | 0x201000;
    F(u32, actor, 0x14) |= 0x40;
    F(u16, actor, 0x64) = 0;
    F(u16, actor, 0x60) = 0;
    return actor;
}

/* Destroy linked-source presentation state while retaining allocation. */
extern "C" void *func_ov076_02213858(void *actor) {
    F(void *, actor, 0) = data_ov076_02214d08;
    GraphicsSpriteState_ReleaseFromGroup(F(void *, actor, 0x2a0));
    GraphicsSpriteState_ReleaseFromGroup(F(void *, actor, 0x2a4));
    VecFx32Object_Destroy((u8 *)actor + 0x2b8);
    VecFx32Object_Destroy((u8 *)actor + 0x2a8);
    ActorExtendedLinkSource_Destroy(actor);
    return actor;
}

/* Destroy and free the linked source. */
extern "C" void *func_ov076_0221389c(void *actor) {
    func_ov076_02213858(actor);
    Heap_Free(actor);
    return actor;
}

/* Allocate the source's two auxiliary sprite states. */
extern "C" void func_ov076_022138e8(void *actor, const void *config) {
    ActorExtendedType2_InitializePresentation(actor);
    void *sprite = F(void *, actor, 0x54);
    F(u16, sprite, 0x24) |= 2;
    F(s16, actor, 0xda) = -1;
    GraphicsSpriteState_SetAnimationIndex(sprite, 0);

    const u32 resources[] = {0x20c, 0x210};
    const u32 slots[] = {0x2a0, 0x2a4};
    for (u32 i = 0; i < 2; ++i) {
        void *resource = F(void *, actor, resources[i]);
        void *owner =
            ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
        void *state = GraphicsSpriteGroup_CreateState(
            owner, F(s32, resource, 4), F(s32, resource, 8),
            F(s32, resource, 12), 2);
        F(void *, actor, slots[i]) = state;
        GraphicsSpriteState_SetAnimationIndex(state, i);
    }
    (void)config;
}

/* Select the source animation and restore normal sprite playback. */
extern "C" void func_ov076_02213974(void *actor) {
    void *sprite = F(void *, actor, 0x54);
    s32 animation = F(u16, actor, 0xda);
    if (F(u8, sprite, 0x38) != animation)
        GraphicsSpriteState_SetAnimationIndex(sprite, animation);
    F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & ~1u;
    F(u16, sprite, 0x36) = 0x100;
}

/* Mark the supplied interaction on the link-source actor. */
extern "C" void func_ov076_022139c8(void *actor, s32 interaction) {
    Actor_SetInteractionFlag2000(actor, interaction);
}

/* Advance the link source and mirror its partner's presentation state. */
extern "C" void func_ov076_022139d4(void *actor) {
    if (F(u32, actor, 0x14) & 0x200000)
        return;
    ActorExtendedLinkSource_UpdateFrame(actor);
    if (F(u32, actor, 0x29c) & 1) {
        F(u32, actor, 0x14) |= 6;
        void *partner = F(void *, actor, 0x298);
        F(u16, F(void *, actor, 0x54), 0x36) =
            F(u16, F(void *, partner, 0x54), 0x36);
    }
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~2u) | 1;
}

/* Simulate source orbit, bounce, pulse timers, and partner coupling. */
extern "C" void func_ov076_02213a3c(void *actor, s32, s32, s32) {
    s32 horizontal = F(s32, actor, 0x1c) - F(s32, actor, 0x2c);
    if (horizontal > 0) {
        F(s16, actor, 0x2cc) += 0x80;
        if (F(s16, actor, 0x2cc) > 0x1000)
            F(s16, actor, 0x2cc) = 0x1000;
    } else if (horizontal < 0) {
        F(s16, actor, 0x2cc) -= 0x80;
        if (F(s16, actor, 0x2cc) < -0x1000)
            F(s16, actor, 0x2cc) = -0x1000;
    } else {
        F(s16, actor, 0x2cc) =
            (s16)func_020befec(F(s16, actor, 0x2cc) * 19, 20);
    }

    s32 terrain;
    if (F(u32, actor, 0x29c) & 1) {
        void *partner = F(void *, actor, 0x298);
        s32 dx = F(s32, partner, 0x1c) - F(s32, actor, 0x1c);
        s32 dy = F(s32, partner, 0x20) - F(s32, actor, 0x20);
        terrain = F(s32, partner, 0x24) + 0xf000;
        s32 distance = func_0204cfa4(dx, dy);
        u8 direction[16];
        VecFx32Object_Init(direction);
        if (distance > 1) {
            func_ov076_022135d0(direction, dx * 2, dy * 2, 0);
            func_ov076_02213628(direction, distance);
            if (distance > 0x2000) {
                F(s32, actor, 0x1c) = F(s32, partner, 0x1c) -
                                      fx_mul(F(s32, direction, 4), 0x2000);
                F(s32, actor, 0x20) = F(s32, partner, 0x20) -
                                      fx_mul(F(s32, direction, 8), 0x2000);
            }
        }
        F(s32, actor, 0x3c) = F(s32, direction, 4);
        F(s32, actor, 0x40) = F(s32, direction, 8);
        if (F(u8, actor, 0x2ce) <= 10) {
            s32 gravity = ((Method0)vmethod(actor, 0xb0))(actor);
            F(s32, actor, 0x44) -= gravity * 2;
        } else {
            s32 heights[5];
            for (u32 i = 0; i < 5; ++i)
                heights[i] = F(s32, data_ov076_0221480c, i * 4);
            s32 state = F(s16, partner, 0xda);
            if (state > 4)
                state = 4;
            F(s32, actor, 0x44) =
                func_020befec(heights[state] - F(s32, actor, 0x24), 5);
        }
        VecFx32Object_Destroy(direction);
    } else {
        terrain = Actor_GetCachedTerrainHeight(actor);
        F(s32, actor, 0x44) -= ((Method0)vmethod(actor, 0xb0))(actor);
    }

    VecFx32Object_Assign((u8 *)actor + 0x28, (u8 *)actor + 0x18);
    VecFx32Object_Add((u8 *)actor + 0x18, (u8 *)actor + 0x38);
    if (F(s32, actor, 0x24) < terrain) {
        F(s32, actor, 0x24) = terrain;
        F(s32, actor, 0x44) = -(F(s32, actor, 0x44) / 2);
    }

    if (F(u8, actor, 0x2ce)) {
        --F(u8, actor, 0x2ce);
        if (F(u8, actor, 0x2ce))
            F(s32, actor, 0x44) = 0;
        s32 phase = (s32)(F(u8, actor, 0x2ce) << 28) >> 20;
        s32 scale = F(u8, actor, 0x2ce);
        if (scale > 16)
            scale = 16;
        F(u16, F(void *, actor, 0x54), 0x30) =
            (u16)((scale * 2 * data_020c9670[phase * 2]) / 64);
    }

    if (F(u8, actor, 0x2cf)) {
        --F(u8, actor, 0x2cf);
        s32 phase = (s32)(F(u8, actor, 0x2cf) << 27) >> 20;
        s32 scale = F(u8, actor, 0x2cf);
        if (scale > 16)
            scale = 16;
        F(s16, actor, 0x2ca) =
            (s16)func_020befec(scale * 2 * data_020c9670[phase * 2], -48);
    } else {
        F(s16, actor, 0x2ca) = 0;
    }

    F(s32, actor, 0x2ac) = F(s32, actor, 0x1c);
    F(s32, actor, 0x2b0) = F(s32, actor, 0x20);
    s32 gravity = ((Method0)vmethod(actor, 0xb0))(actor);
    F(s32, actor, 0x2c4) -= (gravity * 31) / 16;
    F(s32, actor, 0x2b4) += F(s32, actor, 0x2c4);
    if (F(s32, actor, 0x2b4) < F(s32, actor, 0x24) + 0x1b000) {
        F(s32, actor, 0x2b4) = F(s32, actor, 0x24) + 0x1b000;
        F(s32, actor, 0x2c4) = func_020befec(F(s32, actor, 0x2c4), -3);
    }

    if (F(u16, actor, 0xda) != F(u8, actor, 0x2d2))
        F(u16, actor, 0xda) = F(u8, actor, 0x2d2);
    if (F(void *, gGameWork, 0x3e4) && (F(u16, gSystemState, 6) & 0x100)) {
        u8 impulse[16];
        VecFx32Object_InitComponents(impulse, 0, 0, 0);
        void *partner = F(void *, actor, 0x298);
        ((Method2)vmethod(partner, 0xb8))(partner, impulse, 1);
        VecFx32Object_Destroy(impulse);
        ((void (*)(void *, s32))vmethod(partner, 0x1bc))(partner, 100);
    }
}

/* Forward the zero-mode descriptor notification. */
extern "C" void func_ov076_02213e4c(void *actor, void *descriptor) {
    ((Method2)vmethod(actor, 0x108))(actor, descriptor, 0);
}

/* Submit the source body and its two orbiting auxiliary sprite states. */
extern "C" void func_ov076_02213e64(void *context, void *actor,
                                    void *transform) {
    u8 palette = F(u8, F(void *, F(void *, actor, 0x298), 0x54), 0x3a);
    ActorExtendedType2_RunRenderCallback(context, actor, transform);
    F(u16, actor, 0x2d0) += 0x1000;
    s32 phase = F(u16, actor, 0x2d0) >> 4;
    s32 bob = data_020c9670[phase * 2];
    void *body = F(void *, actor, 0x54);
    F(s16, body, 0x2e) -= (s16)(bob >> 12);
    F(u8, body, 0x3a) = palette;
    F(s16, body, 0x28) =
        F(s16, F(void *, F(void *, actor, 0x298), 0x54), 0x28) - 0x20;

    u8 position[16];
    VecFx32Object_InitCopy(position, (u8 *)actor + 0x2a8);
    s8 bounds[4] = {-0x60, -0x50, 0x60, 0x20};
    F(s32, position, 12) += bob;
    void *first = F(void *, actor, 0x2a0);
    GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
        first, transform, bounds, F(s32, position, 4), F(s32, position, 8),
        F(s32, position, 12), 8);
    F(u16, first, 0x30) = F(u16, actor, 0x2ca);
    F(u8, first, 0x3a) = palette;
    F(s16, first, 0x28) = F(s16, body, 0x28) - 0x30;

    u8 orbit[16];
    VecFx32Object_Init(orbit);
    phase = F(u16, actor, 0x2ca) >> 4;
    F(s32, orbit, 4) -= data_020c9670[phase * 2] * 0x29;
    F(s32, orbit, 12) += data_020c9670[phase * 2 + 1] * 0x29;
    void *second = F(void *, actor, 0x2a4);
    GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
        second, transform, bounds, F(s32, orbit, 4), F(s32, orbit, 8),
        F(s32, orbit, 12), 8);
    F(s16, second, 0x30) = F(s16, actor, 0x2ca) + F(s16, actor, 0x2cc);
    F(u8, second, 0x3a) = palette;
    F(s16, second, 0x28) = F(s16, body, 0x28) + 0xc;
    VecFx32Object_Destroy(orbit);
    VecFx32Object_Destroy(position);
}

/* Extend both pulse timers, preserving their overlapping impact envelope. */
extern "C" void func_ov076_02214034(void *actor, s32 frames) {
    if (!F(u8, actor, 0x2ce))
        F(u8, actor, 0x2ce) = (u8)frames;
    else
        F(u8, actor, 0x2ce) += (u8)(frames / 2);
    if (F(u8, actor, 0x2cf))
        frames = F(u8, actor, 0x2cf) + frames / 2;
    F(u8, actor, 0x2cf) = (u8)frames;
}

/* Enter the visible link-source state. */
extern "C" void func_ov076_02214064(void *actor) {
    ActorExtendedLinkSource_ClearPartnerLinkedFlag(actor);
    F(u32, actor, 0x14) = (F(u32, actor, 0x14) & ~6u) | 0x10;
}

/* Enter the hidden link-source state. */
extern "C" void func_ov076_02214088(void *actor) {
    ActorExtendedLinkSource_ClearRuntimeFlag2(actor);
    F(u32, actor, 0x14) |= 6;
}

/* Construct the smaller linked follower actor. */
extern "C" void *func_ov076_022140a4(void *actor, const void *config) {
    ActorExtendedType2_Init(actor, config);
    F(void *, actor, 0) = data_ov076_02214b2c;
    F(void *, actor, 0x298) = 0;
    F(s32, actor, 0x29c) = 0;
    return actor;
}

/* Destroy the linked follower while retaining allocation. */
extern "C" void *func_ov076_022140d0(void *actor) {
    ActorExtendedType2_Destroy(actor);
    return actor;
}

/* Destroy and free the linked follower. */
extern "C" void *func_ov076_022140e4(void *actor) {
    ActorExtendedType2_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Update inherited animation and play subtype transition feedback. */
extern "C" void func_ov076_02214100(void *actor) {
    u8 old_animation = F(u8, F(void *, actor, 0x54), 0x38);
    ActorExtendedType2_UpdateFrame(actor);
    if ((u16)(F(s16, actor, 0xd6) - 5) > 1)
        return;
    u8 animation = F(u8, F(void *, actor, 0x54), 0x38);
    u16 sound = data_020e7444[F(u16, actor, 0x4e)];
    if (animation != old_animation && sound)
        func_02034a60(actor, sound, 0);
}

/* Maintain the follower's looping sound only in states five and six. */
extern "C" void func_ov076_0221416c(void *actor) {
    ActorExtendedType2_UpdateFrame(actor);
    s32 playing = Sound_IsEffectPlaying(gSoundContext, 0x1c4, 8);
    if ((u16)(F(s16, actor, 0xd6) - 5) < 2) {
        if (!playing)
            Sound_PlayOwnedEffect(gSoundContext, 0x1c4, 8, actor, 0, 0x100);
        Sound_SetEffectPitch(gSoundContext, 0x1c4, 8);
    } else if (playing) {
        Sound_StopEffect(gSoundContext, 0x1c4, 8);
    }
}

/* Resolve a descriptor interaction and clear the linked source on success. */
extern "C" s32 func_ov076_02214240(void *actor) {
    s32 result = ActorExtendedType2_TryDescriptorInteraction128(actor);
    if (result) {
        F(void *, actor, 0x298) = 0;
        s16 sound = data_020e6d3c[F(u16, actor, 0x4e)];
        if (sound)
            func_020349b8(actor, sound, 0);
    }
    return result;
}

/* Follow or orbit the selected actor until inherited interaction completes. */
extern "C" s32 func_ov076_02214288(void *actor, void *context, s32, s32 sign) {
    F(u32, actor, 0x260) |= 3;
    if (((Method0)vmethod(actor, 0x38))(actor))
        return 0;

    void *target = F(void *, actor, 0x228);
    if (!target) {
        ((void (*)(void *))vmethod(actor, 0xe8))(actor);
        return 0;
    }
    if (F(u16, context, 0x1a) & 2) {
        F(void *, actor, 0x218) = F(void *, data_ov076_02214848, 8);
        F(void *, actor, 0x21c) = F(void *, data_ov076_02214848, 12);
        return 0;
    }
    if (F(u32, target, 0xd0) & 0x100) {
        ((void (*)(void *))vmethod(actor, 0xe8))(actor);
        return 0;
    }
    if (((s32 (*)(void *, void *))vmethod(actor, 0x11c))(actor, context))
        return 0;

    if (F(s16, actor, 0x25a)) {
        --F(s16, actor, 0x25a);
        return 0;
    }
    if (F(u8, actor, 0x4b)) {
        if (!F(s32, actor, 0x298)) {
            F(s32, actor, 0x29c) ^= 1;
        } else {
            s32 distance =
                func_0204cfa4(F(s32, actor, 0x1c) - F(s32, actor, 0x2c),
                              F(s32, actor, 0x20) - F(s32, actor, 0x30));
            if (distance < 0xc00)
                F(s32, actor, 0x29c) ^= 1;
        }
        F(s32, actor, 0x298) = 30;
    }

    if (!F(s32, actor, 0x298)) {
        s32 dx = (F(s32, actor, 0x1c) - F(s32, target, 0x1c)) >> 12;
        s32 dy = (F(s32, actor, 0x20) - F(s32, target, 0x20)) >> 12;
        s32 radius = F(s16, context, 0x0a) + 0x20;
        if (dx * dx + dy * dy < radius * radius) {
            u8 position[16];
            VecFx32Object_InitCopy(position, (u8 *)actor + 0x18);
            F(s32, position, 4) += dx << 12;
            F(s32, position, 8) += dy << 12;
            F(u32, actor, 0xd0) |= 2;
            ((Method1)vmethod(actor, 0xd0))(actor, position);
            VecFx32Object_Destroy(position);
        } else {
            ((void (*)(void *))vmethod(actor, 0xe8))(actor);
        }
        return 0;
    }

    --F(s32, actor, 0x298);
    u8 delta[16];
    func_ov076_022145d8(delta, (u8 *)target + 0x18, (u8 *)actor + 0x18);
    s32 radius = ((30 - F(s32, actor, 0x298)) * 2 + 0x46) << 12;
    s32 angle = func_020ae024(F(s32, delta, 8), F(s32, delta, 4));
    sign = F(s32, actor, 0x29c) ? 1 : -1;
    angle = (angle + (((30 - F(s32, actor, 0x298)) * -100 + 0x2000) * sign)) &
            0xffff;
    s32 phase = angle >> 4;
    u8 position[16];
    VecFx32Object_InitComponents(
        position,
        F(s32, target, 0x1c) - fx_mul(data_020c9670[phase * 2 + 1], radius),
        F(s32, target, 0x20) - fx_mul(data_020c9670[phase * 2], radius),
        F(s32, actor, 0x24));
    F(u32, actor, 0xd0) |= 2;
    ((Method1)vmethod(actor, 0xd0))(actor, position);
    F(s32, actor, 0x3c) = fx_mul(F(s32, actor, 0x3c), 0x1800);
    F(s32, actor, 0x40) = fx_mul(F(s32, actor, 0x40), 0x1800);
    VecFx32Object_Destroy(position);
    VecFx32Object_Destroy(delta);
    return 0;
}

/* Construct lhs minus rhs as a VecFx32Object. */
extern "C" void func_ov076_022145d8(void *output, const void *lhs,
                                    const void *rhs) {
    VecFx32Object_Init(output);
    func_020adfbc(lhs ? (const u8 *)lhs + 4 : 0, rhs ? (const u8 *)rhs + 4 : 0,
                  (u8 *)output + 4);
}

/* Copy another actor's position into the caller-owned vector. */
extern "C" void func_ov076_02214610(void *output, void *actor) {
    VecFx32Object_InitCopy(output, (u8 *)actor + 0x18);
}

/* Return inherited capability bit 0x80. */
extern "C" u32 func_ov076_02214620(void *actor) {
    return F(u32, actor, 0xd0) & 0x80;
}

/* Report whether inherited capability bit 0x40 is set. */
extern "C" bool func_ov076_0221462c(void *actor) {
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Report no secondary interaction result. */
extern "C" s32 func_ov076_02214640(void) {
    return 0;
}

/* No-op primary notification. */
extern "C" void func_ov076_02214648(void) {
}

/* No-op secondary notification. */
extern "C" void func_ov076_0221464c(void) {
}

/* Return the fixed descriptor width. */
extern "C" s32 func_ov076_02214650(void) {
    return 0x10;
}

/* Return the actor's embedded position object. */
extern "C" void *func_ov076_02214658(void *actor) {
    return (u8 *)actor + 0x18;
}

/* Return the fixed interaction radius. */
extern "C" s32 func_ov076_02214660(void) {
    return 0xc0000;
}

/* Forward a descriptor notification with mode zero. */
extern "C" void func_ov076_02214668(void *actor, void *descriptor) {
    ((Method2)vmethod(actor, 0x108))(actor, descriptor, 0);
}

/* Report no tertiary query result. */
extern "C" s32 func_ov076_02214680(void) {
    return 0;
}

/* Mark the actor's pending target state. */
extern "C" void func_ov076_02214688(void *actor) {
    F(u32, actor, 0x260) |= 0x10;
}

/* Require armed and active state with no inherited block. */
extern "C" s32 func_ov076_02214698(void *actor) {
    if (!(F(u32, actor, 0x260) & 8))
        return 0;
    return (F(u32, actor, 0x260) & 2) &&
           !((Method0)vmethod(actor, 0xa8))(actor);
}

/* Test actor subtype eight. */
extern "C" bool func_ov076_022146e0(void *actor) {
    return F(u8, actor, 0x24c) == 8;
}

/* Reject only state 0x10. */
extern "C" bool func_ov076_022146f4(void *actor) {
    return F(s16, actor, 0xd6) != 0x10;
}

/* Test primary action states five and six. */
extern "C" bool func_ov076_02214714(void *actor) {
    return F(s16, actor, 0xd6) == 5 || F(s16, actor, 0xd6) == 6;
}

/* Test secondary action states nine and ten. */
extern "C" bool func_ov076_0221472c(void *actor) {
    return F(s16, actor, 0xd8) == 9 || F(s16, actor, 0xd8) == 10;
}

/* Test primary action states nine and ten. */
extern "C" bool func_ov076_02214744(void *actor) {
    return F(s16, actor, 0xd6) == 9 || F(s16, actor, 0xd6) == 10;
}

/* Return the first fixed presentation radius. */
extern "C" s32 func_ov076_0221475c(void) {
    return 0x800;
}

/* Return the second fixed presentation radius. */
extern "C" s32 func_ov076_02214764(void) {
    return 0x800;
}

/* No-op follower presentation callback. */
extern "C" void func_ov076_0221476c(void) {
}

/* No-op follower state callback. */
extern "C" void func_ov076_02214770(void) {
}

/* Toggle the follower's auxiliary sprite visibility. */
extern "C" void func_ov076_02214774(void *actor, s32 visible) {
    void *sprite = F(void *, actor, 0x288);
    if (visible)
        F(u16, sprite, 0x24) &= ~4u;
    else
        F(u16, sprite, 0x24) |= 4;
}

/* Return the linked actor's auxiliary radius. */
extern "C" s32 func_ov076_02214794(void) {
    return 0x20000;
}

/* Return the linked source's auxiliary radius. */
extern "C" s32 func_ov076_0221479c(void) {
    return 0x20000;
}

/* Allow interaction outside state 0x10 while the source is not attached. */
extern "C" s32 func_ov076_022147a4(void *actor) {
    return F(s16, actor, 0xd6) != 0x10 && !(F(u32, actor, 0x29c) & 1);
}

/* Return the fixed source motion duration. */
extern "C" s32 func_ov076_022147c8(void) {
    return 0x18;
}

/* No-op source target callback. */
extern "C" void func_ov076_022147d0(void) {
}

/* No-op source attachment callback. */
extern "C" void func_ov076_022147d4(void) {
}

/* No-op source completion callback. */
extern "C" void func_ov076_022147d8(void) {
}

/* Return the fixed source steering magnitude. */
extern "C" s32 func_ov076_022147dc(void) {
    return 0x10e000;
}

/* No-op source presentation callback. */
extern "C" void func_ov076_022147e8(void) {
}

/* Return the fixed source interaction duration. */
extern "C" s32 func_ov076_022147ec(void) {
    return 0x20;
}

/* Forward the source timeout to vmethod 0x1bc. */
extern "C" void func_ov076_022147f4(void *actor, s32 frames) {
    ((void (*)(void *, s32))vmethod(actor, 0x1bc))(actor, frames);
}

/* No-op final source callback. */
extern "C" void func_ov076_02214808(void) {
}
