/*
 * Recovered overlay 388 interpreter-data subsystem.
 *
 * The overlay installs an initialized table as a three-entry runtime block,
 * registers an additional interpreter record, and exposes a work word to the
 * engine. Individual record semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov388_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov388_02233ca0[];
extern unsigned char data_ov388_022346ee[];
extern unsigned char data_ov388_02234ba0[];
extern unsigned char data_ov388_02234ba4[];
