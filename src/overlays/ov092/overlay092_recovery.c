#include "tingle/game_phase_currency_hud.h"
#include "tingle/types.h"

/* Recovered overlay 92 multi-actor encounter and tracked attacker runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" void *gGameWork;
extern "C" void *gSceneManager;
extern "C" void *gHeapContext;
extern "C" void *gSoundContext;
extern "C" u8 *data_021052fc;
extern "C" u8 data_020c9670[];
extern "C" void *data_020f4e14;
extern "C" u8 gSystemState[];
extern "C" u8 data_ov092_0221b17c[];
extern "C" u8 data_ov092_0221b1e0[];
extern "C" u8 data_ov092_0221b1f0[];
extern "C" u8 data_ov092_0221b200[];
extern "C" u8 data_ov092_0221b210[];
extern "C" u8 data_ov092_0221b220[];
extern "C" u8 data_ov092_0221b238[];
extern "C" u8 data_ov092_0221b250[];
extern "C" u8 data_ov092_0221b270[];
extern "C" u8 data_ov092_0221b290[];
extern "C" u8 data_ov092_0221b2b8[];
extern "C" u8 data_ov092_0221b2e0[];
extern "C" u8 data_ov092_0221b308[];
extern "C" u8 data_ov092_0221b30e[];
extern "C" u8 data_ov092_0221b314[];
extern "C" u8 data_ov092_0221b31a[];
extern "C" u8 data_ov092_0221b320[];
extern "C" u8 data_ov092_0221b326[];
extern "C" u8 data_ov092_0221b32c[];
extern "C" u8 data_ov092_0221b332[];
extern "C" u8 data_ov092_0221b338[];
extern "C" u8 data_ov092_0221b33e[];
extern "C" u8 data_ov092_0221b344[];
extern "C" u8 data_ov092_0221b34a[];
extern "C" u8 data_ov092_0221b356[];
extern "C" u8 data_ov092_0221b3de[];
extern "C" u8 data_ov092_0221b466[];
extern "C" u8 data_ov092_0221b4f6[];
extern "C" u8 data_ov092_0221b586[];
extern "C" u8 data_ov092_0221b616[];
extern "C" u8 data_ov092_0221b6a6[];
extern "C" u8 data_ov092_0221b766[];
extern "C" u8 data_ov092_0221b826[];
extern "C" u8 data_ov092_0221b8e6[];
extern "C" u8 data_ov092_0221b9a6[];
extern "C" u8 data_ov092_0221ba66[];
extern "C" u8 data_ov092_0221bb26[];
extern "C" u8 data_ov092_0221bbe6[];
extern "C" u8 data_ov092_0221bca6[];
extern "C" u8 data_ov092_0221bd66[];
extern "C" u8 data_ov092_0221be26[];
extern "C" u8 data_ov092_0221bee6[];
extern "C" u8 data_ov092_0221bfa6[];
extern "C" u8 data_ov092_0221c066[];
extern "C" u8 data_ov092_0221c126[];
extern "C" u8 data_ov092_0221c1e6[];
extern "C" u8 data_ov092_0221c2d6[];
extern "C" u8 data_ov092_0221c406[];
extern "C" u8 data_ov092_0221c728[];
extern "C" u8 data_ov092_0221c818[];
extern "C" u8 data_ov092_0221c820[];
extern "C" u8 data_ov092_0221c828[];
extern "C" u8 data_ov092_0221c834[];
extern "C" u8 data_ov092_0221c8c4[];
extern "C" u8 data_ov092_0221c99c[];

#define EXT(name) extern "C" s32 name(...)
EXT(func_02001944);
EXT(func_0200199c);
EXT(func_0200222c);
EXT(func_020022dc);
EXT(func_0200323c);
EXT(func_02003e14);
EXT(func_02003e2c);
EXT(func_02004fe0);
EXT(func_0200500c);
EXT(func_02005030);
EXT(func_02005058);
EXT(VecFx32Object_GetMagnitude);
EXT(func_020050a4);
EXT(func_02005580);
EXT(func_02005afc);
EXT(func_02005c3c);
EXT(func_0200634c);
EXT(func_0200637c);
EXT(func_020064b8);
EXT(func_02007f0c);
EXT(RuntimePresentationManager_GetGraphics3dPresentation);
EXT(func_0201f864);
EXT(func_0201fafc);
EXT(func_02030acc);
EXT(func_02032cac);
EXT(func_02032de4);
EXT(Actor_UpdatePresentation);
EXT(func_020337d4);
EXT(func_020390c8);
EXT(ActorDerivedType1_GetActiveRecordId);
EXT(func_0203bae4);
EXT(func_0203c660);
EXT(func_0204b078);
EXT(Fx32Vector2_Magnitude);
EXT(Fx32Vector2_LimitMagnitude);
EXT(func_0204d308);
EXT(func_0204d3d8);
EXT(func_0204d520);
EXT(func_0204d570);
EXT(func_02050078);
EXT(func_02050260);
EXT(func_02050560);
EXT(func_02050a08);
EXT(func_02050a78);
EXT(func_02050a8c);
EXT(func_02050b70);
EXT(func_02050e2c);
EXT(func_02059278);
EXT(func_0205929c);
EXT(Sound_IsDirectSequencePlaying);
EXT(func_02059394);
EXT(Sound_PlayEffectWithParameters);
EXT(Sound_StopEffect);
EXT(Sound_SetEffectParameters);
EXT(func_02072b68);
EXT(func_02075858);
EXT(func_020adae4);
EXT(func_020adc90);
EXT(func_020adff0);
EXT(func_020ae024);
EXT(func_020afce8);
EXT(func_020be334);
EXT(func_020befec);
EXT(func_020bf1f8);
EXT(func_020c0a88);
EXT(func_020c0bc8);
EXT(func_ov060_0220fd54);
EXT(genrand_int32);
EXT(VecFx32Object_InitCopy);
#undef EXT

extern "C" void func_ov092_02217834(void *, void *);
extern "C" s32 func_ov092_02218380(void *, s32, s32);
extern "C" void func_ov092_02218394(void *, s32, s32, s16);
extern "C" s32 func_ov092_022183b8(void *);
extern "C" void func_ov092_022185c4(void *);
extern "C" void func_ov092_02218584(void *);
extern "C" void func_ov092_022185a4(void *);
extern "C" void *func_ov092_022191f4(void *, void *, void *, void *);
extern "C" void func_ov092_0221893c(void *);
extern "C" void func_ov092_02219238(void *);
extern "C" void func_ov092_022192b0(void *);
extern "C" void func_ov092_022192c8(void *);
extern "C" s32 func_ov092_022196d0(void *);
extern "C" void func_ov092_02219e54(void *, void *, void *);
extern "C" void func_ov092_02219e8c(void *);
extern "C" void func_ov092_02219fc8(void *, const void *);
extern "C" void func_ov092_02219fec(void *);
extern "C" void func_ov092_0221a118(void *);
extern "C" s32 func_ov092_0221a6d4(void *);
extern "C" void func_ov092_0221ad28(void *, s32);
extern "C" void func_ov092_0221ada4(void *);

static void CallMethod(void *object, u32 offset)
{
    ((Method)F(u32, F(void *, object, 0), offset))(object);
}

/* Initializes a looping cursor over signed XY/frame path records. */
extern "C" void func_ov092_022177e0(void *cursor, const void *records,
                                    s16 count, s32 index, u8 repeat)
{
    F(const void *, cursor, 4) = records;
    F(s16, cursor, 8) = count;
    F(s16, cursor, 0) = (s16)index;
    F(s16, cursor, 2) = F(s16, records, index * 8 + 4);
    F(u8, cursor, 10) = repeat;
    F(u8, cursor, 11) = 0;
}

/* Advances a path cursor and writes its interpolated position. */
extern "C" void func_ov092_02217810(void *cursor, void *position)
{
    func_ov092_02217834(cursor, position);
    if (F(u8, cursor, 11) == 0)
        ++F(s16, cursor, 2);
}

/* Samples the current path segment as 20.12 fixed-point XY. */
extern "C" void func_ov092_02217834(void *cursor, void *position)
{
    s32 index = F(s16, cursor, 0);
    const u8 *records = (const u8 *)F(const void *, cursor, 4);
    if (F(s16, records, index * 8 + 4) <= F(s16, cursor, 2))
    {
        if (F(u8, cursor, 10) == 0 && F(s16, cursor, 8) - 1 <= index)
        {
            F(u8, cursor, 11) = 1;
        }
        else
        {
            index = (index + 1) % F(s16, cursor, 8);
            F(s16, cursor, 0) = (s16)index;
            F(s16, cursor, 2) = 0;
        }
    }
    index = F(s16, cursor, 0);
    s32 previous = index < 1 ? F(s16, cursor, 8) - 1 : index - 1;
    s32 duration = F(s16, records, index * 8 + 4);
    s32 oldX = F(s16, records, previous * 8);
    s32 oldY = F(s16, records, previous * 8 + 2);
    F(s32, position, 4) =
        (oldX +
         F(s16, cursor, 2) * (F(s16, records, index * 8) - oldX) / duration)
        << 12;
    F(s32, position, 8) =
        (oldY +
         F(s16, cursor, 2) * (F(s16, records, index * 8 + 2) - oldY) / duration)
        << 12;
}

