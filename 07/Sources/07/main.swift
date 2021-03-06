import Foundation

func main(path: String) {
    let pathPrefix = (path as NSString).deletingPathExtension
    let writeFileName = "\(pathPrefix).asm"
    let parser = Parser(path: path)
    let codeWriter = CodeWriter()
    codeWriter.setFileName(fileName: writeFileName)

    do {
        while parser.hasMoreCommands() {
            parser.advance()
            let commandType = parser.commandType()
            switch commandType {
            case .C_ARITHMETRIC:
                print("算術演算: \(parser.label())")
                codeWriter.writeArithmetic(command: parser.label())
            case .C_PUSH:
                print("プッシュ")
                print(" - " + parser.arg1())
                print(" - " + String(parser.arg2()))

                codeWriter.writePushPop(command: .push, segment: parser.arg1(), index: parser.arg2())
            case .C_POP:
                print("ポップ")
                print(" - " + parser.arg1())
                print(" - " + String(parser.arg2()))
                codeWriter.writePushPop(command: .pop, segment: parser.arg1(), index: parser.arg2())
            case .C_LABEL:
                print("ラベル")
                print(" - " + parser.arg1())
            case .C_GOTO:
                print("ゴー")
                print(" - " + parser.arg1())
            case .C_IF:
                print("条件分岐")
                print(" - " + parser.arg1())
            case .C_FUNCTION:
                print("関数")
                print(" - " + parser.arg1())
                print(" - " + String(parser.arg2()))
            case .C_RETURN:
                print("リターン")
            case .C_CALL:
                print("コール")
                print(" - " + parser.arg1())
                print(" - " + String(parser.arg2()))
            }
        }
    }
}



if CommandLine.arguments.count == 2  {
    main(path: CommandLine.arguments[1])
}
