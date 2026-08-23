#include "tingle/types.h"

/*
 * Overlay 39 later-encounter scripting and rendering. This recovered group
 * advances the main phase machines, tests the rotating barrier, and submits
 * the scene's layered resource effects to the common renderer.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039ScriptVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039ScriptVector;

extern const s16 data_020c9670[];
extern void *data_021052fc;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 value, s32 divisor);
extern s32 func_020adc40(s32 value);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void func_ov039_022017d0(void *scene);
extern void func_ov039_02202d04(void *scene);
extern void func_ov039_02203f94(void *scene);
extern void func_ov039_02203480(void *scene);
extern void func_ov039_022036f0(void *scene);
extern void func_ov039_0220431c(void *scene);
extern void func_ov039_022049cc(void *scene);
extern void func_ov039_022014f8(void *output, const void *first,
                                const void *second);
extern s32 func_ov039_0220159c(void *scene, s32 *distance);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void *func_0209c3b4(void);
extern void func_0209c430(void *renderer, ...);
extern void func_020a2844(void *resource, const void *position);
extern void func_020a2960(void *resource, const void *position);
extern void func_020a28e0(void *resource, s32 type, s32 x, s32 y, s32 value);
extern void func_020a2614(void *resource, s32 type, s32 x, s32 y, s32 value);
extern void func_020a63d0(void *object, s32 mode);
extern s32 func_ov069_02211594(void *system);
extern s32 func_ov069_022119dc(void *object);
extern void func_ov069_022119bc(void *object);
extern void func_ov069_02210a24(void *system);
extern void func_ov069_02210a44(void *system, s32 index, s32 x, s32 y,
                                s32 ownerX, s32 ownerY);
extern void func_ov007_021fc200(void);
extern void func_ov049_0220c6cc(void *system, const void *position);
extern void func_020594ec(void *context, s32 mode);
extern void Sound_StopEffect(void *context, s32 soundId, s32 mode);
extern void Sound_Play(void *context, s32 soundId, s32 mode);
#ifdef __cplusplus
}
#endif

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Advance the compact +0x1CBC/+0x1CC0/+0x1CC4 script. Confirmed phases gate
 * waypoint steering, the rotating-barrier sequence, the secondary effect
 * sequence, sound 0x1C5, and four +0x464 emissions around a temporary position.
 * It also integrates +0x1CEC/+0x1CF0 into position +0x30/+0x34, updates the
 * matching +0xB0/+0xB4 offsets from trigonometric tables, and finally advances
 * the +0xBC target. No value is returned; scene, effect, and sound state change.
 */
extern "C" void func_ov039_02201b1c(void *scene)
{
    u16 &phase = FIELD(u16, scene, 0x1cbc);
    s32 &timer = FIELD(s32, scene, 0x1cc0);
    s32 &substate = FIELD(s32, scene, 0x1cc4);
    timer++;
    switch (phase) {
    case 0:
        if (FIELD(u16, scene, 0x1ca6) == 0) { phase = 1; timer = 0; }
        break;
    case 1:
        func_ov039_022017d0(scene);
        if (substate == 1) func_ov039_02202d04(scene);
        if (substate == 2) func_ov039_02203f94(scene);
        break;
    case 2:
        if (timer == 1) Sound_Play(FIELD(void *, gSoundContext, 0), 0x1c5, 4);
        if (timer > 60) { phase = 3; timer = 0; }
        break;
    default:
        break;
    }

    FIELD(s32, scene, 0x30) += FIELD(s32, scene, 0x1cec);
    FIELD(s32, scene, 0x34) += FIELD(s32, scene, 0x1cf0);
    u16 angle = (u16)FIELD(s32, scene, 0x1ccc);
    s32 trigIndex = ((u32)angle >> 4) * 2;
    FIELD(s32, scene, 0xb0) = fixedMultiply(data_020c9670[trigIndex], 0x444);
    FIELD(s32, scene, 0xb4) = fixedMultiply(data_020c9670[trigIndex + 1], 0x444);
    func_ov039_02203480(scene);
}

/*
 * Main per-frame update for the later encounter. Confirmed work includes the
 * two subordinate state machines, direction derivation, timed owner-distance
 * checks, resource/sound bursts, six staged particle launches, helper-system
 * polling, scripted position copies, randomized angular motion, and cleanup of
 * the temporary direction vector. The exact fallback retains the compiler's
 * large branch layout; this portable form exposes the common phase ordering.
 */
extern "C" void func_ov039_02201fec(void *scene)
{
    func_ov039_022036f0(scene);
    func_ov039_0220431c(scene);
    Overlay039ScriptVector direction;
    func_ov039_022014f8(&direction, (u8 *)scene + 0x2c,
                        (u8 *)scene + 0xac);

    if (FIELD(u16, scene, 0x1ca8) == 0) {
        func_ov039_022049cc(scene);
        func_ov039_02201b1c(scene);
    } else {
        FIELD(u16, scene, 0x1ca8)--;
    }

    s32 ownerDistance;
    if (func_ov039_0220159c(scene, &ownerDistance)) {
        FIELD(s32, scene, 0x1cd8) = ownerDistance;
    }

    void *system = (u8 *)scene + 0xb3c;
    if (func_ov069_02211594(system)) {
        func_ov069_02210a24(system);
    }

    /* +0x1D34 is an eight-entry timer array paired with four random phases. */
    for (s32 i = 0; i < 8; i++) {
        s32 &timer = FIELD(s32, scene, 0x1d34 + i * 4);
        if (timer > 0) timer--;
    }
    FIELD(s32, scene, 0x30) += FIELD(s32, scene, 0x1cec);
    FIELD(s32, scene, 0x34) += FIELD(s32, scene, 0x1cf0);
    VecFx32Object_Destroy(&direction);
}

