#include "tingle/types.h"

/* Recovered overlay 78 collision actor and tracked-resource actor runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" void *gHeapContext;
extern "C" void *gSoundContext;
extern "C" u8 *data_021052fc;
extern "C" s16 data_020c9670[];
extern "C" u8 data_020e6adc[], data_020e6b74[], data_020e6c0c[], data_020e6ca4[];
extern "C" u8 gTrackedResourceActorRecordTable[];
extern "C" u8 data_ov078_02215c44[], data_ov078_02215c54[];
extern "C" u8 data_ov078_02215c88[], data_ov078_02215ca8[];
extern "C" u8 data_ov078_02215cc8[], data_ov078_02215cd0[];
extern "C" u8 data_ov078_02215cd8[], data_ov078_02215cf8[];
extern "C" u8 data_ov078_02215d00[], data_ov078_02215d18[];
extern "C" u8 data_ov078_02215d30[], data_ov078_02215d40[];
extern "C" u8 data_ov078_02215d48[], data_ov078_02215e10[];
extern "C" u8 data_ov078_02216028[], data_ov078_02216240[];
extern "C" u8 data_ov078_02216450[];

#define EXT(name) extern "C" s32 name(...)
EXT(func_02003e14);
EXT(func_02003e2c);
EXT(func_02004fe0);
EXT(func_0200500c);
EXT(func_02005030);
EXT(func_02005058);
EXT(VecFx32Object_GetMagnitude);
EXT(func_020050a4);
EXT(func_0201e0ec);
EXT(func_0201f864);
EXT(func_02030acc);
EXT(func_02032a94);
EXT(func_020337d4);
EXT(Actor_GetCachedTerrainHeight);
EXT(Actor_PlayHorizontalSpatialSound);
EXT(Actor_PlayRadialSpatialSound);
EXT(func_0203db80);
EXT(func_0203e494);
EXT(func_020405c8);
EXT(func_0204305c);
EXT(ActorExtendedType2_GetDescriptorValue2A);
EXT(func_02043610);
EXT(Fx32Vector2_Magnitude);
EXT(func_02050078);
EXT(func_02059394);
EXT(Sound_PlayOwnedEffect);
EXT(func_02072b68);
EXT(func_020740c8);
EXT(func_020a25c8);
EXT(func_020adae4);
EXT(func_020adc90);
EXT(func_020adfbc);
EXT(func_020adff0);
EXT(func_020ae024);
EXT(func_020be334);
EXT(func_020befec);
EXT(genrand_int32);
#undef EXT
extern "C" void ActorExtendedType2_InitializePresentation(...);
extern "C" void ActorExtendedType2_UpdateFrame(...);
extern "C" void ActorExtendedType2_LaunchRandomMotion(...);
extern "C" void VecFx32Object_InitCopy(...);

extern "C" s32 func_ov078_022134d0(void *, s32, s32);
extern "C" s32 func_ov078_02213838(void *);
extern "C" void func_ov078_02213ba8(void *, const void *, const void *);
extern "C" void func_ov078_02213c3c(void *, void *, s32, s32);
extern "C" void func_ov078_02213be0(void *);
extern "C" void func_ov078_0221361c(void *, void *, s32);
extern "C" void func_ov078_02214704(void *);
extern "C" void func_ov078_022147dc(void *, const void *, const void *);

static s32 Invoke(void *object, s32 offset)
{
    return ((Method)F(void *, F(void *, object, 0), offset))(object);
}

static s32 MulFx(s32 left, s32 right)
{
    return (s32)(((long long)left * right + 0x800) >> 12);
}

/* Constructs the shared collision actor, copying descriptor and motion data. */
extern "C" void *func_ov078_02212ae0(void *actor, void *descriptor, s32 arg2, s32 arg3)
{
    u8 config[48];
    func_0203db80(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov078_02215e10;
    ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, config);
    F(u16, actor, 0x298) = F(u16, actor, 0x29c) = 0;
    F(u16, actor, 0x29a) = 0xf0;
    F(u16, actor, 0x29e) = F(u16, actor, 0x2a2) = 0;
    F(u16, actor, 0x2a0) = F(u16, descriptor, 0x138);
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x10);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x14);
    F(s32, actor, 0x2ac) = 0;
    F(u32, actor, 0x260) |= 0x20;
    return actor;
}

/* Destroys the shared actor without releasing caller-owned storage. */
extern "C" void *func_ov078_02212b70(void *actor)
{
    func_0203e494(actor);
    return actor;
}

/* Destroys and releases the shared actor allocation. */
extern "C" void *func_ov078_02212b84(void *actor)
{
    func_0203e494(actor);
    func_02003e2c(actor);
    return actor;
}

/* Runs the non-deleting shared destructor variant. */
extern "C" void *func_ov078_02212ba0(void *actor)
{
    func_0203e494(actor);
    return actor;
}