/* Returns the animation index on the current path record. */
extern "C" s32 func_ov092_02217914(const void *cursor)
{
    const u8 *records = (const u8 *)F(const void *, cursor, 4);
    return F(s16, records, F(s16, cursor, 0) * 8 + 6);
}

/* Matching vtable leaf with no observable effect. */
extern "C" void func_ov092_02217928(void)
{
}

/* Matching destructor callback with no observable effect. */
extern "C" void func_ov092_0221792c(void)
{
}

/* Writes an embedded VecFx32 after its four-byte owner header. */
extern "C" void func_ov092_02217930(void *object, s32 x, s32 y, s32 z)
{
    u8 *vector = object != 0 ? (u8 *)object + 4 : (u8 *)object;
    F(s32, vector, 0) = x;
    F(s32, vector, 4) = y;
    F(s32, vector, 8) = z;
}

/* Constructs the encounter scene and binds its eight category-one actors. */
extern "C" void *func_ov092_02217940(void *scene)
{
    func_0204d520(scene);
    F(void *, scene, 0) = data_ov092_0221c728;
    F(u8, scene, 0x1ec) = F(u8, scene, 0x1ed) = 0;
    F(s16, scene, 0x1ee) = 0;
    func_020c0a88(P(scene, 0x1f0), 5, 12, func_ov092_02217928,
                  func_ov092_0221792c);
    F(void *, scene, 0x240) = 0;
    F(u8, scene, 0x278) = F(u8, scene, 0x279) = 0;
    F(s16, scene, 0x27a) = F(s16, scene, 0x284) = 0;
    F(s16, scene, 0x286) = F(s16, scene, 0x288) = 0;
    F(s16, scene, 0x28a) = F(s16, scene, 0x28e) = 0;
    F(s16, scene, 0x28c) = -1;
    F(s16, scene, 0x298) = F(s16, scene, 0x29a) = 0;
    F(s16, scene, 0x29c) = F(s16, scene, 0x29e) = 0;
    F(u8, scene, 0x2a0) = F(u8, scene, 0x2a1) = 0;
    F(s16, scene, 0x2a2) = 0;

    void *collection = (void *)func_02007f0c(F(void *, data_021052fc, 0), 1);
    s32 found = 0;
    for (s32 i = 0; i < F(s32, collection, 0x2e74); ++i)
    {
        void *actor = F(void *, collection, i * 4);
        if (actor == 0 || F(u8, actor, 0x4d) != 3 ||
            F(s16, actor, 0x4e) != 0x10)
            continue;
        if (found < 5)
        {
            F(void *, scene, 0x22c + found * 4) = actor;
            F(u16, F(void *, actor, 0x54), 0x24) |= 0x12;
            func_02032de4(actor, 0, -0x10);
            F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000) | 0x20;
        }
        else if (found == 5)
        {
            F(void *, scene, 0x254) = actor;
            F(u16, F(void *, actor, 0x54), 0x24) |= 0x12;
            func_02032de4(actor, 0, 0);
            F(u32, actor, 0x5c) &= 0xffff0000;
            func_ov092_02217930(P(actor, 0x60), 0, 0, 0);
        }
        else if (found == 6)
        {
            F(void *, scene, 0x264) = actor;
            F(u16, F(void *, actor, 0x54), 0x24) |= 0x12;
            func_02032de4(actor, 0, -0x10);
            F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000) | 0x20;
            func_ov092_02217930(P(actor, 0x60), 0, 0, 0);
        }
        else
        {
            F(void *, scene, 0x274) = actor;
            F(u16, F(void *, actor, 0x54), 0x24) |= 0x12;
        }
        ++found;
    }
    F(u8, scene, 0x2a1) = F(s16, gGameWork, 0x246) == 0;
    return scene;
}

/* Creates the two scene-owned presentation resources. */
extern "C" void func_ov092_02217b7c(void *scene)
{
    func_0204d3d8(scene);
    s32 resource = func_02003e14(0x10, data_ov092_0221c818, 4, gHeapContext);
    if (resource != 0)
        resource = func_02005580(resource, 0x32c8, 0x32c9, 0x32ca);
    F(s32, scene, 0x244) = resource;
    func_020337d4(scene);
    F(s32, scene, 0x248) =
        func_02005c3c(func_02030acc(), resource, 0, 0, 0, 6, 0);
    F(s16, (void *)F(s32, scene, 0x248), 0x2c) = 0x7d;
    F(s16, (void *)F(s32, scene, 0x248), 0x2e) = 0x9a;
    func_02072b68(F(s32, scene, 0x248), 3);
    resource = func_02003e14(0x10, data_ov092_0221c818, 4, gHeapContext);
    if (resource != 0)
        resource = func_02005580(resource, 0x32f2, 0x32f3, 0x32f4);
    F(s32, scene, 0x24c) = resource;
    func_020337d4(scene);
    F(s32, scene, 0x250) =
        func_02005c3c(func_02030acc(), resource, 0, 0, 0, 6, 0);
    F(s16, (void *)F(s32, scene, 0x250), 0x2c) = 0x80;
    F(s16, (void *)F(s32, scene, 0x250), 0x2e) = 0x60;
    void *root = F(void *, data_021052fc, 0);
    if (F(void *, root, 0x2ea8) != 0)
        func_0204b078(F(void *, root, 0x2ea8), 0);
}

/* Releases scene-owned presentations, path records, and base storage. */
extern "C" void *func_ov092_02217cac(void *scene)
{
    F(void *, scene, 0) = data_ov092_0221c728;
    func_02001944(gGameWork, 0x3ec);
    func_0200199c(gGameWork, 0x3ec);
    if (F(void *, scene, 0x244) != 0)
        CallMethod(F(void *, scene, 0x244), 4);
    if (F(void *, scene, 0x24c) != 0)
        CallMethod(F(void *, scene, 0x24c), 4);
    func_020c0bc8(P(scene, 0x1f0), 5, 12, func_ov092_0221792c);
    func_0204d570(scene);
    return scene;
}

/* Deleting destructor for the encounter scene. */
extern "C" void *func_ov092_02217d40(void *scene)
{
    func_ov092_02217cac(scene);
    func_02003e2c(scene);
    return scene;
}

/* Reads a signed per-scene GameWork slot from either of two banks. */
extern "C" s32 func_ov092_02218380(void *work, s32 bank, s32 slot)
{
    return F(s32, work, (bank == 0 ? 0x3cc : 0x5cc) + slot * 4);
}

/* Writes a signed per-scene GameWork slot in either of two banks. */
extern "C" void func_ov092_02218394(void *work, s32 bank, s32 slot, s16 value)
{
    F(s32, work, (bank == 0 ? 0x3cc : 0x5cc) + slot * 4) = value;
}

/* Reports whether the auxiliary actor has reached terminal idle. */
extern "C" s32 func_ov092_022183b8(void *scene)
{
    return F(s16, scene, 0x29c) == 0 || F(s16, scene, 0x29c) == 99;
}

/* Runs external actor hooks followed by the scene render callback. */
extern "C" void func_ov092_022183d4(void *scene)
{
    func_ov092_02218394(gGameWork, 0, 0, F(s16, scene, 0x284));
    CallMethod(F(void *, F(void *, data_021052fc, 0), 0x2ea4), 0x1c);
    func_ov092_0221893c(scene);
    CallMethod(scene, 0x1c);
}

/* Forwards display maintenance through the resident callback. */
extern "C" void func_ov092_02218438(void)
{
    Actor_UpdatePresentation();
}

/* Applies the encounter's signed brightness ramp to both engines. */
extern "C" void func_ov092_02218444(void *scene)
{
    s16 value = F(s16, scene, 0x2a2);
    value += F(u8, scene, 0x1ec) == 5 ? -0x20 : 0x20;
    if (value > 0)
        value = 0;
    else if (value < -0x300)
        value = -0x300;
    F(s16, scene, 0x2a2) = value;
    *(volatile u16 *)0x04000050 = 0;
    func_020afce8((void *)0x04000050, 14, value >> 8);
    func_020afce8((void *)0x04001050, 14, value >> 8);
}

/* Returns the terminal transition code after scene state eight. */
extern "C" s32 func_ov092_022184d0(void *scene)
{
    return F(u8, scene, 0x1ec) == 8 ? 5 : 0;
}

/* Reports whether the encounter is in an active transition state. */
extern "C" s32 func_ov092_022184e4(void *scene)
{
    u8 state = F(u8, scene, 0x1ec);
    return state == 1 || state == 2 || state == 5 || state == 6 || state == 7;
}

