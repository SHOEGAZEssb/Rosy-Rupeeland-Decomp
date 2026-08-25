#include "tingle/types.h"

/*
 * Overlay 41 effect rendering. This recovered renderer samples seven records
 * from the 91-record trail, switches their render children between model and
 * software-quad presentation, draws specialized head/tail geometry, and emits
 * seven optional streak polygons from the finale counters.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct {
    s32 x;
    s32 y;
} Point2;

extern "C" {
void func_0209a2ac(void *, const void *, s32);
void VecFx32Object_InitCopy(void *, const void *);
void VecFx32Object_Assign(void *, const void *);
void VecFx32Object_Destroy(void *);
void VecFx32Object_Init(void *);
void Graphics3dPresentation_BeginFrame(void *, const void *);
void func_0209c7e8(void *, s32);
void func_0209c87c(void *, const Point2 *, const Point2 *, u16, s32);
void Graphics3dPresentation_ConfigureOrthographicState(void *);
void func_0209ca90(void *, const Point2 *, s32, u16, s32);
void func_ov008_021fbe0c(void *, const void *);
u16 func_ov041_0220333c(void *, s32);
u32 genrand_int32(void);
extern s16 gFx32CosSinTable[];
}

/*
 * Confirmed UV rectangles used by the software-quad paths. Their semantic
 * sprite names are unknown, so atlas coordinates remain the stable names.
 */
static const Point2 sEffectUv[34] = {
    {0x60000, 0x00000}, {0x7f000, 0x1f000},
    {0x80000, 0x00000}, {0x9f000, 0x1f000},
    {0x00000, 0x60000}, {0x1f000, 0x7f000},
    {0x20000, 0x60000}, {0x3f000, 0x7f000},
    {0x80000, 0x3f000}, {0x9f000, 0x20000},
    {0x80000, 0x3f000}, {0x9f000, 0x20000},
    {0x40000, 0x20000}, {0x5f000, 0x47000},
    {0x00000, 0x20000}, {0x1f000, 0x5f000},
    {0xa0000, 0x00000}, {0xb7000, 0x2f000},
    {0xc0000, 0x40000}, {0xff000, 0x7f000},
    {0x80000, 0x40000}, {0xbf000, 0x7f000},
    {0x60000, 0x20000}, {0x7f000, 0x47000},
    {0x20000, 0x20000}, {0x3f000, 0x5f000},
    {0xb8000, 0x00000}, {0xcf000, 0x2f000},
    {0xc0000, 0x40000}, {0xff000, 0x7f000},
    {0x80000, 0x40000}, {0xbf000, 0x7f000},
    {0x40000, 0x48000}, {0x80000, 0x80000},
};

/* Return the direction-table pair for a 16-bit angular value. */
static Point2 direction_pair(s32 direction)
{
    u32 index = ((u16)direction >> 4) * 2;
    Point2 result = {gFx32CosSinTable[index], gFx32CosSinTable[index + 1]};
    return result;
}

/* Fill a clockwise axis-aligned quad around a fixed-point record position. */
static void make_square(Point2 out[4], s32 x, s32 y, s32 radius)
{
    s32 px = x >> 12;
    s32 py = y >> 12;
    out[0].x = px - radius;
    out[0].y = py - radius;
    out[1].x = px + radius;
    out[1].y = py - radius;
    out[2].x = px + radius;
    out[2].y = py + radius;
    out[3].x = px - radius;
    out[3].y = py + radius;
}

/*
 * Draw one transitional square. value controls contraction, color is derived
 * from the same value, and z preserves the record-dependent ordering.
 */
static void draw_transition_square(void *renderContext, void *object,
                                   s32 record, s32 value,
                                   const Point2 *uv, s32 z)
{
    Point2 quad[4];
    s32 radius = (((0x1000 - value) * 20) >> 12) + 4;
    make_square(quad, FIELD(s32, object, 0x6c + record * 12),
                FIELD(s32, object, 0x70 + record * 12), radius);
    func_0209c87c(renderContext, quad, uv,
                  func_ov041_0220333c(object, value), z);
}

