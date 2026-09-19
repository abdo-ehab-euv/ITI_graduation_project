import math

                                     
N = 12
M = 6

                   
num_points = 1 << (N - 2)                                      
max_amp = (1 << (M - 1)) - 1                                              

with open("LUT.mem", "w") as f:
    for i in range(num_points):
                                                            
        theta = (math.pi / 2.0) * (i / num_points)
        
                                                                         
        sin_val = round(max_amp * math.sin(theta))
        cos_val = round(max_amp * math.cos(theta))
        
                                                         
                                                                                            
        word = (sin_val << M) | cos_val
        
                                              
        f.write(f"{word:03X}\n")

print(f"Generated LUT.mem with {num_points} entries.")