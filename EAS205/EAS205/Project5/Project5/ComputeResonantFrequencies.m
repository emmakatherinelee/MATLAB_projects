%computes expected resonance frequencies for a given elastic system via
%finding the imaginary parts of the
%eigenvalues of the state-space coefficients matrix

%note, it ignores complex conjugate pairs and does not output negative
%imaginary parts
function resonances = ComputeResonantFrequencies(A)
[V, D] = eig(full(A)); %V are columns and D are values
resfreq = nonzeros(imag(D));
resonances = sort(resfreq);
resonances = resonances(resonances>0);
end