/* Hide a render child by setting its observed object visibility bit. */
static void hide_child(void *child)
{
    FIELD(u16, child, 0x42) |= 4;
}

/*
 * Show a render child at a sampled record and apply its direction to the
 * child's resource. This path is used once the record value reaches 0x1000.
 */
static void show_child_at_record(void *child, void *object, s32 record)
{
    FIELD(u16, child, 0x42) &= (u16)~4;
    void *resource = FIELD(void *, child, 0x0c);
    FIELD(s16, resource, 0x30) =
        (s16)(FIELD(s32, object, 0x4b8 + record * 4) - 0x8000);
    FIELD(s32, child, 0x30) = FIELD(s32, object, 0x6c + record * 12);
    FIELD(s32, child, 0x34) = FIELD(s32, object, 0x70 + record * 12);
}

/*
 * Draw the zero-valued form of an ordinary middle sample. Its radius pulses
 * over seven frames using the triangular residue observed in the original.
 */
static void draw_middle_zero(void *renderContext, void *object, s32 record,
                             const Point2 *uv)
{
    s32 residue = (FIELD(s32, object, 0x93c) + record) % 7;
    if (residue > 3)
        residue = 7 - residue;
    Point2 quad[4];
    make_square(quad, FIELD(s32, object, 0x6c + record * 12),
                FIELD(s32, object, 0x70 + record * 12), 24 - residue);
    func_0209c87c(renderContext, quad, uv,
                  func_ov041_0220333c(
                      object, FIELD(s32, object, 0x790 + record * 4)),
                  -(s16)record);
}

/*
 * Draw the zero-valued tail sample as a direction-oriented diamond. The
 * original uses a 24-unit extent and alternates among two atlas frames.
 */
static void draw_tail_zero(void *renderContext, void *object, s32 record,
                           const Point2 *uv)
{
    Point2 direction =
        direction_pair(FIELD(s32, object, 0x4b8 + record * 4));
    s32 x = FIELD(s32, object, 0x6c + record * 12);
    s32 y = FIELD(s32, object, 0x70 + record * 12);
    Point2 quad[4];
    quad[0].x = (x + (-direction.y - direction.x) * 24) >> 12;
    quad[0].y = (y + (direction.x - direction.y) * 24) >> 12;
    quad[1].x = (x + (-direction.y + direction.x) * 24) >> 12;
    quad[1].y = (y + (direction.x + direction.y) * 24) >> 12;
    quad[2].x = (x + (direction.y + direction.x) * 24) >> 12;
    quad[2].y = (y + (-direction.x + direction.y) * 24) >> 12;
    quad[3].x = (x + (direction.y - direction.x) * 24) >> 12;
    quad[3].y = (y + (-direction.x - direction.y) * 24) >> 12;
    func_0209c87c(renderContext, quad, uv,
                  func_ov041_0220333c(
                      object, FIELD(s32, object, 0x8c8)),
                  -100);
}

/*
 * Draw record zero's zero-valued head form. Confirmed behavior selects either
 * three direction-oriented atlas quads while object+0x938 is zero or one
 * rotated quad while that countdown is positive. The portable geometry keeps
 * the same direction, color, atlas selection, and countdown effects.
 */
