// Decompile one or more functions in a synchronized dsd-ghidra project.
//
// Headless example:
//   -postScript DecompileFunctions.java main func_02002330 0x02000f10

//@category Tingle

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;

public class DecompileFunctions extends GhidraScript {
    private Function findFunction(String query) throws Exception {
        if (query.startsWith("0x") || query.matches("[0-9a-fA-F]{8}")) {
            String value = query.startsWith("0x") ? query.substring(2) : query;
            Address address = toAddr(value);
            Function function = currentProgram.getFunctionManager().getFunctionAt(address);
            if (function == null) {
                function = currentProgram.getFunctionManager().getFunctionContaining(address);
            }
            return function;
        }

        FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(true);
        while (functions.hasNext()) {
            Function function = functions.next();
            if (function.getName().equals(query)) {
                return function;
            }
        }
        return null;
    }

    @Override
    public void run() throws Exception {
        String[] queries = getScriptArgs();
        if (queries.length == 0) {
            queries = new String[] { "main" };
        }

        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        decompiler.setSimplificationStyle("decompile");

        if (!decompiler.openProgram(currentProgram)) {
            printerr("Could not initialize the decompiler for " + currentProgram.getName());
            return;
        }

        try {
            for (String query : queries) {
                Function function = findFunction(query);
                if (function == null) {
                    printerr("FUNCTION_NOT_FOUND " + query);
                    continue;
                }

                println("DECOMPILE_BEGIN " + function.getName() + " @ " + function.getEntryPoint());
                DecompileResults results = decompiler.decompileFunction(function, 60, monitor);
                if (!results.decompileCompleted() || results.getDecompiledFunction() == null) {
                    printerr("DECOMPILE_FAILED " + function.getName() + ": " + results.getErrorMessage());
                } else {
                    println(results.getDecompiledFunction().getC());
                }
                println("DECOMPILE_END " + function.getName());
            }
        } finally {
            decompiler.dispose();
        }
    }
}