/* Emits a position-panned sound command with clamped horizontal pan. */
extern "C" void func_ov092_02218528(void *, u32 command, s32 x, s32 volume)
{
    s32 pan = (x - 0x180) / 2;
    if (pan < -0x7f)
        pan = -0x7f;
    else if (pan > 0x7f)
        pan = 0x7f;
    Sound_PlayEffectWithParameters(gSoundContext, command >> 7, command & 0x7f, volume, pan, 0,
                  volume);
}

/* Starts the five-actor presentation sequence from idle. */
extern "C" void func_ov092_02218584(void *scene)
{
    if (F(s16, scene, 0x286) == 0)
    {
        F(s16, scene, 0x288) = 0;
        F(s16, scene, 0x286) = 1;
    }
}

/* Requests the return leg while the five actors are assembled. */
extern "C" void func_ov092_022185a4(void *scene)
{
    if (F(s16, scene, 0x286) == 3)
    {
        F(s16, scene, 0x286) = 5;
        F(s16, scene, 0x288) = 0;
    }
}

/* Updates the central presentation and its short effect sequence. */
extern "C" void func_ov092_022185c4(void *scene)
{
    if (F(u8, scene, 0x2a1) != 0)
    {
        if ((F(u16, gSystemState, 6) & 4) != 0 && ++F(u8, scene, 0x279) > 2)
        {
            F(u8, scene, 0x279) = 0;
        }
        if ((F(u16, gSystemState, 6) & 8) != 0)
            F(s16, scene, 0x284) = 0;
        func_02075858(data_020f4e14, 0, 0, data_ov092_0221c828,
                      F(u8, scene, 0x279));
    }

    s32 *positions = (s32 *)data_ov092_0221b17c;
    void *sprite = F(void *, scene, 0x248);
    switch (F(u8, scene, 0x278))
    {
    case 0:
    {
        func_02072b68(sprite, 0);
        F(u16, sprite, 0x24) &= 0xfff8;
        s32 choice = F(u8, scene, 0x279) == 0 ? (u32)genrand_int32() % 3 : 1;
        if (choice == F(s16, scene, 0x28c))
        {
            if (++F(s16, scene, 0x28e) > 1)
                choice = (choice + 1) % 3;
        }
        else
        {
            F(s16, scene, 0x28e) = 0;
        }
        F(s16, scene, 0x28c) = (s16)choice;
        F(s32, scene, 0x27c) = positions[choice];
        F(s32, scene, 0x280) = 0x1c8000;
        F(u8, scene, 0x278) = 1;
        F(s16, scene, 0x27a) = 0;
        Sound_PlayEffectWithParameters(gSoundContext, 0x173, 9, 100, (1 - choice) * -0x30, 0);
        break;
    }
    case 1:
        if ((F(u16, sprite, 0x24) & 1) != 0)
        {
            if ((u16)(F(s16, scene, 0x286) - 2) < 2)
            {
                s32 position[4] = {0, F(s32, scene, 0x27c),
                                   F(s32, scene, 0x280), 0x10000};
                s32 direction[4];
                func_02005030(direction, position);
                direction[2] += 0x10000;
                s32 effect = F(u8, scene, 0x279) == 2 ? 0xd : 0xb;
                if (F(u8, scene, 0x279) == 0 && ((u32)genrand_int32() & 7) == 0)
                    effect = 0xd;
                func_02032cac(func_02050078(effect, direction, position), 1);
                func_02072b68(sprite, 1);
                F(s16, scene, 0x27a) = 0;
                F(u8, scene, 0x278) = 2;
            }
            else
            {
                func_02072b68(sprite, 2);
                F(u16, sprite, 0x24) &= 0xfff8;
                F(u8, scene, 0x278) = 3;
            }
        }
        break;
    case 2:
        if (++F(s16, scene, 0x27a) > 0x1d)
        {
            func_02072b68(sprite, 2);
            F(u16, sprite, 0x24) &= 0xfff8;
            F(u8, scene, 0x278) = 3;
        }
        break;
    case 3:
        if ((F(u16, sprite, 0x24) & 1) != 0)
        {
            func_02072b68(sprite, 3);
            F(s16, scene, 0x27a) = 0;
            F(u8, scene, 0x278) = 4;
        }
        break;
    case 4:
        if (++F(s16, scene, 0x27a) > 0x59)
        {
            if (F(s16, scene, 0x286) == 3)
            {
                F(s16, scene, 0x27a) = 0;
                F(u8, scene, 0x278) = 0;
            }
            else
            {
                F(s16, scene, 0x27a) = 0x5a;
            }
        }
        break;
    }
    func_02005afc(sprite, F(s32, scene, 0x27c), F(s32, scene, 0x280), 0x10000,
                  8);
}

/* Builds the three-vector interpolation context used by actor formations. */
extern "C" void *func_ov092_022191f4(void *out, void *start, void *control,
                                     void *end)
{
    func_02004fe0(out);
    func_02004fe0(P(out, 0x10));
    func_02004fe0(P(out, 0x20));
    func_0200634c(out, start, control, end);
    return out;
}

