This repo should be used to assess the state of the hardware acceleration
issue.

Currently, pyglet requires a graphical interface to obtain the observations. On
a GPU server, we don't have access to a display, so we use a virtual
framebuffer (xvfb). Unfortunately, this solution does not enable us to use the
GPU for rendering and makes it impossible to use hardware acceleration for the
simulation. The root problem is that Pyglet does not support the EGL interface
(More info on the bitbucket + github issues).

This repo serves as a test to assess success of a solution. To test if the
renderer is using the GPU or the CPU, build the
container: (Make sure to use a machine that has a GPU)

`$ docker built -t hwtest .`

then run it:

`$ docker run hwtest`

You should see the following output:

`{'vendor': 'VMware, Inc.', 'renderer': 'llvmpipe (LLVM 7.0, 256 bits)',
'version': '3.3 (Core Profile) Mesa 18.3.6', 'shading-language-version':
'3.30'}`

As long as we see the renderer being `llvmpipe`, then we are not using the GPU
and hardware acceleration is impossible.
