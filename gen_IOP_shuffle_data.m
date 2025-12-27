clear
clc

D = 50;

rng(0)

for func_num = 1 : 20
    rand_seq = randperm(D);
    shuffle_data = zeros(1, D);
    s = 1;
    for t = 1 : 3
        dt = get_IOP_dt(func_num, t);
        shuffle_data(s : dt) = rand_seq(rand_seq >= s & rand_seq <= dt);  % intra-stage
        s = dt + 1;
    end
    f = fopen(sprintf('./IOP_data/shuffle_data_%d_D50.txt', func_num), 'w');
    fprintf(f, '%d\t', shuffle_data);
    fclose(f);
end