/* Initializes the inherited presentation resources. */
extern "C" void func_ov078_02212bb4(void *actor)
{
    ActorExtendedType2_InitializePresentation(actor);
}

static void ConfigureSprite(void *actor, s32 animation, s32 clearMask, s32 setMask)
{
    void *resource = F(void *, actor, 0x208);
    func_020337d4(actor);
    s32 graphics = func_02030acc(actor);
    func_020740c8(graphics, F(void *, actor, 0x54), F(s32, resource, 4),
                  F(s32, resource, 8), F(s32, resource, 0xc));
    func_02072b68(F(void *, actor, 0x54), animation);
    F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~clearMask;
    F(u16, F(void *, actor, 0x54), 0x24) |= (u16)setMask;
}

/* Selects the retail sprite frame and visibility flags for the current state. */
extern "C" void func_ov078_02212bc0(void *actor)
{
    s32 state = F(s16, actor, 0xd6);
    s32 base = F(s8, actor, 0xd4);
    s32 animation = base;
    s32 clearMask = 1;
    s32 setMask = 2;
    bool configure = true;
    switch (state)
    {
    case 0: case 10: case 11: case 12: case 15: case 16: case 24:
        configure = false;
        break;
    case 1:
        animation = base + 8;
        setMask = 0;
        break;
    case 7:
        configure = data_020e6c0c[F(u16, actor, 0x4e)] != 0;
        animation = base + 30;
        clearMask = 3;
        setMask = 0;
        break;
    case 13:
        animation = base + 22;
        clearMask = 3;
        setMask = 0;
        break;
    case 14:
        animation = base + 30;
        break;
    case 17: case 23:
        configure = data_020e6b74[F(u16, actor, 0x4e)] != 0;
        animation = 0x11;
        clearMask = 3;
        setMask = 0;
        break;
    case 18:
        animation = 0x13;
        break;
    case 19:
        animation = data_020e6adc[F(u16, actor, 0x4e)] ? 0x10 : 0;
        clearMask = data_020e6adc[F(u16, actor, 0x4e)] ? 3 : 1;
        break;
    case 21:
        animation = base + 69;
        break;
    case 22:
        animation = F(u8, actor, 0x27e) == 1 ? base + 37 : 0x11;
        break;
    case 26: case 27:
        Invoke(actor, 0x1d4);
        return;
    default:
        break;
    }
    if (configure)
        ConfigureSprite(actor, animation, clearMask, setMask);
    F(u16, F(void *, actor, 0x54), 0x36) = state == 1 ? 0 : 0x100;
    F(u16, F(void *, actor, 0x54), 0x30) = 0;
}

/* Applies the two terminal sprite variants used by the launch state. */
extern "C" void func_ov078_02213280(void *actor)
{
    s32 state = F(s16, actor, 0xd6);
    if (state == 26 || state == 27)
        ConfigureSprite(actor, F(s8, actor, 0xd4) + (state == 26 ? 21 : 29), 1, 2);
    F(u16, F(void *, actor, 0x54), 0x36) = 0x100;
    F(u16, F(void *, actor, 0x54), 0x30) = 0;
}

/* Tests an interaction volume and advances the actor after its hit threshold. */
extern "C" s32 func_ov078_02213368(void *actor, void *other, void *contact, s32 arg)
{
    if ((F(u32, other, 0xd0) & 0x100) != 0)
        return 0;
    if (func_0204305c(actor, F(u16, contact, 0x1e) & 3, other, arg) == 0)
        return 0;
    if ((F(u16, contact, 0x1a) & 0x100) == 0 &&
        func_020be334(F(s32, actor, 0x24) - F(s32, other, 0x24)) > 0x27fff)
        return 0;
    bool inside = F(void *, actor, 0x278) != 0
                      ? func_ov078_022134d0(F(void *, actor, 0x278),
                                           F(s32, other, 0x1c), F(s32, other, 0x20)) != 0
                      : true;
    if (!inside)
    {
        F(u16, actor, 0x25e) = 0;
        return 0;
    }
    F(u16, actor, 0x25e) += F(s16, contact, 0x16);
    if (F(u16, actor, 0x25e) < 0x1770)
    {
        F(u8, actor, 0x24c) = 6;
        return 0;
    }
    ((Method)F(void *, F(void *, actor, 0), 0xd4))(actor, other);
    F(s32, actor, 0x220) = F(s32, data_ov078_02215c88, 0x38);
    F(s32, actor, 0x224) = F(s32, data_ov078_02215c88, 0x3c);
    Invoke(actor, 0x200);
    F(u16, actor, 0x298) = F(u16, actor, 0x29c) = 0;
    return 1;
}

/* Reports whether a point lies inside one of the stored axis-aligned regions. */
extern "C" s32 func_ov078_022134d0(void *regions, s32 x, s32 y)
{
    s32 px = (x << 4) >> 16;
    s32 py = (y << 4) >> 16;
    for (s32 i = 0; i < F(s32, regions, 8); ++i)
    {
        s16 *box = (s16 *)P(F(void *, regions, 4), i * 8);
        if (box[0] <= px && px < box[2] && box[1] <= py && py < box[3])
            return 1;
    }
    return 0;
}

