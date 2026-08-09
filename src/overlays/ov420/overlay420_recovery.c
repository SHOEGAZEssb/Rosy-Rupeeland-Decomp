/*
 * Recovered overlay 420 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Its data also references a confirmed exported callback from overlay 74.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov420_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov420_02233ca0[];
extern unsigned char data_ov420_02234432[];
extern unsigned char data_ov420_022346a0[];
extern unsigned char data_ov420_022346a4[];
