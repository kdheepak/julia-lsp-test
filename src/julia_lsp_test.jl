module julia_lsp_test

using JSON
using JSON3

using PackageCompiler
using Franklin

greet() = print("Hello World!")

function hello()
    println("hello world")
end

end # module