/* Advances the five-actor formation, interaction, and return choreography. */
extern "C" void func_ov092_0221893c(void *scene)
{
    s16 &state = F(s16, scene, 0x286);
    s16 &timer = F(s16, scene, 0x288);
    if (state == 0)
    {
        for (s32 i = 0; i < 5; ++i)
        {
            void *actor = F(void *, scene, 0x22c + i * 4);
            F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
            F(u32, actor, 0x14) |= 2;
        }
        return;
    }
    if (state == 1)
    {
        for (s32 i = 0; i < 5; ++i)
        {
            void *actor = F(void *, scene, 0x22c + i * 4);
            void *sprite = F(void *, actor, 0x54);
            func_02072b68(sprite, 0);
            F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & 0xffef;
            F(u32, actor, 0x14) |= 2;
        }
        func_ov092_0221a118(scene);
        func_ov092_02218394(gGameWork, 0, 3, 1);
        state = 2;
    }
    if (state == 2)
    {
        s32 start[4] = {0, 0x180000, 0xd0000, 0x10000};
        s32 end[4] = {0, 0x180000, 0x120000, 0x10000};
        s32 fraction = (timer << 12) / 0x3c;
        for (s32 i = 0; i < 5; ++i)
        {
            s32 control[4] = {0};
            s32 curve[12];
            s32 matrix[4];
            func_ov092_02217810(P(scene, 0x1f0 + i * 12), control);
            control[3] = 0x10000;
            func_ov092_022191f4(curve, start, control, end);
            func_020064b8(matrix, curve, fraction);
            void *actor = F(void *, scene, 0x22c + i * 4);
            func_020050a4(P(actor, 0x18), matrix);
            func_020050a4(P(actor, 0x28), matrix);
        }
        if (++timer > 0x3b)
        {
            state = 3;
            timer = 0;
            for (s32 i = 0; i < 5; ++i)
                F(u32, F(void *, scene, 0x22c + i * 4), 0x14) &= ~2u;
            func_ov092_02218394(gGameWork, 0, 3, 2);
        }
        return;
    }
    if (state == 3)
    {
        s32 completed = 0;
        for (s32 i = 0; i < 5; ++i)
        {
            void *actor = F(void *, scene, 0x22c + i * 4);
            void *sprite = F(void *, actor, 0x54);
            u8 animation = F(u8, sprite, 0x38);
            if (F(s32, actor, 0x10c) == 0)
            {
                if (animation == 3)
                {
                    func_02072b68(sprite, 0);
                    F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & ~1u) | 2;
                }
            }
            else
            {
                ++completed;
                if (animation == 0)
                {
                    func_02072b68(sprite, 1);
                    F(u16, sprite, 0x24) &= 0xfffc;
                    if (F(s16, scene, 0x298) != 0)
                        func_ov092_02218528(scene, F(s16, scene, 0x298),
                                            F(s32, actor, 0x1c) >> 12, 0x50);
                    if (F(s16, scene, 0x29a) != 0)
                        func_ov092_02218528(scene, F(s16, scene, 0x29a),
                                            F(s32, actor, 0x1c) >> 12, 0x60);
                    func_ov092_02218528(scene, 0xb983,
                                        F(s32, actor, 0x1c) >> 12, 100);
                }
                else if (animation == 1 && (F(u16, sprite, 0x24) & 1))
                {
                    func_02072b68(sprite, 2);
                    F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & 0xfffc) | 2;
                    func_ov092_02218394(
                        gGameWork, 0, 2,
                        (s16)(func_ov092_02218380(gGameWork, 0, 2) + 5));
                }
                else if (F(s32, actor, 0x104) != 0)
                {
                    if (F(s16, scene, 0x298) != 0)
                        func_ov092_02218528(scene, F(s16, scene, 0x298),
                                            F(s32, actor, 0x1c) >> 12, 0x50);
                    if (F(s16, scene, 0x29a) != 0)
                        func_ov092_02218528(scene, F(s16, scene, 0x29a),
                                            F(s32, actor, 0x1c) >> 12, 0x60);
                }
            }
            F(s32, actor, 0x104) = 0;
            func_ov092_02217810(P(scene, 0x1f0 + i * 12), P(actor, 0x18));
            F(s32, actor, 0x2c) = F(s32, actor, 0x1c);
            F(s32, actor, 0x30) = F(s32, actor, 0x20);
        }
        if (completed == 5 ||
            (F(u8, scene, 0x2a1) != 0 && (F(u16, gSystemState, 4) & 0x100)))
        {
            func_ov092_02218394(
                gGameWork, 0, 2,
                (s16)(func_ov092_02218380(gGameWork, 0, 2) + 0x1e));
            for (s32 i = 0; i < 5; ++i)
            {
                void *actor = F(void *, scene, 0x22c + i * 4);
                void *sprite = F(void *, actor, 0x54);
                func_02072b68(sprite, 3);
                F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & 0xfffe;
                s32 effect =
                    func_02003e14(0x14, data_ov092_0221c834, 4, gHeapContext);
                if (effect != 0)
                {
                    void *owner =
                        (void *)func_02007f0c(F(void *, data_021052fc, 0), 2);
                    func_0201fafc(effect, P(actor, 0x18), owner, 0x1631, 0x1632,
                                  0x1633, 0, 0x800, -1);
                }
                F(s32, actor, 0x10c) = 0;
            }
            state = 4;
            timer = 0;
            F(s32, scene, 0x240) = 0x78;
            func_02059278(gSoundContext, 0x95, 0x7f);
            func_ov092_02218394(gGameWork, 0, 3, 3);
        }
        return;
    }
    if (state == 4)
    {
        if (--F(s32, scene, 0x240) > 0)
            return;
        func_0205929c(gSoundContext, 0x95, 0);
        state = 5;
        timer = 0;
    }
    if (state == 5)
    {
        for (s32 i = 0; i < 5; ++i)
            F(u32, F(void *, scene, 0x22c + i * 4), 0x14) |= 2;
        if (F(s16, scene, 0x284) < 0x1553)
            func_02059278(gSoundContext, 0x98, 0x7f);
        state = 6;
        func_ov092_02218394(gGameWork, 0, 3, 4);
    }
    if (state == 6)
    {
        s32 end[4] = {0, 0x180000, 0x120000, 0x10000};
        s32 start[4] = {0, 0x180000, 0xd0000, 0x10000};
        s32 fraction = (timer << 12) / 0x3c;
        for (s32 i = 0; i < 5; ++i)
        {
            s32 control[4] = {0};
            s32 curve[12];
            s32 matrix[4];
            func_ov092_02217834(P(scene, 0x1f0 + i * 12), control);
            control[3] = 0x10000;
            func_ov092_022191f4(curve, control, start, end);
            func_020064b8(matrix, curve, fraction);
            void *actor = F(void *, scene, 0x22c + i * 4);
            func_020050a4(P(actor, 0x18), matrix);
            func_020050a4(P(actor, 0x28), matrix);
        }
        if (++timer > 0x3b)
        {
            state = 7;
            timer = 0;
            for (s32 i = 0; i < 5; ++i)
            {
                void *actor = F(void *, scene, 0x22c + i * 4);
                void *sprite = F(void *, actor, 0x54);
                F(u16, sprite, 0x24) |= 4;
                s32 choice = (u32)genrand_int32() % 13;
                const s16 *triple =
                    (const s16 *)data_ov092_0221b308 + choice * 3;
                func_0203bae4(actor, triple[0], triple[1], triple[2], 2);
                func_02072b68(sprite, 0);
                F(u16, sprite, 0x24) |= 0x12;
                F(s32, actor, 0x10c) = 0;
            }
            func_ov092_02218394(gGameWork, 0, 3, 5);
        }
        return;
    }
    if (state == 7 && ++timer > 0x1e)
    {
        state = 0;
        timer = 0;
        func_0205929c(gSoundContext, 0x98);
        s16 limit = F(u8, scene, 0x2a0) == 0 ? 3 : 7;
        if (++F(s16, scene, 0x28a) >= limit)
        {
            F(s16, scene, 0x28a) = 0;
            if (F(u8, scene, 0x1ec) == 2)
            {
                F(u8, scene, 0x1ec) = 5;
                F(s16, scene, 0x284) = 0;
                F(u8, scene, 0x1ed) = 0;
                func_ov092_02218394(gGameWork, 0, 8, 1);
            }
        }
    }
}

/* Detects and consumes contact on the scene's auxiliary target actor. */
extern "C" void func_ov092_02219238(void *scene)
{
    void *actor = F(void *, scene, 0x274);
    F(u32, actor, 0x14) |= 0x20000000;
    if (F(s32, actor, 0x10c) != 0 && F(s32, actor, 0x104) != 0)
    {
        F(s32, actor, 0x104) = 0;
        if (F(u8, scene, 0x1ec) == 2)
        {
            func_ov092_02218528(scene, 0xb98a, F(s32, actor, 0x1c) >> 12, 0x50);
            if (F(s16, scene, 0x29c) == 0)
                F(s16, scene, 0x29c) = 1;
        }
    }
}

/* Converts the auxiliary actor's hit state into its departure state. */
extern "C" void func_ov092_022192b0(void *scene)
{
    if (F(s16, scene, 0x29c) == 2)
        F(s16, scene, 0x29c) = 0x32;
}

/* Runs the auxiliary target actor's path, hit, and departure lifecycle. */
extern "C" void func_ov092_022192c8(void *scene)
{
    s16 &state = F(s16, scene, 0x29c);
    s16 &timer = F(s16, scene, 0x29e);
    void *actor = F(void *, scene, 0x254);
    void *sprite = F(void *, actor, 0x54);
    if (state == 0)
    {
        F(u16, sprite, 0x24) |= 0x10;
        F(u32, actor, 0x14) |= 6;
        if (F(u8, scene, 0x2a1) && (F(u16, gSystemState, 4) & 0x400))
            state = 1;
        return;
    }
    if (state == 1)
    {
        func_ov092_022177e0(P(scene, 0x258), data_ov092_0221c2d6, 0x26, 0, 0);
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & 0xffee) | 2;
        func_02072b68(sprite, 0);
        F(u32, actor, 0x14) &= ~6u;
        F(s32, actor, 0x104) = F(s32, actor, 0x10c) = 0;
        state = 2;
    }
    if (state == 2)
    {
        func_ov092_02217810(P(scene, 0x258), P(actor, 0x18));
        F(s32, actor, 0x2c) = F(s32, actor, 0x1c);
        F(s32, actor, 0x30) = F(s32, actor, 0x20);
        F(s32, actor, 0x24) = F(s32, actor, 0x34) = 0x18000;
        if (F(u8, scene, 0x263) == 0)
        {
            if (F(s32, actor, 0x10c) == 0)
            {
                if (F(s16, scene, 0x258) == 1 &&
                    Sound_IsDirectSequencePlaying(gSoundContext, 0x94) == 0)
                    func_02059278(gSoundContext, 0x94, 0x7f);
                else if (F(s16, scene, 0x258) > 0x23 &&
                         Sound_IsDirectSequencePlaying(gSoundContext, 0x94) != 0)
                    func_0205929c(gSoundContext, 0x94, 0);
            }
            else
            {
                state = 3;
                func_02072b68(sprite, 2);
                F(u16, sprite, 0x24) &= 0xfffc;
                F(u32, actor, 0x14) |= 6;
                func_ov092_02218394(
                    gGameWork, 0, 2,
                    (s16)(func_ov092_02218380(gGameWork, 0, 2) + 0x32));
                F(s16, scene, 0x284) -= 0x4b0;
                if (F(s16, scene, 0x284) < 0)
                    F(s16, scene, 0x284) = 0;
                func_0205929c(gSoundContext, 0x94, 0);
                func_ov092_02218528(scene, 0xb98a, F(s32, actor, 0x1c) >> 12,
                                    100);
            }
        }
        else
        {
            F(u16, sprite, 0x24) |= 0x10;
            F(u32, actor, 0x14) |= 6;
            state = 99;
            func_0205929c(gSoundContext, 0x94, 0);
        }
        return;
    }
    if (state == 3)
    {
        if ((F(u16, sprite, 0x24) & 1) != 0)
        {
            F(u16, sprite, 0x24) |= 0x10;
            state = 99;
        }
        return;
    }
    if (state == 0x32)
    {
        func_0205929c(gSoundContext, 0x94, 0);
        state = 0x33;
        timer = 0;
    }
    if (state == 0x33)
    {
        s32 control[4] = {0};
        s32 start[4] = {0, 0x180000, 0x44000, 0x10000};
        s32 end[4] = {0, 0x180000, 0xa0000, 0x10000};
        s32 curve[12];
        s32 matrix[4];
        func_ov092_02217834(P(scene, 0x258), control);
        control[3] = 0x18000;
        func_ov092_022191f4(curve, control, start, end);
        func_020064b8(matrix, curve, (timer << 12) / 0x3c);
        func_020050a4(P(actor, 0x18), matrix);
        func_020050a4(P(actor, 0x28), matrix);
        if (++timer > 0x3b)
        {
            state = 99;
            F(u16, sprite, 0x24) |= 0x10;
        }
    }
}

