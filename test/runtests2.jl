using Hello
using Test
using CUDA

a = CUDA.zeros(10)
b = CUDA.zeros(10)

Hello.add2(a)

mesh =  Hello.FDMeshGPU(dx=1.1e-9, nx=10, ny=2)
@test isapprox(mesh.dx*1.0, 1.1e-9, rtol=1e-7) #FIXME: shall we always use Float64 for dx, dy and dz?
@test mesh.nx == 10
#println(mesh.ngbs)
@test isapprox(mesh.volume*1.0, 1.1e-27, rtol=1e-7)

Hello.add_gpu(a,b)
Hello.greet()

Hello.test_gpu()

@test Hello.add(1,2) == 3
