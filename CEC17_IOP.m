function fitness = CEC17_IOP(x, func_num, stage)
%CEC17_IOP IOPs modified from 50-D CEC2017 benchmark suite
% Type 1: F1--F10
% Type 2: F11--F20
% Type 3: F21--F30
% =====Reference=====
% N. H. Awad, M. Z. Ali, J. J. Liang, B. Y. Qu, and P. N. Suganthan,
% Problem definitions and evaluation criteria for the CEC 2017 special
% session and competition on single objective real-parameter numerical
% optimization, Nanyang Technological University, 2016.


IOP_shuffle_flag = 1;  % enable intra-stage variable shuffle

fhd = @cec17_func;
D = 50;

% get the corresponding original CEC2017 function
if func_num <= 10
    cec17_func_num = func_num + 10;
elseif func_num <= 20
    cec17_func_num = func_num;
elseif func_num <= 30
    cec17_func_num = func_num;
else
    error('Error: undefined function');
end

% get the number of decision variables at the specified stage
dt = get_IOP_dt(func_num, stage);

% evaluate in the corresponding CEC2017 function
IOP_padding_data = load(sprintf('./IOP_data/padding_data_%d_D50.txt', func_num));
X = zeros(D, size(x, 2));
X(1 : dt, :) = x;
X(dt + 1 : D, :) = repmat(IOP_padding_data(dt + 1 : D)', 1, size(x, 2));  % variable padding
if cec17_func_num <= 20
    if IOP_shuffle_flag
        IOP_shuffle_data = load(sprintf('./IOP_data/shuffle_data_%d_D50.txt', func_num));
        X = X(IOP_shuffle_data, :);  % intra-stage variable shuffle
    end
    cec17_shuffle_data = load(sprintf('./input_data/shuffle_data_%d_D50.txt', cec17_func_num));
    X(cec17_shuffle_data, :) = X;  % restore the original order of variables of hybrid function by inverse shuffle
end
fitness = fhd(X, cec17_func_num) - cec17_func_num * 100;
