#include "slick.sh"

_command void ddir () name_info (','VSARG2_EDITORCTL)
{
   activate_build ();
   _str cmdline=get_env ("COMSPEC") " /c dir" " 2>&1";
   concur_command (cmdline, false, true, false, false);
}


