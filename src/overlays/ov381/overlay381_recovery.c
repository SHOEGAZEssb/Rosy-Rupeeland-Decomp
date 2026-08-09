/*
 * Recovered overlay 381 large interpreter-data subsystem.
 *
 * The overlay installs a large initialized table as a three-entry runtime
 * block, registers an additional interpreter record, and exposes a work word
 * to the engine. Individual table-entry semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov381_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov381_02233ca0[];
extern unsigned char data_ov381_02235116[];
extern unsigned char data_ov381_02237880[];
extern unsigned char data_ov381_02237884[];
