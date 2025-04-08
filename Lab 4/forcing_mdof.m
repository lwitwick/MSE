function force=forcing_mdof(t)

global freq %global variable defined in the main .m program. This is the excitation frequency.
global ampl %global variable defined in the main .m program. This is the excitation amplitude.

force=ampl*sin(2*pi*freq*t);%Single-sine forcing function with frequency and amplitude as defined in the main program 

end