#include "tingle/types.h"

/* Initialize the common actor header, position vectors, and byte bounds. */
typedef struct ActorByteBounds {
    s8 minX;
    s8 minY;
    s8 maxX;
    s8 maxY;
} ActorByteBounds;

typedef struct ActorVector {
    s32 word[4];
} ActorVector;

typedef struct ActorBaseGeometry {
    void *vtable_00;
    ActorByteBounds bounds_04;
    ActorByteBounds bounds_08;
    void *field_0c;
    void *field_10;
    void *field_14;
    ActorVector position_18;
    ActorVector previousPosition_28;
    ActorVector field_38;
    u8 field_48;
    u8 field_49;
    u8 field_4a;
    u8 field_4b;
    u8 field_4c;
    u8 type_4d;
    u16 subtype_4e;
    s16 descriptorValue_50;
} ActorBaseGeometry;

typedef struct ActorBaseDescriptor {
    u16 kind_00;
    u16 subtype_02;
    u8 field_04[0x0e];
    u8 halfWidth_12;
    u8 halfHeight_13;
    u8 boundsOffsetX_14;
    u8 boundsOffsetY_15;
    u8 field_16[0x0c];
    s16 positionX_22;
    s16 positionY_24;
    s16 positionZ_26;
    void *field_28;
    u8 field_2c[0x24];
    s16 descriptorValue_50;
    u8 field_52[6];
    void *field_58;
} ActorBaseDescriptor;

extern u8 data_020def7c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitComponents(ActorVector *, s32, s32, s32);
extern void VecFx32Object_Assign(ActorVector *, const ActorVector *);
#ifdef __cplusplus
}
#endif

/* Copy four signed bound bytes from source to destination; return no value. */
void ActorBounds_Copy(ActorByteBounds *destination,
                      const ActorByteBounds *source)
{
    destination->minX = source->minX;
    destination->minY = source->minY;
    destination->maxX = source->maxX;
    destination->maxY = source->maxY;
}

/* Set the four signed bytes of a bounds record and return no value. */
void ActorBounds_Set(ActorByteBounds *bounds, s32 minX, s32 minY, s32 maxX,
                     s32 maxY)
{
    bounds->minX = (s8)minX;
    bounds->minY = (s8)minY;
    bounds->maxX = (s8)maxX;
    bounds->maxY = (s8)maxY;
}

/* Add X to both X edges and Y to both Y edges; return no value. */
void ActorBounds_Translate(ActorByteBounds *bounds, s32 x, s32 y)
{
    bounds->minX += x;
    bounds->minY += y;
    bounds->maxX += x;
    bounds->maxY += y;
}

/*
 * Install data_020def7c as the base vtable and initialize offsets 0x04-0x50
 * from descriptor fields. Positions at 0x22/0x24/0x26 become 20.12 fixed
 * point vectors; byte 0x12/0x13 half-extents form symmetric bounds, while
 * bytes 0x14/0x15 offset the second bounds record. Offset 0x28 is retained in
 * fields 0x0c/0x14 and the initial position is copied to offset 0x28. Returns
 * self. Vector helpers may manage SDK value-object state but no hardware.
 */
ActorBaseGeometry *ActorBaseGeometry_Init(
    ActorBaseGeometry *self, const ActorBaseDescriptor *descriptor)
{
    ActorByteBounds bounds;
    s32 halfWidth;
    s32 halfHeight;

    self->vtable_00 = data_020def7c;
    ActorBounds_Set(&self->bounds_04, 0, 0, 0, 0);
    ActorBounds_Set(&self->bounds_08, 0, 0, 0, 0);
    self->field_0c = 0;
    self->field_10 = descriptor->field_58;
    self->field_14 = 0;
    VecFx32Object_InitComponents(&self->position_18, descriptor->positionX_22 << 12,
                  descriptor->positionY_24 << 12,
                  descriptor->positionZ_26 << 12);
    VecFx32Object_InitComponents(&self->previousPosition_28,
                  descriptor->positionX_22 << 12,
                  descriptor->positionY_24 << 12,
                  descriptor->positionZ_26 << 12);
    VecFx32Object_InitComponents(&self->field_38, 0, 0, 0);
    self->field_48 = 0;
    self->field_49 = 0;
    self->field_4a = 0;
    self->field_4b = 0;
    self->field_4c = 0;
    self->type_4d = (u8)descriptor->kind_00;
    self->subtype_4e = descriptor->subtype_02;
    halfWidth = descriptor->halfWidth_12 >> 1;
    halfHeight = descriptor->halfHeight_13 >> 1;
    ActorBounds_Set(&bounds, -halfWidth, -halfHeight, halfWidth, halfHeight);
    ActorBounds_Copy(&self->bounds_04, &bounds);
    ActorBounds_Copy(&self->bounds_08, &bounds);
    ActorBounds_Translate(&self->bounds_08, descriptor->boundsOffsetX_14,
                          descriptor->boundsOffsetY_15);
    self->field_0c = descriptor->field_28;
    self->field_14 = descriptor->field_28;
    VecFx32Object_Assign(&self->previousPosition_28, &self->position_18);
    self->descriptorValue_50 = descriptor->descriptorValue_50;
    return self;
}
