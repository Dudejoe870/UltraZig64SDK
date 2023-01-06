# UltraZig64SDK

The UltraZig64 SDK is a homebrew Nintendo64 SDK with a Zig-based toolchain, which itself is based on LLVM, allowing for remarkably easy cross-compilation on both Linux, Windows, and MacOS (Arm and x86).

Currently it focuses on support for the Zig programming language, however in the future it could be possible to support both C and C++ (though [libdragon](https://github.com/DragonMinded/libdragon) might be a better fit for that). And since it's all based on current technologies, the very latest versions of these languages can be supported (including versions of the languages that haven't been released yet), allowing for a very modern programming experience. And with the power of Zig, potentially very high performance due to compile-time semantics being very powerful in the language allowing for some fun things that I'm sure haven't been experimented with yet on the Console of the Nintendo64.