/* Runs the current member-function state and an optional inherited update. */
extern "C" void func_ov078_02213574(void *actor)
{
    ((Method)F(void *, actor, 0x2a4))(actor);
    if (F(s16, actor, 0xac) != 0xff)
        ((Method)F(void *, F(void *, actor, 0), 0x40))(actor);
    F(void *, actor, 0x2ac) = 0;
}

/* Resolves collision response for ordinary, peer, and projectile contacts. */
extern "C" void func_ov078_0221361c(void *actor, void *other, s32 arg)
{
    s8 kind = F(s8, other, 0x4d);
    if (kind == 1 && (F(u32, actor, 0x260) & 8) == 0)
        ((Method)F(void *, F(void *, actor, 0), 0x1b4))(actor, other);
    else if (kind == 2 && func_ov078_02213838(other) && F(void *, other, 0x2ac) == 0)
    {
        s32 dx = F(s32, other, 0x1c) - F(s32, actor, 0x1c);
        s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
        s32 distance = Fx32Vector2_Magnitude(dx, dy);
        if (distance > 0x1000)
        {
            s32 vector[4];
            func_0200500c(vector, func_020adc90(dx, distance), func_020adc90(dy, distance), 0);
            ((Method)F(void *, F(void *, other, 0), 0xb8))(other, vector, 0);
            func_02005058(vector);
        }
        F(void *, other, 0x2ac) = actor;
    }
    F(void *, actor, 0x2ac) = other;
    func_02032a94(actor, other, arg);
}

/* Reports whether the peer actor is in a push-reactive subtype. */
extern "C" s32 func_ov078_02213838(void *actor)
{
    u32 index = (F(u8, actor, 0x27e) - 1) & 0xff;
    return index < 32 && ((1u << index) & 0x90000007u) != 0;
}

/* Reports the actor's guarded grounded state. */
extern "C" s32 func_ov078_02213864(void *actor)
{
    return (F(u32, actor, 0x260) & 8) != 0 &&
           ((F(u32, actor, 0x260) & 2) == 0 || Invoke(actor, 0xa8) == 0);
}

/* Returns the actor's high collision-response bit. */
extern "C" u32 func_ov078_022138ac(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Returns the fixed close-contact distance in fx32 units. */
extern "C" s32 func_ov078_022138b8(void)
{
    return 0x1000;
}

/* Transitions an eligible collision actor into its terminal response. */
extern "C" void func_ov078_022138c0(void *actor, void *other)
{
    if ((F(u32, other, 0xd0) & 0x100) == 0 && F(s16, other, 0x268) < 1)
        Actor_PlayHorizontalSpatialSound(actor, 0x3089, 0);
    F(u32, actor, 0x260) |= 0x10;
    Invoke(actor, 0x200);
}

/* Selects the initial retail state member and clears its timer. */
extern "C" void func_ov078_02213a3c(void *actor)
{
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x30);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x34);
    F(u16, actor, 0x298) = F(u16, actor, 0x29e) = 0;
    ++F(s16, actor, 0x29c);
}

/* Chooses the nearer valid tracked target from the two game-work slots. */
extern "C" void func_ov078_02213a74(void *actor, void *contact, void *fallback)
{
    (void)contact;
    void *work = F(void *, data_021052fc, 0);
    void *first = work ? F(void *, work, 0x2ea4) : 0;
    void *second = work ? F(void *, work, 0x2ea8) : fallback;
    if (second != 0 && (F(u32, second, 0x268) & 0x10) != 0)
        F(void *, actor, 0x228) = second;
    else if (first != 0)
        F(void *, actor, 0x228) = first;
}

/* Builds a direction vector between two embedded positions. */
extern "C" void func_ov078_02213ba8(void *out, const void *from, const void *to)
{
    func_02004fe0(out);
    func_020adfbc(from ? P((void *)from, 4) : 0, to ? P((void *)to, 4) : 0, P(out, 4));
}

/* Enters the shared active state and starts its presentation sound. */
extern "C" void func_ov078_02213be0(void *actor)
{
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~1u) | 10;
    F(u16, actor, 0x298) = 0;
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x68);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x6c);
    func_02059394(gSoundContext, 0, 0x10);
}

/* Returns the squared configured interaction radius. */
extern "C" s32 func_ov078_02213c30(void *, void *config)
{
    s32 radius = F(s16, config, 0x12);
    return radius * radius;
}