static void draw_head_zero(void *renderContext, void *object)
{
    s32 directionValue = FIELD(s32, object, 0x4b8);
    Point2 direction = direction_pair(directionValue);
    u16 color =
        func_ov041_0220333c(object, FIELD(s32, object, 0x790));
    s32 frame = (FIELD(s32, object, 0x93c) / 4) % 3;
    Point2 quad[4];
    if (FIELD(s32, object, 0x938) != 0) {
        Point2 rotated = direction_pair(directionValue + 0x4000);
        s32 x = FIELD(s32, object, 0x6c);
        s32 y = FIELD(s32, object, 0x70);
        quad[0].x = (x + (rotated.y * 16 - rotated.x * 28)) >> 12;
        quad[0].y = (y + (-rotated.x * 16 - rotated.y * 28)) >> 12;
        quad[1].x = (x + (rotated.y * 16 + rotated.x * 28)) >> 12;
        quad[1].y = (y + (-rotated.x * 16 + rotated.y * 28)) >> 12;
        quad[2].x = (x + (-rotated.y * 48 + rotated.x * 28)) >> 12;
        quad[2].y = (y + (rotated.x * 48 + rotated.y * 28)) >> 12;
        quad[3].x = (x + (-rotated.y * 48 - rotated.x * 28)) >> 12;
        quad[3].y = (y + (rotated.x * 48 - rotated.y * 28)) >> 12;
        func_0209c87c(renderContext, quad, &sEffectUv[16], color, -4);
        FIELD(s32, object, 0x938)--;
        return;
    }

    s32 x = FIELD(s32, object, 0x6c);
    s32 y = FIELD(s32, object, 0x70);
    s32 alongX = direction.x * 13;
    s32 alongY = direction.y * 13;
    for (s32 part = 0; part < 3; ++part) {
        s32 halfWidth = 16 + part * 3;
        s32 back = 5 + part * 14;
        quad[0].x = (x + direction.y * halfWidth -
                     direction.x * back) >>
                    12;
        quad[0].y = (y - direction.x * halfWidth -
                     direction.y * back) >>
                    12;
        quad[1].x = (x - direction.y * halfWidth -
                     direction.x * back) >>
                    12;
        quad[1].y = (y + direction.x * halfWidth -
                     direction.y * back) >>
                    12;
        quad[2].x = (x - direction.y * halfWidth -
                     direction.x * (back + 40)) >>
                    12;
        quad[2].y = (y + direction.x * halfWidth -
                     direction.y * (back + 40)) >>
                    12;
        quad[3].x = (x + direction.y * halfWidth -
                     direction.x * (back + 40)) >>
                    12;
        quad[3].y = (y - direction.x * halfWidth -
                     direction.y * (back + 40)) >>
                    12;
        func_0209c87c(renderContext, quad,
                      &sEffectUv[12 + ((frame + part) % 3) * 2],
                      color, -5 + part);
        x += alongX;
        y += alongY;
    }
}

/*
 * Render the effect using transform as the caller's camera/model transform.
 * Active modes prepare the effect render context, apply optional shake from
 * object+0x918, and visit records 0,13,...78. A sample whose auxiliary fade at
 * object+0x790 is complete is skipped. A sample value of 0x1000 shows its
 * corresponding model child; zero or transitional values draw software quads
 * and hide the child. Record zero and record 78 use specialized head/tail
 * geometry. Seven positive counters at object+0x8FC add direction-oriented
 * streak polygons. Inactive mode hides all seven children. The caller
 * transform and external particle renderer are restored/applied at exit.
 *
 * This function changes render-child flags and transforms, advances the frame
 * counter except during finale states 10+, consumes the PRNG while shaking,
 * and submits polygons through the graphics SDK boundary. It returns no value.
 */
