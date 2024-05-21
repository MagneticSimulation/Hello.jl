module Hello



abstract type MeshGPU end


add2(a) = a.+2

add_gpu(a,b) = a.+b


greet() = print("Hello World!")

add(a,b) = a+b

add(a, b, c) = a+b+c
end # module
