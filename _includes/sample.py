# sample.py
from egfrd import *

s = EGFRDSimulator(worldSize=1e-6)

A = Species('A', D=1e-12, radius=2.5e-8)
B = Species('B', D=1e-12, radius=2.5e-8)
C = Species('C', D=1e-12, radius=2.5e-8)

s.addReaction([A, B], [C], k=1e-18)

s.throwInParticles(A, 100)
s.throwInParticles(B, 100)

while s.t < 100:
    s.step()
