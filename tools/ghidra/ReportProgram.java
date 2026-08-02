// Reports high-level program statistics and the ARM9 entry-point call tree.
// @category Tingle

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

public class ReportProgram extends GhidraScript {
    private static final long ARM9_ENTRY = 0x02000800L;
    private static final int MAX_DEPTH = 3;

    @Override
    protected void run() throws Exception {
        FunctionManager functions = currentProgram.getFunctionManager();
        Listing listing = currentProgram.getListing();

        println("PROGRAM name=" + currentProgram.getName());
        println("PROGRAM language=" + currentProgram.getLanguageID());
        println("PROGRAM compiler=" + currentProgram.getCompilerSpec().getCompilerSpecID());
        println("COUNTS memory_blocks=" + currentProgram.getMemory().getBlocks().length);
        println("COUNTS functions=" + functions.getFunctionCount());
        println("COUNTS instructions=" + listing.getNumInstructions());
        println("COUNTS defined_data=" + listing.getNumDefinedData());
        println("COUNTS symbols=" + currentProgram.getSymbolTable().getNumSymbols());

        Address entry = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(ARM9_ENTRY);
        Function entryFunction = functions.getFunctionAt(entry);
        if (entryFunction == null) {
            entryFunction = functions.getFunctionContaining(entry);
        }
        if (entryFunction == null) {
            println(String.format("ENTRY 0x%08x has no function", ARM9_ENTRY));
            return;
        }

        println("ENTRY_CALL_TREE");
        printCallTree(entryFunction, 0, new HashSet<>());
    }

    private void printCallTree(Function function, int depth, Set<String> path) {
        String key = function.getEntryPoint().toString(true);
        String indent = "  ".repeat(depth);
        println(indent + function.getName() + " @ " + key);
        if (depth >= MAX_DEPTH || path.contains(key)) {
            return;
        }

        path.add(key);
        for (Function called : directCalls(function)) {
            printCallTree(called, depth + 1, path);
        }
        path.remove(key);
    }

    private Set<Function> directCalls(Function function) {
        Set<Function> result = new LinkedHashSet<>();
        InstructionIterator instructions = currentProgram.getListing().getInstructions(function.getBody(), true);
        while (instructions.hasNext()) {
            Instruction instruction = instructions.next();
            for (Reference reference : instruction.getReferencesFrom()) {
                if (!reference.getReferenceType().isCall()) {
                    continue;
                }
                Function called = currentProgram.getFunctionManager().getFunctionAt(reference.getToAddress());
                if (called != null) {
                    result.add(called);
                }
            }
        }
        return result;
    }
}
