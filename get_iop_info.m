function info = get_iop_info(func_num)
%GET_IOP_INFO Get the information of objective function of specified problem for algorithm
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
    info.lb = -100;
    info.ub = 100;
    info.stage_num = 3;
    info.increment = [get_IOP_dt(func_num, 1); get_IOP_dt(func_num, 2) - get_IOP_dt(func_num, 1); get_IOP_dt(func_num, 3) - get_IOP_dt(func_num, 2)];  % \Delta d^1 = d^1
    info.dim = [get_IOP_dt(func_num, 1); get_IOP_dt(func_num, 2); get_IOP_dt(func_num, 3)];
elseif func_num >= 31 && func_num <= 37
    design = imop(func_num - 30);
    info.lb = design.lb;
    info.ub = design.ub;
    info.stage_num = design.num_stages;
    info.increment = design.increments;
    info.increment(1) = design.dim_initial;
    info.dim = design.dims;
else
    error('Error: undefined function');
end

end

