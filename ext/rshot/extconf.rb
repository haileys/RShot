require "mkmf"

$DLDFLAGS << " -framework Foundation -framework AppKit -framework WebKit"
$CFLAGS << " -std=c99"
create_makefile "rshot/rshot"