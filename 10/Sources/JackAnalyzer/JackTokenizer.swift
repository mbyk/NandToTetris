class JackTokenizer {
    let source: String

    init(source: String) {
        self.source = source
    }    

    func hasMoreToken() -> Bool {
        return true
    }

    func tokenType() -> TokenType {
        return .keyword
    }
    
    func keyword() -> KeywordType {
        return .class
    }

    func symbol() -> Character {
        return "a"
    }

    func identifier() -> String {
        return ""
    }

    func intVal() -> Int {
        return 0
    }

    func stringVal() -> String {
        return ""
    }


}