/* Runs pursuit steering or delegates to the actor's escape transition. */
extern "C" void func_ov078_02213c3c(void *actor, void *config, s32, s32)
{
    F(u32, actor, 0xd0) |= 2;
    F(u32, actor, 0x260) |= 3;
    F(u16, actor, 0xd6) = 6;
    if (Invoke(actor, 0x38) != 0 || (F(u16, config, 0x1a) & 2) != 0)
        return;
    void *target = F(void *, actor, 0x228);
    if (target == 0 || (F(u32, target, 0xd0) & 0x100) != 0)
    {
        Invoke(actor, 0xe8);
        return;
    }
    s32 dx = F(s32, actor, 0x1c) - F(s32, target, 0x1c);
    s32 dy = F(s32, actor, 0x20) - F(s32, target, 0x20);
    s32 vector[4];
    func_02005030(vector, P(actor, 0x18));
    s32 radius = F(s16, config, 0x12);
    s32 scale = dx * dx + dy * dy < radius * radius ? 0x1000 : -0x1000;
    F(s32, vector, 4) += dx * scale;
    F(s32, vector, 8) += dy * scale;
    ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, vector);
    F(u8, actor, 0x24c) = 2;
    func_02005058(vector);
}

/* Advances the launch timer and selects its early/late animation. */
extern "C" void func_ov078_02213e78(void *actor)
{
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~1u) | 10;
    F(u8, actor, 0x24c) = 8;
    ++F(s16, actor, 0x298);
    if (F(s16, actor, 0x298) == 30)
        func_02059394(gSoundContext, 0x61, 5);
    if (F(s16, actor, 0x298) <= F(s16, actor, 0x29a))
        F(u16, actor, 0xd6) = F(s16, actor, 0x298) < 61 ? 21 : 22;
    else
    {
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x58);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x5c);
        F(u16, actor, 0x298) = 0;
        F(u16, actor, 0xd6) = 22;
    }
}

/* Enters the inert terminal state and clears velocity. */
extern "C" void func_ov078_02213f24(void *actor)
{
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~3u) | 8;
    F(u8, actor, 0x24c) = 0;
    F(u16, actor, 0xd6) = 24;
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = F(s32, actor, 0x44) = 0;
}

/* Runs the delayed recovery state and restores its normal state member. */
extern "C" void func_ov078_02213f54(void *actor)
{
    F(u32, actor, 0x260) &= ~0xbu;
    F(u8, actor, 0x24c) = 8;
    F(u16, actor, 0xd6) = 23;
    if (++F(s16, actor, 0x298) >= 151)
    {
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 8);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0xc);
        F(u16, actor, 0x298) = 0;
        F(u32, actor, 0x260) &= ~0x40u;
    }
}

/* Runs the timed impact state and dispatches its next state after 60 frames. */
extern "C" void func_ov078_02213fbc(void *actor)
{
    F(u32, actor, 0x260) &= ~0xbu;
    F(u8, actor, 0x24c) = 2;
    F(u16, actor, 0xd6) = 25;
    if (++F(s16, actor, 0x298) > 60)
    {
        F(u16, actor, 0x29c) = 0;
        Invoke(actor, 0x200);
    }
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = 0;
}

/* Runs the timed neutral state and releases its suppression bit. */
extern "C" void func_ov078_02214020(void *actor)
{
    F(u32, actor, 0x260) &= ~0xbu;
    F(u8, actor, 0x24c) = 0;
    F(u16, actor, 0xd6) = 17;
    if (++F(s16, actor, 0x298) > 60)
    {
        Invoke(actor, 0x100);
        F(u32, actor, 0x260) &= ~0x40u;
    }
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = F(s32, actor, 0x44) = 0;
}

/* Implements an intentionally empty inherited callback. */
extern "C" void func_ov078_0221408c(void)
{
}

/* Constructs the bouncing collision-actor variant and its embedded vector. */
extern "C" void *func_ov078_02214090(void *actor, void *descriptor, s32 mode, s32 arg)
{
    func_ov078_02212ae0(actor, descriptor, mode, arg);
    F(void *, actor, 0) = data_ov078_02216240;
    func_0200500c(P(actor, 0x2b0), 0, 0, 0);
    F(s32, actor, 0x2c0) = mode;
    F(u16, actor, 0x2c4) = 0;
    F(s8, actor, 8) = -14;
    F(s8, actor, 9) = -10;
    F(s8, actor, 10) = 14;
    F(s8, actor, 11) = 6;
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x60);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x64);
    F(u16, actor, 0x2c6) = F(s16, actor, 0x4e) == 0x5e;
    return actor;
}

/* Stores four signed collision extents. */
extern "C" void func_ov078_02214124(void *out, s8 left, s8 top, s8 right, s8 bottom)
{
    F(s8, out, 0) = left;
    F(s8, out, 1) = top;
    F(s8, out, 2) = right;
    F(s8, out, 3) = bottom;
}

/* Destroys the bouncing variant without releasing storage. */
extern "C" void *func_ov078_0221413c(void *actor)
{
    func_02005058(P(actor, 0x2b0));
    func_0203e494(actor);
    return actor;
}

