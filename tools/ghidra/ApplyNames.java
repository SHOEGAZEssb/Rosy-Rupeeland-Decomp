// Apply address=name pairs to functions or labels in the current program.
//
// Headless example:
//   -postScript ApplyNames.java 02001064=UpdateKeyState

//@category Tingle

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.SourceType;
import ghidra.program.model.symbol.Symbol;
import ghidra.program.model.symbol.SymbolTable;

public class ApplyNames extends GhidraScript {
    @Override
    public void run() throws Exception {
        SymbolTable symbolTable = currentProgram.getSymbolTable();

        String[] arguments = getScriptArgs();
        for (int argumentIndex = 0; argumentIndex < arguments.length; argumentIndex++) {
            String argument = arguments[argumentIndex];
            int separator = argument.indexOf('=');
            String addressText;
            String name;

            if (separator > 0 && separator < argument.length() - 1) {
                addressText = argument.substring(0, separator);
                name = argument.substring(separator + 1);
            } else if (argumentIndex + 1 < arguments.length) {
                addressText = argument;
                name = arguments[++argumentIndex];
            } else {
                printerr("INVALID_NAME_ARGUMENT " + argument);
                break;
            }

            if (addressText.startsWith("0x")) {
                addressText = addressText.substring(2);
            }
            Address address = toAddr(addressText);
            Function function = currentProgram.getFunctionManager().getFunctionAt(address);

            if (function != null) {
                String oldName = function.getName();
                function.setName(name, SourceType.USER_DEFINED);
                println("RENAMED_FUNCTION " + address + " " + oldName + " -> " + name);
                continue;
            }

            Symbol symbol = symbolTable.getPrimarySymbol(address);
            if (symbol == null) {
                symbol = symbolTable.createLabel(address, name, SourceType.USER_DEFINED);
                println("CREATED_LABEL " + address + " " + name);
            } else {
                String oldName = symbol.getName();
                symbol.setName(name, SourceType.USER_DEFINED);
                println("RENAMED_LABEL " + address + " " + oldName + " -> " + name);
            }
        }
    }
}
