
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include "tkGlue.def"

#include "pTk/tkPort.h"
#include "pTk/tkTable.h"
#include "pTk/tkInt.h"
#include "pTk/tkVMacro.h"
#include "tkGlue.h"
#include "tkGlue.m"

/* perltk TableMatrix's replacement for TCL_unsetVar. deletes an element in a hash */
EXTERN void	tkTableUnsetElement _ANSI_ARGS_((Var hashEntry, char * key)){
	int len;
	
	len = strlen(key);
	hv_delete( (HV*) hashEntry, key, len, G_DISCARD);
}


DECLARE_VTABLES;

MODULE = Tk::TableMatrix	PACKAGE = Tk

PROTOTYPES: DISABLE

void
tablematrix(...)
CODE:
 {
  XSRETURN(XSTkCommand(cv,(Tcl_CmdProc *)Tk_TableObjCmd,items,&ST(0)));
 }

BOOT:
 {
  IMPORT_VTABLES;
 }
