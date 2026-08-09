/*
 * Recovered overlay 397 interpreter-data subsystem.
 *
 * The overlay registers a fifteen-entry initialized table, installs an
 * additional interpreter record, and exposes a zero-initialized work word to
 * the engine. Individual table-entry semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov397_02233c60(void);

/* Principal initialized records and the zero-initialized work word used by the initializer. */
extern unsigned char data_ov397_02233ca0[];
extern unsigned char data_ov397_02233cb0[];
extern unsigned char data_ov397_02234636[];
extern unsigned char data_ov397_022346c0[];
