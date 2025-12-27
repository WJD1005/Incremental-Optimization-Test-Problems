function func = get_iop_func(func_num, stage)
%GET_IOP_FUNC Get the objective function of specified problem and stage
% The objective function input parameter is population with size popsize*problem_size.
% Type 1: F1--F10
% Type 2: F11--F20
% Type 3: F21--F30
% =====Reference===== 
% [1] N. H. Awad, M. Z. Ali, J. J. Liang, B. Y. Qu, and P.N. Suganthan,
% Problem definitions and evaluation criteria for the CEC 2017 special
% session and competition on single objective real-parameter numerical
% optimization, Nanyang Technological University, 2016.
% [2] R. Cheng, M. N. Omidvar, A. H. Gandomi, B. Sendhoff, S. Menzel, and
% X. Yao, Solving Incremental Optimization Problems via Cooperative
% Coevolution, IEEE Transactions on Evolutionary Computation, vol. 23,
% no. 5, pp. 762-775, 2019.


if func_num >= 1 && func_num <= 30
    func = @(x)CEC17_IOP(x', func_num, stage);
elseif func_num >= 31 && func_num <= 37
    imop(func_num - 30);
    func = @(x)imop(x', stage);
else
    error('Error: undefined function');
end