static void AdvanceActorPath(void *scene, void *actor)
{
    void *cursor = P(scene, 0x268);
    void *sprite = F(void *, actor, 0x54);
    func_ov092_02217810(cursor, P(actor, 0x18));
    F(s32, actor, 0x2c) = F(s32, actor, 0x1c);
    F(s32, actor, 0x30) = F(s32, actor, 0x20);
    s32 animation = func_ov092_02217914(cursor);
    if (F(u8, sprite, 0x38) != animation)
        func_02072b68(sprite, animation);
}

/* Runs the second scripted actor through approach, hit, and exit phases. */
extern "C" s32 func_ov092_022196d0(void *scene)
{
    void *actor = F(void *, scene, 0x264);
    void *sprite = F(void *, actor, 0x54);
    u8 &state = F(u8, scene, 0x1ed);
    s16 &timer = F(s16, scene, 0x1ee);
    func_ov092_02219238(scene);
    switch (state)
    {
    case 0:
        Sound_StopEffect(gSoundContext, 0x67, 4);
        func_ov092_022185c4(scene);
        func_ov092_022185a4(scene);
        func_ov092_0221893c(scene);
        func_ov092_022192b0(scene);
        func_ov092_022192c8(scene);
        state = 1;
        timer = 0;
        break;
    case 1:
        func_ov092_022185c4(scene);
        func_ov092_022185a4(scene);
        func_ov092_0221893c(scene);
        func_ov092_02219238(scene);
        func_ov092_022192b0(scene);
        func_ov092_022192c8(scene);
        if (timer > 0x78 && F(s16, scene, 0x286) == 0 &&
            func_ov092_0221a6d4(scene) && func_ov092_022183b8(scene))
        {
            F(u32, actor, 0x14) |= 0x82;
            func_ov092_02217930(P(actor, 0x18), 0x180000, 0xc4000, 0x10000);
            F(u16, sprite, 0x24) &= 0xffed;
            func_02072b68(sprite, 0);
            F(u8, sprite, 0x3a) = 3;
            state = 2;
            timer = 0;
        }
        break;
    case 2:
        if (timer > 0x77)
        {
            const void *path = F(u8, scene, 0x2a0) == 0
                                   ? (const void *)data_ov092_0221b220
                                   : (const void *)data_ov092_0221b238;
            func_ov092_022177e0(P(scene, 0x268), path, 3, 0, 0);
            F(u32, actor, 0x14) &= ~0x82u;
            F(u16, sprite, 0x24) |= 2;
            F(s16, sprite, 0x36) = 0x200;
            state = 3;
        }
        break;
    case 3:
        AdvanceActorPath(scene, actor);
        if (F(u8, scene, 0x273) != 0)
        {
            state = 4;
            timer = 0;
            F(s16, sprite, 0x36) = 0;
            func_ov092_02218528(scene, 0xb98b, F(s32, actor, 0x1c) >> 12, 0x50);
        }
        break;
    case 4:
        if (timer > 0x3f)
        {
            const void *path = F(u8, scene, 0x2a0) == 0
                                   ? (const void *)data_ov092_0221b356
                                   : (const void *)data_ov092_0221b3de;
            func_ov092_022177e0(P(scene, 0x268), path, 0x11, 0, 0);
            F(u32, actor, 0x14) &= ~0x82u;
            F(u16, sprite, 0x24) |= 2;
            F(s16, sprite, 0x36) = 0x100;
            state = 10;
            func_02059278(gSoundContext, 0x99, 0x7f);
        }
        break;
    case 10:
        AdvanceActorPath(scene, actor);
        if (Sound_IsDirectSequencePlaying(gSoundContext, 0x99) == 0)
        {
            state = 0xb;
            timer = 0;
        }
        break;
    case 0xb:
        if (timer > 0x3c)
        {
            state = 0xc;
            func_02059278(gSoundContext, 0x96, 0x7f);
            func_02072b68(sprite, 2);
            F(u16, sprite, 0x24) &= 0xfffc;
        }
        break;
    case 0xc:
        if ((F(u16, sprite, 0x24) & 1) != 0)
        {
            state = 0xd;
            func_02072b68(sprite, 3);
            F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & 0xfffe) | 2;
            s32 position[4];
            s32 direction[4] = {0, 0, 0x10000, 0};
            s32 rotated[4];
            func_02005030(position, P(actor, 0x18));
            position[2] += 0x10000;
            position[1] += 0x8000;
            func_ov092_02219e54(rotated, position, direction);
            func_02032cac(func_02050078(0xd, position, rotated), 1);
            timer = 0;
            F(s32, actor, 0x10c) = 0;
        }
        break;
    case 0xd:
        if (timer < 0xf1)
        {
            if (F(s32, actor, 0x10c) != 0)
            {
                state = 0x32;
                func_02072b68(sprite, 1);
                F(u16, sprite, 0x24) &= 0xfffc;
                func_ov092_02218528(scene, 0xb98c, F(s32, actor, 0x1c) >> 12,
                                    0x50);
                func_ov092_02218528(scene, 0xb983, F(s32, actor, 0x1c) >> 12,
                                    100);
            }
        }
        else
            state = 0x3c;
        break;
    case 0x32:
        if ((F(u16, sprite, 0x24) & 1) != 0)
        {
            func_ov092_02218394(
                gGameWork, 0, 2,
                (s16)(func_ov092_02218380(gGameWork, 0, 2) + 100));
            state = 0x33;
            timer = 0;
        }
        break;
    case 0x33:
        if (timer > 0xf0)
        {
            F(u16, sprite, 0x24) |= 2;
            const void *path = F(u8, scene, 0x2a0) == 0
                                   ? (const void *)data_ov092_0221b220
                                   : (const void *)data_ov092_0221b238;
            func_ov092_022177e0(P(scene, 0x268), path, 2, 0, 0);
            func_02059278(gSoundContext, 0x95, 0x7f);
            state = 0x5a;
            func_ov092_02218394(gGameWork, 0, 3, 3);
        }
        break;
    case 0x3c:
        if (timer > 0xf0)
        {
            const void *path = F(u8, scene, 0x2a0) == 0
                                   ? (const void *)data_ov092_0221b210
                                   : (const void *)data_ov092_0221b1e0;
            func_ov092_022177e0(P(scene, 0x268), path, 2, 0, 0);
            state = 0x5a;
        }
        break;
    case 0x5a:
        AdvanceActorPath(scene, actor);
        if (F(u8, scene, 0x273) != 0)
        {
            state = 99;
            F(u32, actor, 0x14) |= 2;
            F(u16, sprite, 0x24) |= 0x10;
            func_ov092_02218394(gGameWork, 0, 3, 0);
        }
        break;
    }
    return state != 99;
}

/* Builds an orientation transform between two vector objects. */
extern "C" void func_ov092_02219e54(void *out, void *from, void *to)
{
    func_02004fe0(out);
    func_020adff0(from != 0 ? P(from, 4) : 0, to != 0 ? P(to, 4) : 0,
                  P(out, 4));
}

/* Initializes an encounter round and captures the primary actor pose. */
extern "C" void func_ov092_02219e8c(void *scene)
{
    F(u8, scene, 0x2a0) = (u8)func_ov092_02218380(gGameWork, 0, 6);
    void *actor = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    F(u32, actor, 0xd0) |= 0x40000;
    F(u32, actor, 0x230) = (F(u32, actor, 0x230) & ~4u) | 0x20;
    func_0200199c(gGameWork, 0x3ec);
    func_02001944(gGameWork, 0x3ec);
    func_ov092_02219fc8(P(scene, 0x290), P(actor, 0x60));
    F(s16, actor, 0x60) -= 10;
    F(s16, actor, 0x64) += 10;
    F(s16, scene, 0x1ee) = 0;
    F(u8, scene, 0x1ed) = 0;
    F(s16, scene, 0x284) = 0;
    F(u8, scene, 0x278) = 0;
    F(s16, scene, 0x27a) = 0;
    F(s32, scene, 0x240) = 0;
    func_ov092_02218394(gGameWork, 0, 2, 0);
    func_ov092_02218394(gGameWork, 0, 8, 0);
    F(s16, scene, 0x28a) = F(u8, scene, 0x2a0) == 0 ? 0 : 4;
    F(s16, scene, 0x29c) = F(s16, scene, 0x29e) = 0;
    F(s16, gGameWork, 0x212) = 0x1000;
    GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 0);
}

/* Copies the four-halfword primary actor pose used by encounter teardown. */
extern "C" void func_ov092_02219fc8(void *out, const void *source)
{
    for (s32 i = 0; i < 4; ++i)
        F(s16, out, i * 2) = F(s16, source, i * 2);
}

