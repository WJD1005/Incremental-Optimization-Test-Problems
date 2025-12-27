clear
clc

D = 50;
lb = -100;
ub = 100;

rng(0)

for func_num = 1 : 30
    padding_data = lb + rand(1, D) * (ub - lb);
    save(sprintf('./IOP_data/padding_data_%d_D50.txt', func_num), 'padding_data', '-ascii', '-double', '-tabs')
end