/* Destroys and releases the bouncing variant. */
extern "C" void *func_ov078_0221415c(void *actor)
{
    func_ov078_0221413c(actor);
    func_02003e2c(actor);
    return actor;
}

/* Arms the bouncing variant when its tracked target enters the valid region. */
extern "C" void func_ov078_02214184(void *actor, void *, void *target)
{
    void *regions = F(void *, actor, 0x278);
    if (regions != 0 && target != 0 &&
        func_ov078_022134d0(regions, F(s32, target, 0x1c), F(s32, target, 0x20)) == 0)
    {
        Invoke(actor, 0xe8);
        return;
    }
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 4);
    F(u16, actor, 0x298) = F(u16, actor, 0x29c) = 0;
    F(u32, actor, 0x260) &= ~8u;
    Sound_PlayOwnedEffect(gSoundContext, F(u16, actor, 0x2c6) ? 1 : 0x61, 3, actor, 0, 0x100);
    if (F(s32, actor, 0x2c0) == 0)
        F(u32, actor, 0x260) |= 10;
}

/* Decrements impact cooldown and runs the inherited frame update. */
extern "C" void func_ov078_022142b0(void *actor)
{
    if (F(s16, actor, 0x2c4) > 0)
        --F(s16, actor, 0x2c4);
    ActorExtendedType2_UpdateFrame(actor);
}

/* Implements an intentionally empty inherited callback. */
extern "C" void func_ov078_022142d0(void)
{
}

/* Applies peer collision impulses and records the last contacted actor. */
extern "C" void func_ov078_022142d4(void *actor, void *other, s32 arg)
{
    s8 kind = F(s8, other, 0x4d);
    if (kind == 1 && (F(u32, actor, 0x260) & 8) == 0)
        ((Method)F(void *, F(void *, actor, 0), 0x1b4))(actor, other);
    else if (kind == 2)
    {
        s32 dx = F(s32, other, 0x1c) - F(s32, actor, 0x1c);
        s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
        s32 distance = Fx32Vector2_Magnitude(dx, dy);
        if (distance > 0x1000)
        {
            s32 vector[4];
            func_0200500c(vector, func_020adc90(dx, distance), func_020adc90(dy, distance), 0);
            ((Method)F(void *, F(void *, other, 0), 0xb8))(other, vector, 0);
            F(s32, vector, 4) = -F(s32, vector, 4) / 2;
            F(s32, vector, 8) = -F(s32, vector, 8) / 2;
            ((Method)F(void *, F(void *, actor, 0), 0xb8))(actor, vector, 0);
            func_02005058(vector);
        }
        F(void *, other, 0x2ac) = actor;
    }
    F(void *, actor, 0x2ac) = other;
    func_02032a94(actor, other, arg);
}

/* Enters the active bouncing state and emits its high-stage cue when needed. */
extern "C" void func_ov078_022146c4(void *actor)
{
    func_ov078_02213be0(actor);
    F(u32, actor, 0x260) |= 8;
    if (ActorExtendedType2_GetDescriptorValue2A(actor) >= 2)
        Actor_PlayRadialSpatialSound(actor, 0x2a81, 0);
}

/* Spawns the retail contact particle at the actor's vertically adjusted pose. */
extern "C" void func_ov078_02214704(void *actor)
{
    s32 offset[4], position[4];
    func_0200500c(offset, 0, 0, ((F(s16, actor, 0x6e) - F(s16, actor, 0x6a)) / 2) << 12);
    func_ov078_022147dc(position, P(actor, 0x18), offset);
    func_02005058(offset);
    s32 effect = func_02003e14(0x14, data_ov078_02216450, 4, gHeapContext);
    if (effect != 0)
        func_0201f864(effect, position, F(void *, F(void *, actor, 0x54), 0),
                      0x1620, 0x1001, 0x1c40, (genrand_int32() & 1) + 1, -64, -1, 1);
    func_02005058(position);
}

/* Builds a translated position vector from two embedded vectors. */
extern "C" void func_ov078_022147dc(void *out, const void *left, const void *right)
{
    func_02004fe0(out);
    func_020adff0(left ? P((void *)left, 4) : 0, right ? P((void *)right, 4) : 0, P(out, 4));
}

