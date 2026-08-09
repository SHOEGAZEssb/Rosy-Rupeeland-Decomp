/*
 * Recovered overlay 430 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * One initialized record retains a confirmed reference to main-module state.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov430_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov430_02233ca0[];
extern unsigned char data_ov430_02234432[];
extern unsigned char data_ov430_022346a0[];
extern unsigned char data_ov430_022346a4[];
