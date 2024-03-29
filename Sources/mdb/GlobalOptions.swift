import ArgumentParser

struct GlobalOptions: ParsableArguments {
    @OptionGroup()
    var server: ServerOptions
}

struct ServerOptions: ParsableArguments {
    @Option(name: .shortAndLong, help: "The MDB server port.")
    var port: UInt?
}
