/*
 * Recovered overlay 398 interpreter-data subsystem.
 *
 * The overlay registers a three-entry initialized table, installs an
 * additional interpreter record, and exposes a second work word to the engine.
 * Individual table-entry semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov398_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov398_02233ca0[];
extern unsigned char data_ov398_0223436a[];
extern unsigned char data_ov398_02234380[];
extern unsigned char data_ov398_02234384[];
