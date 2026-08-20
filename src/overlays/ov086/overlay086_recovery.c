#include "tingle/types.h"

/* Overlay 86 defines a compact ActorExtendedType2 subclass. Its overrides
 * install the derived vtable, gate reentry from GameWork and the paired actor,
 * expose state predicates/constants, forward transform copies, and control
 * the actor's auxiliary presentation. */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))
#define METHOD(p, o) F(void *, F(void *, (p), 0), (o))
typedef s32 (*Predicate)(void *);
typedef void (*ForwardMethod)(void *, void *, s32, void *, void *);

extern u8 data_ov086_02212e40[];
extern void *data_021052fc, *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorExtendedTransform_Init(...);
extern void ActorExtendedTransform_Destroy(...), Heap_Free(...);
extern void ActorExtendedType2_InitializeReentryState(...);
extern s32 GameWork_TestFlag(...);
extern void VecFx32Object_InitCopy(...);
#ifdef __cplusplus
}
#endif

/* Construct the derived transform and install overlay 86's vtable. */
void *func_ov086_02212ae0(void *actor) {
  ActorExtendedTransform_Init(actor);
  F(void *, actor, 0) = data_ov086_02212e40;
  return actor;
}

/* Destroy the inherited transform while retaining caller-owned storage. */
void *func_ov086_02212b00(void *actor) {
  ActorExtendedTransform_Destroy(actor);
  return actor;
}

/* Destroy the inherited transform and release the actor's heap storage. */
void *func_ov086_02212b14(void *actor) {
  ActorExtendedTransform_Destroy(actor);
  Heap_Free(actor);
  return actor;
}

/* Initialize the inherited reentry state. Flag 0x44b enables this actor unless
 * the paired type-5 actor is still active, then fixes derived capability bits.
 */
void func_ov086_02212b30(void *actor, void *state, void *context) {
  if (GameWork_TestFlag(gGameWork, 0x44b) != 0 && F(s32, actor, 0x1fc) <= 0) {
    void *paired = F(void *, data_021052fc, 0x2ea8);
    if (paired == 0 || F(s16, F(void *, paired, 0x29c), 0x36) != 5 ||
        F(s32, paired, 0x1fc) == 0)
      F(s32, actor, 0x1fc) = 1;
  }
  ActorExtendedType2_InitializeReentryState(actor, state, context);
  F(u32, actor, 0x260) &= ~8u;
  F(u32, actor, 0x10) |= 0x90000;
}

/* Default virtual predicate: this subclass does not claim the optional mode. */
s32 func_ov086_02212bec(void) { return 0; }

/* Initialize a vector from the actor's position payload at offset 0x18. */
void func_ov086_02212bf4(void *out, const void *actor) {
  VecFx32Object_InitCopy(out, (const u8 *)actor + 0x18);
}

/* Return the raw actor-state bit 7 mask. */
u32 func_ov086_02212c04(const void *actor) {
  return F(const u32, actor, 0xd0) & 0x80;
}

/* Return whether actor-state bit 6 is set. */
s32 func_ov086_02212c10(const void *actor) {
  return (F(const u32, actor, 0xd0) & 0x40) != 0;
}

/* Default virtual query: no alternate record is selected. */
s32 func_ov086_02212c24(void) { return 0; }

/* Intentional virtual no-op used by the inherited dispatch table. */
void func_ov086_02212c2c(void) {}

/* Intentional second virtual no-op used by the inherited dispatch table. */
void func_ov086_02212c30(void) {}

/* Return the subclass's fixed count/limit of sixteen. */
s32 func_ov086_02212c34(void) { return 16; }

/* Return the embedded position/vector payload at actor offset 0x18. */
void *func_ov086_02212c3c(void *actor) { return (u8 *)actor + 0x18; }

/* Return the subclass's fixed 20.12 range of 192 pixels. */
s32 func_ov086_02212c44(void) { return 0xc0000; }

/* Forward the first inherited event through virtual slot 0x108 with the
 * subclass's required zero selector. */
void func_ov086_02212c4c(void *actor, void *event, void *unused,
                         void *context) {
  (void)unused;
  ((ForwardMethod)METHOD(actor, 0x108))(actor, event, 0, METHOD(actor, 0x108),
                                        context);
}

/* Forward the paired inherited event through the same virtual slot. */
void func_ov086_02212c64(void *actor, void *event, void *unused,
                         void *context) {
  (void)unused;
  ((ForwardMethod)METHOD(actor, 0x108))(actor, event, 0, METHOD(actor, 0x108),
                                        context);
}

/* Default virtual predicate: no auxiliary action is pending. */
s32 func_ov086_02212c7c(void) { return 0; }

/* Enable the derived capability represented by bit 4 at offset 0x260. */
void func_ov086_02212c84(void *actor) { F(u32, actor, 0x260) |= 0x10; }

/* Report the exact inherited state combination that permits the guarded
 * action: bit 3 set, bit 1 clear or the slot-0xa8 predicate accepting. */
s32 func_ov086_02212c94(void *actor) {
  if ((F(u32, actor, 0x260) & 8) == 0)
    return 0;
  if ((F(u32, actor, 0x260) & 2) == 0)
    return 1;
  return ((Predicate)METHOD(actor, 0xa8))(actor) == 0;
}

/* Return whether the actor's byte state is the derived value eight. */
s32 func_ov086_02212cdc(const void *actor) {
  return F(const u8, actor, 0x24c) == 8;
}

/* Reject only inherited state 16. */
s32 func_ov086_02212cf0(const void *actor) {
  return F(const s16, actor, 0xd6) != 16;
}

/* Return whether primary state is five or six. */
s32 func_ov086_02212d10(const void *actor) {
  s16 state = F(const s16, actor, 0xd6);
  return state == 5 || state == 6;
}

/* Return whether secondary state is nine or ten. */
s32 func_ov086_02212d28(const void *actor) {
  s16 state = F(const s16, actor, 0xd8);
  return state == 9 || state == 10;
}

/* Return whether primary state is nine or ten. */
s32 func_ov086_02212d40(const void *actor) {
  s16 state = F(const s16, actor, 0xd6);
  return state == 9 || state == 10;
}

/* Return the subclass's fixed half-unit 20.12 step. */
s32 func_ov086_02212d58(void) { return 0x800; }

/* Return the paired fixed half-unit 20.12 step. */
s32 func_ov086_02212d60(void) { return 0x800; }

/* Intentional inherited callback no-op. */
void func_ov086_02212d68(void) {}

/* Intentional paired inherited callback no-op. */
void func_ov086_02212d6c(void) {}

/* Toggle bit 2 on the auxiliary presentation at actor offset 0x288; nonzero
 * means visible and zero means hidden. */
void func_ov086_02212d70(void *actor, s32 visible) {
  void *presentation = F(void *, actor, 0x288);
  if (visible == 0)
    F(u16, presentation, 0x24) |= 4;
  else
    F(u16, presentation, 0x24) &= (u16)~4;
}

/* Return the subclass's fixed 20.12 distance of 32 pixels. */
s32 func_ov086_02212d90(void) { return 0x20000; }
