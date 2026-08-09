/*
 * Recovered overlay 431 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Additional embedded record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov431_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov431_02233ca0[];
extern unsigned char data_ov431_02234432[];
extern unsigned char data_ov431_022346a0[];
extern unsigned char data_ov431_022346a4[];
