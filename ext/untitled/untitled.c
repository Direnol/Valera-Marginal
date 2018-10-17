#include "untitled.h"

VALUE rb_mUntitled;

void
Init_untitled(void)
{
  rb_mUntitled = rb_define_module("Untitled");
}
