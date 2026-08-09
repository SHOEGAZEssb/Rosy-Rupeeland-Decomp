/*
 * Recovered overlay 439 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Additional embedded record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov439_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov439_02233ca0[];
extern unsigned char data_ov439_022343ce[];
extern unsigned char data_ov439_02234640[];
extern unsigned char data_ov439_02234644[];
