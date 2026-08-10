#include "tingle/types.h"

/*
 * Overlay 41 descriptor-pool update. This recovered routine animates active
 * world entries, assigns the twelve reusable render children by camera range,
 * emits periodic particles, and drives the alternate-mode spawn schedule.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_ov041_021ff658(void *, s32);
void GraphicsSpriteState_SetAnimationIndex(void *, s32);
void Sound_Play(void *, s32, s32);
void func_0205940c(void *, s32, s32);
void func_02004fe0(void *);
void func_02005058(void *);
s32 func_ov041_021ff5a8(void *, s32, const void *);
u32 genrand_int32(void);
void func_ov041_021fd000(void *);
void func_020a29ac(void *, s32, s32, s32);
extern void *gSoundContext;
extern const s32 data_ov041_02204c38[8];
extern const s32 data_ov041_02204c28[4];
extern const u8 data_ov041_02204d00[];
extern const s32 data_ov041_02204ccc[11];
extern const s32 data_ov041_02204ca0[11];
}

static s16 *types(void *object) { return (s16 *)FIELD(void *, object, 0x80); }
static s16 *phases(void *object) { return (s16 *)FIELD(void *, object, 0x8c); }
static s32 *velocities(void *object) { return (s32 *)FIELD(void *, object, 0x90); }
static s16 *render_links(void *object) { return (s16 *)FIELD(void *, object, 0x98); }
static u8 *positions(void *object) { return (u8 *)FIELD(void *, object, 0x84); }
static u8 *origins(void *object) { return (u8 *)FIELD(void *, object, 0x88); }

static void hide_linked_render(void *object, s32 entry)
{
    s32 link = render_links(object)[entry];
    if (link < 0)
        return;
    void *render = FIELD(void *, object, 0x4c + link * 4);
    FIELD(u16, render, 0x42) |= 4;
    FIELD(u16, FIELD(void *, render, 0x0c), 0x24) |= 4;
    render_links(object)[entry] = -1;
}

static void update_render_link(void *object, s32 entry, s32 visible)
{
    s32 link = render_links(object)[entry];
    if (link < 0 && visible) {
        for (s32 candidate = 11; candidate >= 0; --candidate) {
            void *render = FIELD(void *, object, 0x4c + candidate * 4);
            if ((FIELD(u16, render, 0x42) & 4) != 0) {
                render_links(object)[entry] = (s16)candidate;
                FIELD(u16, render, 0x42) &= ~4;
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, render, 0x0c),
                              data_ov041_02204d00[types(object)[entry]]);
                return;
            }
        }
    } else if (link >= 0 && !visible) {
        hide_linked_render(object, entry);
    }
}

static void update_scrolling_mode(void *object)
{
    void *owner = FIELD(void *, object, 0x48);
    s32 selected = FIELD(s32, FIELD(void *, owner, 8), 0x120);
    if (selected > -1 && velocities(object)[selected] == 0) {
        s32 type = types(object)[selected];
        if ((u16)(type - 2) <= 1 && phases(object)[selected] < 0)
            phases(object)[selected] = 1;
    }

    s32 lowerLimit = FIELD(s32, FIELD(void *, owner, 0x14), 0x15c);
    s32 count = FIELD(s32, object, 0x1ac);
    for (s32 i = count - 1; i >= 0; --i) {
        s32 type = types(object)[i];
        if (type <= -1)
            continue;
        u8 *position = positions(object) + i * 12;
        u8 *origin = origins(object) + i * 12;
        s32 velocity = velocities(object)[i];
        if (velocity > 0) {
            FIELD(s32, position, 8) += velocity;
            velocities(object)[i] = velocity + 0x19a;
        } else if ((u16)(type - 2) <= 1) {
            s32 phase = phases(object)[i];
            if (phase > 0) {
                ++phases(object)[i];
                s32 frame = (phase + (phase < 0)) >> 1;
                frame %= 4;
                if (phase > 0x23)
                    frame += 4;
                FIELD(s32, position, 4) =
                    FIELD(s32, origin, 4) + data_ov041_02204c38[frame];
                if ((phases(object)[i] & 7) == 4)
                    Sound_Play(gSoundContext, 0, 0x10);
                if (phases(object)[i] > 0x46) {
                    velocities(object)[i] = 0x1000;
                    func_0205940c(gSoundContext, 0x12d, 5);
                }
            } else {
                if (phase < -0x3c) {
                    s32 frame = -((phase + (phase < 0)) >> 1) % 4;
                    FIELD(s32, position, 4) =
                        FIELD(s32, origin, 4) + data_ov041_02204c28[frame];
                }
                --phases(object)[i];
            }
        }

        if (FIELD(s32, position, 8) > lowerLimit) {
            func_ov041_021ff658(object, i);
            continue;
        }
        s32 relativeY = FIELD(s32, position, 8) - FIELD(s32, owner, 0x194);
        s32 visible = relativeY >= -0xd2000 && relativeY <= 0xd2000;
        update_render_link(object, i, visible);
    }

    for (s32 i = count - 1; i >= 0; --i) {
        s32 link = render_links(object)[i];
        if (types(object)[i] >= 0 && link >= 0) {
            void *render = FIELD(void *, object, 0x4c + link * 4);
            FIELD(s32, render, 0x30) = FIELD(s32, positions(object) + i * 12, 4);
            FIELD(s32, render, 0x34) = FIELD(s32, positions(object) + i * 12, 8);
        }
    }
}

static void update_alternate_mode(void *object)
{
    void *owner = FIELD(void *, object, 0x48);
    if (FIELD(u16, FIELD(void *, owner, 8), 0x140) <= 2)
        return;

    void *special = FIELD(void *, object, 0x7c);
    if ((FIELD(u16, special, 0x42) & 4) == 0) {
        FIELD(s32, special, 0x34) += 0x2000;
        if (FIELD(s32, special, 0x34) - FIELD(s32, owner, 0x194) < -0xc8000)
            FIELD(u16, special, 0x42) |= 4;
    }

    if (FIELD(s32, object, 0x1b8) >= 0 &&
        FIELD(s32, owner, 0x194) > FIELD(s32, object, 0xa8)) {
        --FIELD(s32, object, 0x1b0);
        if (FIELD(s32, object, 0x1b0) < 0) {
            s32 schedule = FIELD(s32, object, 0x1b8);
            if (FIELD(s32, object, 0x1b4) == 1) {
                FIELD(s32, object, 0x1b0) = data_ov041_02204ccc[schedule];
                FIELD(s32, object, 0x1b4) = 0;
                if (++FIELD(s32, object, 0x1b8) >= 11)
                    FIELD(s32, object, 0x1b8) = -1;
            } else {
                FIELD(s32, object, 0x1b0) = data_ov041_02204ca0[schedule];
                FIELD(s32, object, 0x1b4) = 1;
            }
        } else if (FIELD(s32, object, 0x1b4) != 0) {
            s32 point[4];
            func_02004fe0(point);
            point[1] = FIELD(s32, object, 0xa4);
            point[2] = FIELD(s32, object, 0xa8) + 0xd2000;
            point[3] = 0;
            s32 index = FIELD(s32, object, 0x1a4);
            s32 entry = func_ov041_021ff5a8(
                object, FIELD(s32, object, 0xac + index * 4), point);
            phases(object)[entry] =
                (s16)(((s32)(genrand_int32() % 9) - 4) * 0x8c);
            ++FIELD(s32, object, 0x1a4);
            func_02005058(point);
        }
        FIELD(s32, object, 0xa4) += ((s32)(genrand_int32() % 13) - 6) << 16;
        if (FIELD(s32, object, 0xa4) < 0x10000)
            FIELD(s32, object, 0xa4) = 0x20000 - FIELD(s32, object, 0xa4);
        if (FIELD(s32, object, 0xa4) > 0xf0000)
            FIELD(s32, object, 0xa4) = 0x1e0000 - FIELD(s32, object, 0xa4);
        FIELD(s32, object, 0xa8) += 0x64000;
    }

    for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
        if (types(object)[i] <= -1)
            continue;
        u8 *position = positions(object) + i * 12;
        FIELD(s32, position, 8) += (genrand_int32() & 0x2000) + 0x3000;
        ((u16 *)FIELD(void *, object, 0x94))[i] += (u16)phases(object)[i];
        if ((FIELD(s32, object, 0x1a8) & 7) == 0) {
            s32 particle[3];
            func_ov041_021fd000(particle);
            particle[1] = FIELD(s32, position, 4);
            particle[2] = FIELD(s32, position, 8);
            func_020a29ac(FIELD(void *, owner, 0x18), 0,
                          particle[1] >> 12, particle[2] >> 12);
        }
        if (FIELD(s32, position, 8) - FIELD(s32, owner, 0x194) < -0xd2000)
            types(object)[i] = -1;
    }
}

/*
 * Update every active descriptor. Modes 0/2 animate and cull world entries,
 * dynamically lease visible render children, and mirror positions to them.
 * Other modes drive the scripted falling-object schedule and particle emission.
 * The routine mutates pool/render/owner-linked state, consumes RNG, and may
 * issue audio and particle SDK effects.
 */
extern "C" void func_ov041_021ff868(void *object)
{
    s32 mode = FIELD(s32, FIELD(void *, object, 0x48), 0x1f4);
    if (mode == 0 || mode == 2)
        update_scrolling_mode(object);
    else
        update_alternate_mode(object);
}

/*
 * Return true only when the alternate-mode schedule index has reached its
 * terminal negative value and every descriptor slot is inactive. No state is
 * changed and no SDK or hardware calls are made.
 */
extern "C" s32 func_ov041_021fff80(void *object)
{
    if (FIELD(s32, object, 0x1b8) > -1)
        return 0;
    for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
        if (types(object)[i] > -1)
            return 0;
    }
    return 1;
}
