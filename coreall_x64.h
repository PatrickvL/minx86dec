#ifndef MX86_CORE_X64_H
#define MX86_CORE_X64_H

#include "minx86dec/state.h"

/* general decoding of all instructions. not trying to limit to realistic CPU model */
/* use this for a general decompiler and you don't fucking care what model :) */
void minx86dec_decodeall_x64(struct minx86dec_state_x64 *state,struct minx86dec_instruction_x64 *ins);

#endif /* */