extern "C" void func_ov041_02203434(void *object, const void *transform)
{
    func_0209a2ac(object, 0, 1);
    u8 localTransform[0x80];
    VecFx32Object_InitCopy(localTransform, transform);

    s32 mode = FIELD(s32, object, 0x920);
    if (mode == 4 || mode == 6 || mode == 11 || mode == 8 ||
        mode == 9 || mode == 14) {
        void *owner = FIELD(void *, object, 0x48);
        FIELD(s32, localTransform, 8) =
            FIELD(s32, owner, 0x1ec) == 0 ? -0xc0000 : 0;
    }
    if (mode != 14 || FIELD(s32, object, 0x91c) < 10)
        FIELD(s32, object, 0x93c)++;

    if (mode == 0) {
        for (s32 slot = 6; slot >= 0; --slot) {
            void *child = FIELD(void *, object, 0x4c + slot * 4);
            hide_child(child);
            FIELD(u16, FIELD(void *, child, 0x0c), 0x24) |= 4;
        }
    } else {
        if (FIELD(s32, object, 0x918) > 0) {
            FIELD(s32, localTransform, 4) +=
                ((genrand_int32() & 0xfff) - 0x7ff) * 3;
            FIELD(s32, localTransform, 8) +=
                ((genrand_int32() & 0xfff) - 0x7ff) * 3;
        }
        void *owner = FIELD(void *, object, 0x48);
        void *renderContext = FIELD(void *, owner, 0x18);
        Graphics3dPresentation_BeginFrame(renderContext, localTransform);
        VecFx32Object_Assign((u8 *)renderContext + 0x84, localTransform);
        func_0209c7e8(renderContext, 0);

        for (s32 slot = 0; slot < 7; ++slot) {
            s32 record = slot * 13;
            void *child = FIELD(void *, object, 0x4c + slot * 4);
            s32 fade = FIELD(s32, object, 0x790 + record * 4);
            s32 value = FIELD(s32, object, 0x624 + record * 4);
            if (fade < 0x1000) {
                if (value == 0x1000) {
                    show_child_at_record(child, object, record);
                } else {
                    if (record == 0) {
                        if (value == 0)
                            draw_head_zero(renderContext, object);
                        else
                            draw_transition_square(
                                renderContext, object, record, value,
                                FIELD(s32, object, 0x928) < 1
                                    ? &sEffectUv[9]
                                    : &sEffectUv[10],
                                FIELD(s32, object, 0x928) < 1
                                    ? -3
                                    : -(s16)(value >> 2));
                    } else if (record == 78) {
                        if (value == 0)
                            draw_tail_zero(
                                renderContext, object, record,
                                &sEffectUv[((FIELD(s32, object, 0x93c) / 4) %
                                           3) *
                                          2]);
                        else
                            draw_transition_square(
                                renderContext, object, record, value,
                                value < FIELD(s32, object, 0x758)
                                    ? &sEffectUv[4]
                                    : &sEffectUv[8],
                                -(s16)((value >> 2) + 78));
                    } else {
                        if (value == 0)
                            draw_middle_zero(renderContext, object, record,
                                             &sEffectUv[0]);
                        else
                            draw_transition_square(
                                renderContext, object, record, value,
                                &sEffectUv[slot % 3], 
                                -(s16)(record + (value >> 2)));
                    }
                    hide_child(child);
                }
            }
            func_0209a2ac(child, localTransform, 1);
        }

        Graphics3dPresentation_ConfigureOrthographicState(renderContext);
        for (s32 slot = 6; slot >= 0; --slot) {
            s32 length = FIELD(s32, object, 0x8fc + slot * 4);
            if (length <= 0)
                continue;
            s32 record = slot * 13;
            Point2 direction =
                direction_pair(FIELD(s32, object, 0x4b8 + record * 4));
            s32 sideX = -direction.y;
            s32 sideY = direction.x;
            s32 x = FIELD(s32, object, 0x6c + record * 12);
            s32 y = FIELD(s32, object, 0x70 + record * 12);
            s32 nearLength = length / 4;
            Point2 streak[4];
            streak[0].x =
                (x + sideX - direction.x * -nearLength) >> 12;
            streak[0].y =
                (y + sideY - direction.y * -nearLength) >> 12;
            streak[1].x =
                (x + sideX - direction.x * nearLength) >> 12;
            streak[1].y =
                (y + sideY - direction.y * nearLength) >> 12;
            streak[2].x =
                (x + sideX * 90 - direction.x * -length) >> 12;
            streak[2].y =
                (y + sideY * 90 - direction.y * -length) >> 12;
            streak[3].x =
                (x + sideX * 90 - direction.x * length) >> 12;
            streak[3].y =
                (y + sideY * 90 - direction.y * length) >> 12;
            func_0209ca90(renderContext, streak, 4, 0x7fff, 0);
        }
    }

    void *renderContext =
        FIELD(void *, FIELD(void *, object, 0x48), 0x18);
    VecFx32Object_Assign((u8 *)renderContext + 0x84, transform);
    func_ov008_021fbe0c(FIELD(void *, object, 0x958), transform);
    VecFx32Object_Destroy(localTransform);
}