/* Runs the bounce approach state and transitions to rebound after 111 frames. */
extern "C" void func_ov078_02214814(void *actor, void *config)
{
    void *target = F(void *, actor, 0x228);
    if (target == 0 || (F(u32, target, 0xd0) & 0x100) != 0)
    {
        Invoke(actor, 0xe8);
        return;
    }
    F(u32, actor, 0x260) |= 0x21;
    s32 dx = F(s32, target, 0x1c) - F(s32, actor, 0x1c);
    s32 dy = F(s32, target, 0x20) - F(s32, actor, 0x20);
    s32 vector[4];
    func_02005030(vector, P(actor, 0x18));
    s32 factor = ActorExtendedType2_GetDescriptorValue2A(actor) < 2 ? 0x4cd : 0xc00;
    F(s32, vector, 4) -= MulFx(dx, factor);
    F(s32, vector, 8) -= MulFx(dy, factor);
    ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, vector);
    if (F(s32, actor, 0x2c0) == 0)
    {
        F(s32, actor, 0x8c) = MulFx(F(s32, actor, 0x8c), 0xf0a);
        F(s32, actor, 0x90) = MulFx(F(s32, actor, 0x90), 0xf0a);
        F(s32, actor, 0x94) = MulFx(F(s32, actor, 0x94), 0xf0a);
    }
    if (++F(s16, actor, 0x298) < 111)
        F(u16, actor, 0xd6) = 26;
    else
    {
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0xb0);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0xb4);
        F(u16, actor, 0x298) = F(u16, actor, 0x29c) = 0;
        F(u16, actor, 0xd6) = 27;
        F(s32, actor, 0x2b4) = dx * 2;
        F(s32, actor, 0x2b8) = dy * 2;
        Sound_PlayOwnedEffect(gSoundContext, ActorExtendedType2_GetDescriptorValue2A(actor) < 2 ? 0x61 : 0x55,
                      0, actor, 0, 0x100);
    }
    F(u8, actor, 0x24c) = F(s32, actor, 0x2c0) ? 3 : 2;
    func_02005058(vector);
    (void)config;
}

/* Runs rebound motion, damping, contact reflection, and terminal dispatch. */
extern "C" void func_ov078_02214cb8(void *actor)
{
    void *target = F(void *, actor, 0x228);
    if (target == 0 || (F(u32, target, 0xd0) & 0x100) != 0)
    {
        Invoke(actor, 0xe8);
        return;
    }
    F(u32, actor, 0xd0) |= 2;
    F(u32, actor, 0x260) |= 0x21;
    s32 vector[4];
    func_02005030(vector, P(actor, 0x18));
    F(s32, vector, 4) += F(s32, actor, 0x2b4) + F(s32, target, 0x1c) - F(s32, actor, 0x1c);
    F(s32, vector, 8) += F(s32, actor, 0x2b8) + F(s32, target, 0x20) - F(s32, actor, 0x20);
    ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, vector);
    s32 stage = ActorExtendedType2_GetDescriptorValue2A(actor);
    s32 divisor = stage < 1 ? 6 : (stage == 1 ? 6 : 7);
    F(s32, actor, 0x8c) = func_020adae4(F(s32, actor, 0x3c) * 5 + F(s32, actor, 0x8c) * 4, divisor);
    F(s32, actor, 0x90) = func_020adae4(F(s32, actor, 0x40) * 5 + F(s32, actor, 0x90) * 4, divisor);
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = 0;
    F(u8, actor, 0x24c) = F(s32, actor, 0x2c0) ? 3 : 2;
    F(u16, actor, 0xd6) = 27;
    func_020befec(F(s16, actor, 0x298), 15);
    s32 limit = stage < 1 ? 120 : stage == 1 ? 105 : stage == 2 ? 80 : 70;
    if (++F(s16, actor, 0x298) > limit)
        Invoke(actor, 0x200);
    else if ((F(u32, actor, 0x260) & 0x80) != 0)
    {
        Invoke(actor, 0x204);
        func_ov078_02214704(actor);
        F(s32, actor, 0x44) = 0x3000;
        F(u16, actor, 0x29e) = 0;
    }
    func_02005058(vector);
}

/* Applies pursuit steering and retail damping to the base active state. */
extern "C" void func_ov078_02215244(void *actor, void *config)
{
    func_ov078_02213c3c(actor, config, 0, 0);
    F(s32, actor, 0x8c) = func_020adae4(F(s32, actor, 0x8c) * 24 +
                                        MulFx(F(s32, actor, 0x3c), 0x3000), 25);
    F(s32, actor, 0x90) = func_020adae4(F(s32, actor, 0x90) * 24 +
                                        MulFx(F(s32, actor, 0x40), 0x3000), 25);
    F(s32, actor, 0x3c) = MulFx(F(s32, actor, 0x3c), 0x19a);
    F(s32, actor, 0x40) = MulFx(F(s32, actor, 0x40), 0x19a);
}

/* Constructs the tracked-resource actor and selects its descriptor record. */
extern "C" void *func_ov078_02215338(void *actor, void *descriptor, s32 arg2, s32 arg3)
{
    u8 config[48];
    func_ov078_02212ae0(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov078_02216028;
    F(u16, actor, 0x2b0) = F(u16, actor, 0x2b4) = F(u16, actor, 0x2bc) = 0;
    F(s8, actor, 8) = -14;
    F(s8, actor, 9) = -10;
    F(s8, actor, 10) = 14;
    F(s8, actor, 11) = 6;
    ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, config);
    void *record = 0;
    for (s32 i = 0; i < 67; ++i)
        if (F(s16, gTrackedResourceActorRecordTable, i * 0x32) == F(s8, config, 41))
            record = P(gTrackedResourceActorRecordTable, i * 0x32);
    F(void *, actor, 0x2b8) = record;
    if (record != 0)
    {
        F(u16, actor, 0x2b2) = F(u16, record, 0x22);
        F(u16, actor, 0x2b6) = F(u16, record, 0x26);
    }
    return actor;
}

