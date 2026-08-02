// Prints the instructions for functions selected by name or entry address.
// @category Tingle

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Symbol;

public class DisassembleFunctions extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] arguments = getScriptArgs();
        if (arguments.length == 0) {
            throw new IllegalArgumentException(
                "usage: DisassembleFunctions.java <function-name-or-address> ...");
        }

        FunctionManager functions = currentProgram.getFunctionManager();
        Listing listing = currentProgram.getListing();

        for (String argument : arguments) {
            Function function = findFunction(functions, argument);
            if (function == null) {
                println("DISASSEMBLY_MISSING " + argument);
                continue;
            }

            println("DISASSEMBLY_BEGIN " + function.getName() + " @ " +
                    function.getEntryPoint());
            Address end = function.getBody().getMaxAddress();
            InstructionIterator instructions =
                listing.getInstructions(function.getEntryPoint(), true);
            while (instructions.hasNext()) {
                Instruction instruction = instructions.next();
                if (instruction.getAddress().compareTo(end) > 0) {
                    break;
                }
                println(instruction.getAddress() + "  " + instruction);
            }
            println("DISASSEMBLY_END " + function.getName());
        }
    }

    private Function findFunction(FunctionManager functions, String argument) {
        for (Symbol symbol : currentProgram.getSymbolTable().getSymbols(argument)) {
            Function function = functions.getFunctionAt(symbol.getAddress());
            if (function != null) {
                return function;
            }
        }

        try {
            String value = argument.startsWith("0x") ? argument.substring(2) : argument;
            Address address = currentProgram.getAddressFactory()
                .getDefaultAddressSpace().getAddress(value);
            Function function = functions.getFunctionAt(address);
            return function != null ? function : functions.getFunctionContaining(address);
        } catch (Exception exception) {
            return null;
        }
    }
}
