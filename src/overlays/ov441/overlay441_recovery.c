/*
 * Recovered overlay 441 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs a large embedded
 * interpreter script, and publishes a separate zero-initialized engine work
 * word. Address-derived names remain because the record semantics are not yet
 * confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov441_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov441_02233ca0[];
extern unsigned char data_ov441_022343ce[];
extern unsigned char data_ov441_02234640[];
extern unsigned char data_ov441_02234644[];