/* Restores the primary actor and closes the current encounter round. */
extern "C" void func_ov092_02219fec(void *scene)
{
    void *actor = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    F(u32, actor, 0xd0) &= ~0x40000u;
    F(u32, actor, 0x230) = (F(u32, actor, 0x230) & ~0x20u) | 4;
    func_02001944(gGameWork, 0x3ec);
    func_020390c8(actor);
    func_ov092_02218394(gGameWork, 0, 1, 0);
    func_ov092_02218394(gGameWork, 0, 3, 0);
    func_ov092_02219fc8(P(actor, 0x60), P(scene, 0x290));
    F(u16, F(void *, scene, 0x250), 0x24) |= 4;
    F(u16, F(void *, scene, 0x248), 0x24) |= 4;
}

/* Configures one formation actor's path and three-halfword presentation tuple.
 */
extern "C" void func_ov092_0221a0a0(void *scene, s32 slot, const void *path,
                                    s16 count, s32 index, const s16 *triple)
{
    func_ov092_022177e0(P(scene, 0x1f0 + slot * 12), path, count, index, 1);
    void *actor = F(void *, scene, 0x22c + slot * 4);
    func_0203bae4(actor, triple[0], triple[1], triple[2], 2);
    F(u16, F(void *, actor, 0x54), 0x24) |= 2;
}

static void ConfigureFive(void *scene, const void *const paths[5],
                          const s16 counts[5], const s16 indices[5],
                          const s16 *const triples[5])
{
    for (s32 i = 0; i < 5; ++i)
        func_ov092_0221a0a0(scene, i, paths[i], counts[i], indices[i],
                            triples[i]);
}

/* Selects path and animation tables for the current five-actor formation. */
extern "C" void func_ov092_0221a118(void *scene)
{
    const void *paths[5];
    const s16 *triples[5];
    s16 indices[5];
    s16 counts[5];
    s16 soundA;
    s16 soundB;
    s16 mode = F(s16, scene, 0x28a);
    if (mode == 0)
    {
        paths[0] = data_ov092_0221b250;
        paths[1] = data_ov092_0221b2e0;
        paths[2] = data_ov092_0221b290;
        paths[3] = data_ov092_0221b270;
        paths[4] = data_ov092_0221b2b8;
        const s16 *t[5] = {
            (s16 *)data_ov092_0221b314, (s16 *)data_ov092_0221b31a,
            (s16 *)data_ov092_0221b320, (s16 *)data_ov092_0221b326,
            (s16 *)data_ov092_0221b32c};
        for (s32 i = 0; i < 5; ++i)
        {
            triples[i] = t[i];
            indices[i] = 0;
        }
        const s16 c[5] = {4, 5, 5, 4, 5};
        for (s32 i = 0; i < 5; ++i)
            counts[i] = c[i];
        soundA = -18047;
        soundB = 0;
    }
    else if (mode == 1)
    {
        for (s32 i = 0; i < 5; ++i)
        {
            paths[i] = data_ov092_0221b466;
            indices[i] = (s16)(i * 2);
            triples[i] = (s16 *)data_ov092_0221b308 + (i + 7) * 3;
        }
        for (s32 i = 0; i < 5; ++i)
            counts[i] = 0x12;
        soundA = -18046;
        soundB = -18035;
    }
    else if (mode == 2 || mode == 3)
    {
        const void *a[5] = {
            mode == 2 ? (void *)data_ov092_0221ba66 : data_ov092_0221be26,
            mode == 2 ? (void *)data_ov092_0221bb26 : data_ov092_0221bee6,
            mode == 2 ? (void *)data_ov092_0221bbe6 : data_ov092_0221bfa6,
            mode == 2 ? (void *)data_ov092_0221bca6 : data_ov092_0221c066,
            mode == 2 ? (void *)data_ov092_0221bd66 : data_ov092_0221c126};
        const s16 mode2Indices[5] = {0, 2, 4, 6, 8};
        const s16 mode3Indices[5] = {0, 2, 4, 2, 4};
        for (s32 i = 0; i < 5; ++i)
        {
            paths[i] = a[i];
            indices[i] = mode == 2 ? mode2Indices[i] : mode3Indices[i];
            triples[i] = i == 0 || i == 2 || i == 4
                             ? (s16 *)data_ov092_0221b308
                             : (s16 *)data_ov092_0221b30e;
        }
        for (s32 i = 0; i < 5; ++i)
            counts[i] = 0x18;
        soundA = -18047;
        soundB = -18037;
    }
    else if (mode == 4)
    {
        const void *a[5] = {data_ov092_0221b6a6, data_ov092_0221b766,
                            data_ov092_0221b826, data_ov092_0221b8e6,
                            data_ov092_0221b9a6};
        const s16 idx[5] = {0, 10, 1, 9, 0};
        const s16 *t[5] = {
            (s16 *)data_ov092_0221b314, (s16 *)data_ov092_0221b31a,
            (s16 *)data_ov092_0221b320, (s16 *)data_ov092_0221b326,
            (s16 *)data_ov092_0221b32c};
        for (s32 i = 0; i < 5; ++i)
        {
            paths[i] = a[i];
            indices[i] = idx[i];
            triples[i] = t[i];
        }
        for (s32 i = 0; i < 5; ++i)
            counts[i] = 0x18;
        soundA = -18047;
        soundB = 0;
    }
    else if (mode == 5)
    {
        const s16 *t[5] = {
            (s16 *)data_ov092_0221b332, (s16 *)data_ov092_0221b338,
            (s16 *)data_ov092_0221b33e, (s16 *)data_ov092_0221b344,
            (s16 *)data_ov092_0221b34a};
        for (s32 i = 0; i < 5; ++i)
        {
            paths[i] = data_ov092_0221c406;
            indices[i] = (s16)(i * 2);
            triples[i] = t[i];
        }
        for (s32 i = 0; i < 5; ++i)
            counts[i] = 0x5a;
        soundA = -18046;
        soundB = -18035;
    }
    else
    {
        const void *a[5] = {data_ov092_0221b616, data_ov092_0221b4f6,
                            data_ov092_0221b586, data_ov092_0221c1e6,
                            data_ov092_0221c1e6};
        const s16 idx[5] = {0, 2, 0, 0, 9};
        for (s32 i = 0; i < 5; ++i)
        {
            paths[i] = a[i];
            indices[i] = idx[i];
            triples[i] =
                i < 3 ? (s16 *)data_ov092_0221b308 : (s16 *)data_ov092_0221b30e;
        }
        for (s32 i = 0; i < 5; ++i)
            counts[i] = i < 3 ? 0x12 : 0x1e;
        soundA = -18046;
        soundB = -18035;
    }
    ConfigureFive(scene, paths, counts, indices, triples);
    F(s16, scene, 0x298) = soundA;
    F(s16, scene, 0x29a) = soundB;
}

/* Reports readiness once the central presentation is idle and no blocker lives.
 */
extern "C" s32 func_ov092_0221a6d4(void *scene)
{
    if (F(u8, scene, 0x278) != 4)
        return 0;
    void *collection = (void *)func_02007f0c(F(void *, data_021052fc, 0), 1);
    for (s32 i = 0; i < F(s32, collection, 0x2e74); ++i)
    {
        void *actor = F(void *, collection, i * 4);
        if (actor != 0 && F(u8, actor, 0x4d) == 4 &&
            F(s16, actor, 0x4e) == 0x1e)
            return 0;
    }
    return 1;
}

