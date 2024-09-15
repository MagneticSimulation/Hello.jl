using Documenter
using Hello

makedocs(
    sitename = "Hello",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true"
    ),
    modules = [Hello],
    pages = Any[
        "notes.md",
        "index.md",
        "equations.md"
        ]
)

deploydocs(
    repo = "github.com/MagneticSimulation/Hello.jl"
)
