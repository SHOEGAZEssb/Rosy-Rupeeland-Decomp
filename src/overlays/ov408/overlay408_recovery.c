/*
 * Recovered overlay 408 interpreter-data subsystem.
 *
 * The overlay registers a 51-entry initialized table, installs an additional
 * interpreter record, and exposes a zero-initialized work word to the engine.
 * Individual table-entry semantics remain unconfirmed.
 */

typedef struct ActorSpawnDescriptor {
    unsigned char bytes[0x64];
} ActorSpawnDescriptor;
typedef struct GamePhaseRegionTable GamePhaseRegionTable;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, int unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(const void *callback);
extern void GamePhaseRegionTable_PublishActive(GamePhaseRegionTable *table);

/* Principal initialized records and the zero-initialized work word used by the initializer. */
extern void *data_ov408_02233ca0[];
extern ActorSpawnDescriptor data_ov408_02233cd4[];
extern unsigned char data_ov408_0223465a[];
extern GamePhaseRegionTable data_ov408_02234960;

/*
 * Spawn the area's category-two descriptor batch, install its script
 * callback, and publish the overlay-owned phase-region table.
 */
void func_ov408_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov408_02233ca0, 0x33, data_ov408_02233cd4);
    ActorDescriptorBatch_SetCategory2Callback(data_ov408_0223465a);
    GamePhaseRegionTable_PublishActive(&data_ov408_02234960);
}