/* Destroys the tracked-resource actor without releasing storage. */
extern "C" void *func_ov078_022153f0(void *actor)
{
    func_0203e494(actor);
    return actor;
}

/* Destroys and releases the tracked-resource actor. */
extern "C" void *func_ov078_02215404(void *actor)
{
    func_0203e494(actor);
    func_02003e2c(actor);
    return actor;
}

/* Restores the tracked resource's configured counters. */
extern "C" void func_ov078_02215420(void *actor)
{
    F(u16, actor, 0x2b0) = F(u16, actor, 0x2b2);
    F(u16, actor, 0x2b4) = F(u16, actor, 0x2b6);
}

/* Forwards collision handling to the shared overlay implementation. */
extern "C" void func_ov078_02215438(void *actor, void *other, s32 arg)
{
    func_ov078_0221361c(actor, other, arg);
}

/* Runs the resource actor's approach cycle and enters its launch state. */
extern "C" void func_ov078_02215444(void *actor, void *config)
{
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~0x20u) | 0xb;
    if (F(s16, actor, 0x2b0) == F(s16, actor, 0x2b2))
    {
        F(u16, actor, 0x2a2) = genrand_int32() & 1;
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0xa0);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0xa4);
        F(u16, actor, 0x298) = 0;
        F(u16, actor, 0xd6) = 14;
        Actor_PlayRadialSpatialSound(actor, 0x5e, 0);
        return;
    }
    func_ov078_02213a74(actor, config, 0);
    ++F(s16, actor, 0x2b0);
    F(u32, actor, 0x260) |= 0x20;
    func_ov078_02213c3c(actor, config, 0, 0);
}

/* Runs the resource actor's orbiting launch and transitions after 30 frames. */
extern "C" void func_ov078_02215508(void *actor, void *config)
{
    F(u32, actor, 0x260) |= 0x2b;
    ++F(s16, actor, 0x298);
    if (F(s16, actor, 0x298) < 30)
    {
        void *target = F(void *, actor, 0x228);
        if (target != 0)
        {
            s32 dx = F(s32, target, 0x1c) - F(s32, actor, 0x1c);
            s32 dy = F(s32, target, 0x20) - F(s32, actor, 0x20);
            s32 vector[4];
            func_0200500c(vector, F(s32, target, 0x1c) - dy,
                          F(s32, target, 0x20) + dx, F(s32, actor, 0x24));
            ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, vector);
            func_02005058(vector);
        }
        F(u8, actor, 0x24c) = 2;
        F(u16, actor, 0xd6) = 14;
        return;
    }
    F(u16, actor, 0x2b0) = F(u16, actor, 0x2b4) = 0;
    F(u16, actor, 0xd6) = 13;
    F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x88);
    F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x8c);
    (void)config;
}

/* Oscillates around the target until the configured resource delay expires. */
extern "C" void func_ov078_02215808(void *actor, void *config)
{
    F(u32, actor, 0x260) |= 0x2b;
    if (F(s16, actor, 0x2b4) < F(s16, actor, 0x2b6))
    {
        ++F(s16, actor, 0x2b4);
        void *target = F(void *, actor, 0x228);
        if (target != 0)
        {
            s32 dx = (F(s32, actor, 0x1c) - F(s32, target, 0x1c)) >> 12;
            s32 dy = (F(s32, actor, 0x20) - F(s32, target, 0x20)) >> 12;
            s32 radius = F(s16, config, 0x12);
            s32 scale = dx * dx + dy * dy < radius * radius ? 0x1000 : -0x1000;
            s32 vector[4];
            func_02005030(vector, P(actor, 0x18));
            F(s32, vector, 4) += dx * scale;
            F(s32, vector, 8) += dy * scale;
            ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, vector);
            func_02005058(vector);
        }
        F(s32, actor, 0x3c) = func_020adae4(F(s32, actor, 0x3c), 2);
        F(s32, actor, 0x40) = func_020adae4(F(s32, actor, 0x40), 2);
    }
    else
    {
        F(u16, actor, 0x2b0) = 0;
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x80);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x84);
    }
    F(u16, actor, 0xd6) = 13;
}

