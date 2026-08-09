/*
 * Recovered overlay 421 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Its data also references a confirmed exported record from overlay 137.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov421_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov421_02233ca0[];
extern unsigned char data_ov421_022344fa[];
extern unsigned char data_ov421_022347a0[];
extern unsigned char data_ov421_022347a4[];