/* Runs the top-level encounter progression and primary-actor handoff. */
extern "C" void func_ov092_02217ddc(void *scene)
{
    func_0204d308(scene);
    void *primary = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    void *manager = (void *)func_0200323c(gSceneManager);
    if (F(s32, manager, 4) == 2 || func_ov092_02218380(gGameWork, 0, 1) == 0)
        return;
    func_0200323c(gSceneManager);
    RuntimePresentationManager_GetGraphics3dPresentation(P(F(void *, data_021052fc, 0), 0x2f7c));
    func_ov092_02218394(gGameWork, 0, 0, F(s16, scene, 0x284));
    if (ActorDerivedType1_GetActiveRecordId(primary) == 0x68)
    {
        F(s32, primary, 0xa0) = F(s32, primary, 0x90) = 0;
        F(s32, primary, 0x40) = 0;
        F(s32, primary, 0x20) = 0x214000;
    }
    switch (F(u8, scene, 0x1ec))
    {
    case 0:
    {
        func_ov092_02219e8c(scene);
        func_0200222c(func_020022dc(), 2, 0x3f);
        s32 object = func_02003e14(0x58, data_ov092_0221c820, 4, gHeapContext);
        if (object != 0)
            func_ov060_0220fd54(object, scene, 0);
        F(u8, scene, 0x1ec) = 1;
        F(s16, scene, 0x1ee) = 0;
        func_02072b68(F(void *, scene, 0x250));
        func_ov092_02218394(gGameWork, 0, 3, 1);
        func_ov092_02218394(gGameWork, 0, 5, 0x78);
        func_ov092_02217930(P(primary, 0x38), 0, 0, 0);
        func_ov092_02217930(P(primary, 0x88), 0, 0, 0);
        func_ov092_02217930(P(primary, 0x98), 0, 0, 0);
        break;
    }
    case 1:
        F(u16, F(void *, scene, 0x250), 0x24) &= 0xfffb;
        if (F(u16, scene, 0x1ee) > 0x95)
        {
            func_02059394(gSoundContext, 0x67, 4);
            F(s16, scene, 0x1ee) = 0;
            F(s16, scene, 0x27a) = 0x3c;
            F(u8, scene, 0x278) = 4;
            F(u8, scene, 0x1ec) = 2;
            F(u32, primary, 0x230) |= 4;
            func_02001944(gGameWork, 0x3ec);
            F(u16, F(void *, scene, 0x250), 0x24) |= 4;
            func_ov092_02218394(gGameWork, 0, 1, 2);
        }
        break;
    case 2:
        func_ov092_022185c4(scene);
        func_ov092_02218584(scene);
        func_ov092_0221893c(scene);
        func_ov092_02219238(scene);
        func_ov092_022192c8(scene);
        if (F(s16, scene, 0x286) >= 3 && F(s16, scene, 0x286) <= 5 &&
            ++F(s16, scene, 0x284) >= 0x1553)
        {
            F(u32, primary, 0x230) &= ~4u;
            func_0200199c(gGameWork, 0x3ec);
            func_ov092_02217930(P(primary, 0x38), 0, 0, 0);
            func_ov092_02217930(P(primary, 0x88), 0, 0, 0);
            func_ov092_02217930(P(primary, 0x98), 0, 0, 0);
            Sound_StopEffect(gSoundContext, 0x67, 4);
            F(u8, scene, 0x1ec) = 6;
            func_ov092_02218394(gGameWork, 0, 5, 0x78);
        }
        else
        {
            s32 fade = F(s16, scene, 0x284) < 0x12fb
                           ? 0
                           : -(F(s16, scene, 0x284) - 0x12fb);
            Sound_SetEffectParameters(gSoundContext, 0x67, 4, 0x7f, 0, fade);
        }
        break;
    case 5:
        if (!func_ov092_022196d0(scene))
        {
            F(u32, primary, 0x230) &= ~4u;
            func_0200199c(gGameWork, 0x3ec);
            func_ov092_02217930(P(primary, 0x38), 0, 0, 0);
            func_ov092_02217930(P(primary, 0x88), 0, 0, 0);
            func_ov092_02217930(P(primary, 0x98), 0, 0, 0);
            Sound_StopEffect(gSoundContext, 0x67, 4);
            F(u8, scene, 0x1ec) = 6;
            func_ov092_02218394(gGameWork, 0, 5, 0x78);
        }
        else
        {
            s32 fade = F(s16, scene, 0x284) < 0x12fb
                           ? 0
                           : -(F(s16, scene, 0x284) - 0x12fb);
            Sound_SetEffectParameters(gSoundContext, 0x67, 4, 0x7f, 0, fade);
        }
        break;
    case 6:
        func_02072b68(F(void *, scene, 0x250), 1);
        F(s16, scene, 0x1ee) = 0;
        F(u8, scene, 0x1ec) = 7;
        /* Fall through: retail evaluates the first return frame immediately. */
    case 7:
        if (F(u16, scene, 0x1ee) < 0x78)
            F(u16, F(void *, scene, 0x250), 0x24) &= 0xfffb;
        else
        {
            F(u16, F(void *, scene, 0x250), 0x24) |= 4;
            F(s16, scene, 0x1ee) = 0x78;
        }
        func_ov092_022185c4(scene);
        func_ov092_022185a4(scene);
        func_ov092_0221893c(scene);
        func_ov092_02219238(scene);
        func_ov092_022192b0(scene);
        func_ov092_022192c8(scene);
        if (F(u16, scene, 0x1ee) >= 0x78 && F(s16, scene, 0x286) == 0 &&
            func_ov092_0221a6d4(scene) && func_ov092_022183b8(scene))
        {
            F(u8, scene, 0x1ec) = 8;
            func_ov092_02219fec(scene);
        }
        break;
    case 8:
        F(u8, scene, 0x1ec) = 0;
        break;
    }
    ++F(s16, scene, 0x1ee);
}

/* Returns the scene actor's fixed capability mask. */
extern "C" s32 func_ov092_0221a774(void)
{
    return 0x40000;
}

/* Matching capability leaf returning false. */
extern "C" s32 func_ov092_0221a77c(void)
{
    return 0;
}

/* Copies another actor's position into this actor's embedded vector. */
extern "C" void func_ov092_0221a784(void *actor, void *other)
{
    VecFx32Object_InitCopy(actor, P(other, 0x18));
}