/* Runs the reverse orbit until its countdown reaches zero. */
extern "C" void func_ov078_0221592c(void *actor, void *config)
{
    F(u32, actor, 0x260) |= 0x2b;
    if (F(s16, actor, 0x298) < 1)
    {
        F(u16, actor, 0x2b0) = 0;
        F(s32, actor, 0x2a4) = F(s32, data_ov078_02215c88, 0x28);
        F(s32, actor, 0x2a8) = F(s32, data_ov078_02215c88, 0x2c);
    }
    else
    {
        --F(s16, actor, 0x298);
        F(s32, actor, 0x3c) *= 3;
        F(s32, actor, 0x40) *= 3;
    }
    F(u16, actor, 0xd6) = 13;
    (void)config;
}

/* Enters the resource actor's shared active state and clears its counters. */
extern "C" void func_ov078_02215a80(void *actor)
{
    func_ov078_02213be0(actor);
    F(u16, actor, 0x2b4) = F(u16, actor, 0x2b0) = 0;
}

/* Returns the squared sinusoidally adjusted interaction radius. */
extern "C" s32 func_ov078_02215aa0(void *actor, void *config)
{
    s32 radius = F(s16, config, 0x12) +
                 (data_020c9670[(F(u16, actor, 0x2bc) >> 4) * 2] >> 9);
    F(u16, actor, 0x2bc) += 0x200;
    return radius * radius;
}

/* Returns the default result for an unused actor query. */
extern "C" s32 func_ov078_02215ad4(void)
{
    return 0;
}

/* Forwards a vector query to the inherited implementation. */
extern "C" void func_ov078_02215adc(void *actor, void *other)
{
    VecFx32Object_InitCopy(actor, P(other, 0x18));
}

/* Reports the actor's secondary collision-response bit. */
extern "C" s32 func_ov078_02215aec(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Returns the default result for an unused interaction query. */
extern "C" s32 func_ov078_02215b00(void)
{
    return 0;
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov078_02215b08(void)
{
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov078_02215b0c(void)
{
}

/* Returns the actor's fixed presentation layer. */
extern "C" s32 func_ov078_02215b10(void)
{
    return 0x10;
}

/* Returns an object's embedded position vector. */
extern "C" void *func_ov078_02215b18(void *object)
{
    return P(object, 0x18);
}

/* Returns the actor's fixed pursuit distance in fx32 units. */
extern "C" s32 func_ov078_02215b20(void)
{
    return 0xc0000;
}

/* Invokes the inherited contact method with the retail null mode. */
extern "C" void func_ov078_02215b28(void *actor, void *other)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, other, 0);
}

/* Invokes the alternate vtable's inherited contact method. */
extern "C" void func_ov078_02215b40(void *actor, void *other)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, other, 0);
}

/* Returns the default result for an unused range query. */
extern "C" s32 func_ov078_02215b58(void)
{
    return 0;
}

/* Reports the terminal animation phase byte. */
extern "C" s32 func_ov078_02215b60(void *actor)
{
    return F(s8, actor, 0x24c) == 8;
}

/* Reports whether the actor has not entered animation 16. */
extern "C" s32 func_ov078_02215b74(void *actor)
{
    return F(s16, actor, 0xd6) != 16;
}

/* Reports either primary walking animation. */
extern "C" s32 func_ov078_02215b94(void *actor)
{
    return F(s16, actor, 0xd6) == 5 || F(s16, actor, 0xd6) == 6;
}

/* Reports either secondary attack animation. */
extern "C" s32 func_ov078_02215bac(void *actor)
{
    return F(s16, actor, 0xd8) == 9 || F(s16, actor, 0xd8) == 10;
}

/* Reports either primary attack animation. */
extern "C" s32 func_ov078_02215bc4(void *actor)
{
    return F(s16, actor, 0xd6) == 9 || F(s16, actor, 0xd6) == 10;
}

/* Returns the first fixed close-contact threshold. */
extern "C" s32 func_ov078_02215bdc(void)
{
    return 0x800;
}

/* Returns the second fixed close-contact threshold. */
extern "C" s32 func_ov078_02215be4(void)
{
    return 0x800;
}

/* Implements an intentionally empty lifecycle hook. */
extern "C" void func_ov078_02215bec(void)
{
}

/* Toggles the actor's auxiliary sprite suppression bit. */
extern "C" void func_ov078_02215bf0(void *actor, s32 enabled)
{
    void *sprite = F(void *, actor, 0x288);
    if (enabled == 0)
        F(u16, sprite, 0x24) |= 4;
    else
        F(u16, sprite, 0x24) &= 0xfffb;
}

/* Returns the fixed collision radius in fx32 units. */
extern "C" s32 func_ov078_02215c10(void)
{
    return 0x20000;
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov078_02215c18(void)
{
}

/* Enables the actor's high response bit. */
extern "C" void func_ov078_02215c1c(void *actor)
{
    F(u32, actor, 0x260) |= 0x80;
}

/* Launches inherited randomized motion. */
extern "C" void func_ov078_02215c2c(void *actor)
{
    ActorExtendedType2_LaunchRandomMotion(actor);
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov078_02215c38(void)
{
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov078_02215c3c(void)
{
}
