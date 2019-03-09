class AddCommand {

    init() {

    }

}

extension AddCommand: Command {

    func convert() -> String {
        let asm: String 
        asm = """
        // add
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        M=M+D
        @SP
        M=M+1
        """
        return asm
    }

}