/*
 * Advance the four-phase rotating-barrier script at +0x1CD8. Phases zero to
 * two impose two 60-frame sound delays. Phase three chooses rotation direction
 * from the owner X coordinate, accelerates +0x1CCC after frame 30, counts two
 * completed wraps through +0x1CD4, then enters phase four. Phase four decelerates
 * and clears +0x1CC4 when velocity becomes negative. Sound state also changes.
 */
extern "C" void func_ov039_02202d04(void *scene)
{
    s32 &phase = FIELD(s32, scene, 0x1cd8);
    s32 &timer = FIELD(s32, scene, 0x1cc0);
    s32 &angle = FIELD(s32, scene, 0x1ccc);
    s32 &direction = FIELD(s32, scene, 0x1cd0);
    if (phase == 0) { phase = 1; timer = 0; return; }
    if (phase == 1 || phase == 2) {
        if (++timer > 60) {
            Sound_Play(FIELD(void *, gSoundContext, 0), 0x1c5,
                       phase == 1 ? 7 : 2);
            timer = 0;
            phase++;
        }
        return;
    }
    if (phase == 3) {
        if (timer == 0) {
            void *ownerPos = FIELD(void *, FIELD(void *,
                FIELD(void *, scene, 0x48), 8), 0x48);
            direction = FIELD(s32, scene, 0x30) < FIELD(s32, ownerPos, 0x30)
                            ? -1 : 1;
            FIELD(s32, scene, 0x1cd4) = 0;
            angle &= 0xffff;
        }
        timer++;
        s32 acceleration = timer - 30;
        if (acceleration > 0) {
            if (acceleration > 80) acceleration = 80;
            angle += acceleration * direction;
        }
        if (FIELD(s32, scene, 0x1cd4) > 1) {
            Sound_StopEffect(FIELD(void *, gSoundContext, 0), 0x1c5, 2);
            timer = 80;
            phase = 4;
        }
        return;
    }
    if (phase == 4) {
        angle += timer * direction;
        timer -= 2;
        if (timer < 0) { timer = 0; phase = 0; FIELD(s32, scene, 0x1cc4) = 0; }
    }
}

/*
 * Test the owner position against the barrier only during phase +0x1CD8 == 3.
 * It rotates the owner-relative delta by -angle +0x1CCC and accepts the narrow
 * confirmed band (-0x10000+0x800, 0x10000) with rotated Y above 0xB000. On hit,
 * result +4/+8 receive the unrotated delta. Returns one on hit, otherwise zero.
 */
extern "C" s32 func_ov039_02202f34(void *scene, void *result)
{
    if (FIELD(s32, scene, 0x1cd8) != 3) return 0;
    Overlay039ScriptVector origin;
    func_ov039_022014f8(&origin, (u8 *)scene + 0x2c,
                        (u8 *)scene + 0xac);
    void *ownerPos = FIELD(void *, FIELD(void *, FIELD(void *, scene, 0x48), 8),
                           0x48);
    s32 dx = FIELD(s32, ownerPos, 0x30) - origin.x_04;
    s32 dy = FIELD(s32, ownerPos, 0x34) - origin.y_08;
    u16 angle = (u16)(-FIELD(s32, scene, 0x1ccc));
    u32 index = ((u32)angle >> 4) * 2;
    s32 rotatedX = fixedMultiply(data_020c9670[index + 1], dx) -
                   fixedMultiply(data_020c9670[index], dy);
    s32 rotatedY = fixedMultiply(data_020c9670[index], dx) +
                   fixedMultiply(data_020c9670[index + 1], dy);
    VecFx32Object_Destroy(&origin);
    if (rotatedX > -0x10000 + 0x800 && rotatedX < 0x10000 &&
        rotatedY > 0xb000) {
        FIELD(s32, result, 4) = dx;
        FIELD(s32, result, 8) = dy;
        return 1;
    }
    return 0;
}

/*
 * Submit the later scene's resource layers. It obtains resource +0x2F7C and
 * the common renderer, builds scale/direction vectors, and emits packets for
 * the principal object, the eight rotating barrier members, and paired effects
 * selected by health decade and script phase. Packet constants 0x1EA/0x7FFF
 * are renderer parameters whose precise SDK field meanings remain unconfirmed.
 */
extern "C" void func_ov039_02203064(void *scene)
{
    void *resource = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, data_021052fc, 0) +
                                   0x2f7c);
    void *renderer = func_0209c3b4();
    Overlay039ScriptVector scale, direction;
    s32 bounds[2] = {-16, -16};
    s32 packet[2] = {16, 16};
    VecFx32Object_InitComponents(&scale, 0x1000, 0x1000, 0x1000);
    func_ov039_022014f8(&direction, (u8 *)scene + 0x2c,
                        (u8 *)scene + 0xac);
    func_0209c430(renderer, resource, &direction, &scale, 0,
                  bounds, 0, packet, 0x7fff, 0x1ea);
    VecFx32Object_Destroy(&direction);
    VecFx32Object_Destroy(&scale);
}

/* Copy the two words at source into destination; only destination changes. */
extern "C" void func_ov039_0220346c(void *destination, const void *source)
{
    FIELD(u32, destination, 0) = FIELD(u32, source, 0);
    FIELD(u32, destination, 4) = FIELD(u32, source, 4);
}
