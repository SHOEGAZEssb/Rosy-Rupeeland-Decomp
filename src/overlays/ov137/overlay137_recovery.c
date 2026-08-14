/*
 * Recovered overlay 137 compact interpreter-data subsystem.
 *
 * The overlay registers a large initialized bytecode-like record set with the
 * engine and owns two trailing zero-initialized work fields. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

typedef struct ActorSpawnDescriptor {
    unsigned char bytes[0x64];
} ActorSpawnDescriptor;

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, int unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(const void *callback);
extern void func_02008f58(void *records);

/* Exact initialized records and zero-initialized work fields used by the overlay. */
extern unsigned char data_ov137_0221d720[];
extern ActorSpawnDescriptor data_ov137_0221d734[];
extern unsigned char data_ov137_0221f805[];
extern unsigned char data_ov137_02233c40[];
extern unsigned char data_ov137_02233c44[];

/*
 * When mode is zero, initialize shared interaction state, spawn this area's
 * category-one descriptor batch, publish its auxiliary records, and install
 * its script callback. Nonzero modes leave the shared runtime unchanged.
 */
void func_ov137_0221d6c0(int mode)
{
    if (mode != 0)
        return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov137_02233c44, 3, data_ov137_0221d734);
    ActorInteractionRuntime_NoOp(data_ov137_02233c40);
    func_02008f58(data_ov137_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov137_0221f805);
}
