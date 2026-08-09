/*
 * Recovered overlay 408 interpreter-data subsystem.
 *
 * The overlay registers a 51-entry initialized table, installs an additional
 * interpreter record, and exposes a zero-initialized work word to the engine.
 * Individual table-entry semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov408_02233c60(void);

/* Principal initialized records and the zero-initialized work word used by the initializer. */
extern unsigned char data_ov408_02233ca0[];
extern unsigned char data_ov408_02233cd4[];
extern unsigned char data_ov408_0223465a[];
extern unsigned char data_ov408_02234960[];
