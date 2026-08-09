/*
 * Recovered overlay 433 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Its records retain confirmed references to two main-module work areas.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov433_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov433_02233ca0[];
extern unsigned char data_ov433_0223455e[];
extern unsigned char data_ov433_02234860[];
extern unsigned char data_ov433_02234864[];
