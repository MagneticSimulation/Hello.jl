using Hello
using Test

Hello.greet()

Hello.test_gpu()

@test Hello.add(1,2) == 3