/* Returns the actor's bit-0x80 state as the retail bitmask. */
extern "C" u32 func_ov092_0221a794(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Reports whether the actor's bit-0x40 state is active. */
extern "C" s32 func_ov092_0221a7a0(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Matching capability leaf returning false. */
extern "C" s32 func_ov092_0221a7b4(void)
{
    return 0;
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a7bc(void)
{
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a7c0(void)
{
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a7c4(void)
{
}

/* Marks the actor's bit-0x80 state. */
extern "C" void func_ov092_0221a7c8(void *actor)
{
    F(u32, actor, 0xd0) |= 0x80;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a7d8(void)
{
    return 0;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a7e0(void)
{
    return 0;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a7e8(void)
{
    return 0;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a7f0(void)
{
    return 0;
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a7f8(void)
{
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a7fc(void)
{
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a800(void)
{
}

/* Returns the actor's retail class identifier. */
extern "C" s32 func_ov092_0221a804(void)
{
    return 0x309;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a810(void)
{
    return 0;
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a818(void)
{
}

/* Matching virtual callback with no observable effect. */
extern "C" void func_ov092_0221a81c(void)
{
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a820(void)
{
    return 0;
}

/* Matching query leaf returning false. */
extern "C" s32 func_ov092_0221a828(void)
{
    return 0;
}

/* Returns the actor's fixed presentation category. */
extern "C" s32 func_ov092_0221a830(void)
{
    return 0x75;
}

/* Constructs the tracked attacker and initializes its response bounds. */
extern "C" void *func_ov092_0221a838(void *actor)
{
    func_02050a08(actor);
    F(void *, actor, 0) = data_ov092_0221c8c4;
    F(s32, actor, 0x200) = F(s32, actor, 0x204) = 0;
    F(s32, actor, 0x208) = 0;
    F(s32, actor, 0x20c) = -1;
    F(s32, actor, 0x210) = 0;
    F(s16, actor, 0x60) = F(s16, actor, 0x62) = -12;
    F(s16, actor, 0x64) = F(s16, actor, 0x66) = 12;
    F(s8, actor, 8) = F(s8, actor, 9) = -2;
    F(s8, actor, 10) = F(s8, actor, 11) = 2;
    F(s32, actor, 0x214) = func_ov092_02218380(gGameWork, 0, 4);
    return actor;
}

/* Runs the tracked attacker's normal destructor path. */
extern "C" void *func_ov092_0221a8bc(void *actor)
{
    func_02050a78(actor);
    return actor;
}

/* Runs the tracked attacker's deleting destructor path. */
extern "C" void *func_ov092_0221a8d0(void *actor)
{
    func_02050a78(actor);
    func_02003e2c(actor);
    return actor;
}

/* Applies inherited setup and marks the actor for custom presentation. */
extern "C" void func_ov092_0221a8ec(void *actor)
{
    func_02050e2c(actor);
    F(u32, actor, 0x14) |= 0x800000;
}

/* Scales a VecFx32's XYZ members by a 20.12 fixed-point factor. */
extern "C" void func_ov092_0221ad28(void *vector, s32 scale)
{
    for (s32 offset = 4; offset <= 12; offset += 4)
        F(s32, vector, offset) =
            (s32)(((s64)F(s32, vector, offset) * scale + 0x800) >> 12);
}

/* Updates tracked-attacker steering, sprite scale, and facing rotation. */
extern "C" void func_ov092_0221a908(void *actor)
{
    if (F(s32, actor, 0x20c) > 0 && --F(s32, actor, 0x20c) == 0)
        func_ov092_0221ada4(actor);
    if (F(s32, actor, 0x210) > 0)
    {
        --F(s32, actor, 0x210);
        u32 current = F(u32, actor, 0x24);
        u32 previous = F(u32, actor, 0x1dc);
        if ((F(u32, actor, 0xd0) & 0x10) != 0 || current != previous)
        {
            u16 input = F(u16, gSystemState, 0x1a);
            if ((input & 0xf0) != 0)
            {
                s32 x = F(s32, actor, 0x8c);
                s32 y = F(s32, actor, 0x90);
                if (x != 0 || y != 0)
                {
                    s32 angle = func_020ae024(y, x);
                    s32 inputX = (input & 0x20)   ? -0x1000
                                 : (input & 0x10) ? 0x1000
                                                  : 0;
                    s32 inputY = (input & 0x40)   ? -0x1000
                                 : (input & 0x80) ? 0x1000
                                                  : 0;
                    s32 target = func_020ae024(inputY, inputX);
                    if (angle < target)
                        angle += 0x10000;
                    s32 difference = angle - target;
                    if (difference < 0x4000)
                        angle -= 0x180;
                    else if (difference < 0x8000)
                        angle -= 0x200;
                    else if (difference < 0xc000)
                        angle += 0x200;
                    else
                        angle += 0x180;
                    s32 length = Fx32Vector2_Magnitude(x, y);
                    s32 index = ((u16)angle) >> 4;
                    const s16 *trig = (const s16 *)data_020c9670;
                    F(s32, actor, 0x8c) =
                        (s32)(((s64)trig[index * 2 + 1] * length + 0x800) >>
                              12);
                    F(s32, actor, 0x90) =
                        (s32)(((s64)trig[index * 2] * length + 0x800) >> 12);
                }
            }
        }
    }
    func_02050b70(actor);
    s32 scale = 0x100;
    if (F(s32, actor, 0x24) > 0x30000)
    {
        scale =
            (func_020adae4(F(s32, actor, 0x24) - 0x30000, 0x60) >> 4) + 0x100;
        if (scale > 0x200)
            scale = 0x200;
    }
    void *sprite = F(void *, actor, 0x54);
    F(s16, sprite, 0x32) = F(s16, sprite, 0x34) = (s16)scale;
    F(s16, sprite, 0x30) =
        (s16)(func_020ae024(F(s32, actor, 0x40) + F(s32, actor, 0x90),
                            -(F(s32, actor, 0x3c) + F(s32, actor, 0x8c))) -
              0x4000);
}

/* Resolves contact with another actor and primes recoil or attachment state. */
extern "C" void func_ov092_0221ab24(void *actor, void *other)
{
    s32 strength = 0x1000;
    if (other == 0)
    {
        func_ov092_02217930(P(actor, 0x88), 0, 0, 0);
    }
    else
    {
        u8 category = F(u8, other, 0x4d);
        if (category == 1 || category == 2 || category == 7)
        {
            s32 vector[4] = {F(s32, actor, 0x38), F(s32, actor, 0x3c),
                             F(s32, actor, 0x40), 0};
            func_ov092_0221ad28(vector, F(s16, F(void *, actor, 0x1fc), 0x2a)
                                            << 4);
            ((Method)F(u32, F(void *, other, 0), 0xb8))(other, vector, 0);
            strength = 0x4000;
        }
        else if (category == 3 &&
                 (F(s16, other, 0x4e) == 0x13 || F(s16, other, 0x4e) == 0x10))
        {
            if (VecFx32Object_GetMagnitude(P(actor, 0x88)) > 0x2000 &&
                F(s16, other, 0xd6) != 1)
            {
                func_0203c660(other, actor, 0);
                F(s32, other, 0x44) = 0x3000;
                F(s32, other, 0x104) = 1;
            }
            strength = 0x2000;
        }
        s32 dx = (F(s32, other, 0x1c) - F(s32, actor, 0x1c)) / 2;
        s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
        s32 length = Fx32Vector2_Magnitude(dx, dy);
        if (length <= 0x1000)
        {
            func_ov092_02217930(P(actor, 0x88), 0, 0, 0);
        }
        else
        {
            F(s32, actor, 0x8c) = -func_020adc90(dx, length);
            F(s32, actor, 0x90) = -func_020adc90(dy, length);
        }
    }
    F(s16, actor, 0x1f8) = 0;
    CallMethod(actor, 0xc8);
    func_ov092_02217930(P(actor, 0x38), 0, 0, strength);
    F(s16, actor, 0xd6) = 1;
    func_02050260(actor);
    func_02050560(actor, other);
}

/* Queues a delayed attack response against a target actor. */
extern "C" void func_ov092_0221ad80(void *actor, void *target, s32 direction,
                                    s32 speed)
{
    F(s32, actor, 0x20c) = F(s32, actor, 0x214) == 0 ? 8 : 6;
    F(void *, actor, 0x200) = target;
    F(s32, actor, 0x204) = speed;
    F(s32, actor, 0x208) = direction;
}

/* Applies the queued attack vector, recoil, effect, and input-facing update. */
extern "C" void func_ov092_0221ada4(void *actor)
{
    F(u32, actor, 0x14) &= ~0x40u;
    void *target = F(void *, actor, 0x200);
    s32 dx = F(s32, actor, 0x1c) - F(s32, target, 0x1c);
    s32 dy = F(s32, actor, 0x20) - F(s32, target, 0x20);
    s32 impulseY;
    if (F(s32, actor, 0x214) == 0)
    {
        dx = (s32)(((s64)dx * 0xaab + 0x800) >> 12);
        impulseY = dy * 3;
    }
    else
    {
        s32 factor = dx > 0 ? 0x99a : -0x99a;
        s32 height = func_020be334(dx);
        if (height < 0xd000)
        {
            height /= 2;
            F(s32, actor, 0x208) = func_020befec(F(s32, actor, 0x208), 3);
            F(s32, actor, 0x204) =
                (s32)(((s64)F(s32, actor, 0x204) * 0x1800 + 0x800) >> 12);
        }
        dx = (s32)(((s64)(dy - 0x4000) * factor + 0x800) >> 12);
        if ((F(u16, gSystemState, 0x1a) & 0x40) != 0)
            dx = (s32)(((s64)dx * 0xc00 + 0x800) >> 12);
        impulseY = -0x4000 - height;
        if (impulseY < -0xc000)
            impulseY = -0xc000;
    }
    s32 length = Fx32Vector2_Magnitude(dx, impulseY);
    if (length > 0x1000)
    {
        s32 effectVector[4] = {
            0, func_020adae4(dx, 2), func_020adae4(impulseY, 2),
            func_020adae4(F(s32, actor, 0x24) + F(s32, target, 0x24), 2)};
        s32 effectTransform[4];
        func_ov092_02219e54(effectTransform, P(actor, 0x18), effectVector);
        s32 motion[4] = {0, func_020adc90(dx * F(s32, actor, 0x208), length),
                         func_020adc90(impulseY * F(s32, actor, 0x208), length),
                         F(s32, actor, 0x204)};
        F(s32, actor, 0x8c) += motion[1];
        F(s32, actor, 0x90) += motion[2];
        Fx32Vector2_LimitMagnitude(P(actor, 0x8c), P(actor, 0x90), 0x10000);
        func_ov092_02217930(P(actor, 0x38), 0, 0, motion[3]);
        F(s32, actor, 0x3c) = func_020adae4(motion[1], 8);
        F(s32, actor, 0x40) = func_020adae4(motion[2], 8);
        func_ov092_0221ad28(motion, -0x7b);
        ((Method)F(u32, F(void *, target, 0), 0xb8))(target, motion, 0);
        s32 effect = func_02003e14(0x14, data_ov092_0221c99c, 4, gHeapContext);
        if (effect != 0)
            func_0201f864(effect, effectTransform,
                          F(void *, F(void *, actor, 0x54), 0), 0x21e0, 0x21e1,
                          0x21e2, 0, -4, -1, 1);
    }
    F(s32, actor, 0x210) = 0x14;
    F(s8, actor, 8) = -F(s8, F(void *, actor, 0x1fc), 0x13);
    F(s8, actor, 9) = -F(s8, F(void *, actor, 0x1fc), 0x14);
    F(s8, actor, 10) = F(s8, F(void *, actor, 0x1fc), 0x13);
    F(s8, actor, 11) = F(s8, F(void *, actor, 0x1fc), 0x14);
}

/* Initializes inherited tracked-resource presentation state. */
extern "C" void func_ov092_0221b0f0(void *actor, const void *config)
{
    func_02050a8c(actor, config);
    func_02072b68(F(void *, actor, 0x54), 0);
    F(s16, F(void *, actor, 0x54), 0x36) = F(s16, config, 10) << 1;
}

/* Clears a temporary actor flag after its virtual readiness gate expires. */
extern "C" void func_ov092_0221b120(void *actor)
{
    if (((Method)F(u32, F(void *, actor, 0), 0xd0))(actor) == 0 &&
        F(s16, actor, 0x1f8) > 8)
        F(u32, actor, 0x10) &= ~0x40000u;
}

/* Reports whether the tracked resource has a nonzero low fifteen-bit state. */
extern "C" s32 func_ov092_0221b158(void *actor)
{
    return (F(u16, actor, 0x1f0) & 0x7fff) != 0;
}

/* Returns the tracked attacker's fixed capability mask. */
extern "C" s32 func_ov092_0221b174(void)
{
    return 0x100000;
}
