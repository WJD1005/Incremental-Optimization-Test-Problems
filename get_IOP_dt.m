function dt = get_IOP_dt(func_num, t)
%GET_IOP_DT get Get the number of decision variables at the specified stage
% =====Reference===== 
% N. H. Awad, M. Z. Ali, J. J. Liang, B. Y. Qu, and P.N. Suganthan,
% Problem definitions and evaluation criteria for the CEC 2017 special
% session and competition on single objective real-parameter numerical
% optimization, Nanyang Technological University, 2016.

Dt = [
    % Type 1
    10, 30, 50; % F11, p=[0.2, 0.4, 0.4]
    15, 30, 50; % F12, p=[0.3, 0.3, 0.4]
    15, 30, 50; % F13, p=[0.3, 0.3, 0.4]
    20, 30, 50; % F14, p=[0.2, 0.2, 0.2, 0.4]
    10, 35, 50; % F15, p=[0.2, 0.2, 0.3, 0.3]
    10, 35, 50; % F16, p=[0.2, 0.2, 0.3, 0.3]
    25, 35, 50; % F17, p=[0.1, 0.2, 0.2, 0.2, 0.3]
    10, 40, 50; % F18, p=[0.2, 0.2, 0.2, 0.2, 0.2]
    20, 40, 50; % F19, p=[0.2, 0.2, 0.2, 0.2, 0.2]
    30, 40, 50; % F20, p=[0.1, 0.1, 0.2, 0.2, 0.2, 0.2]
    
    % Type 2
    5,  25, 50; % F11, p=[0.2, 0.4, 0.4]
    5,  20, 50; % F12, p=[0.3, 0.3, 0.4]
    10, 25, 50; % F13, p=[0.3, 0.3, 0.4]
    15, 35, 50; % F14, p=[0.2, 0.2, 0.2, 0.4]
    15, 25, 50; % F15, p=[0.2, 0.2, 0.3, 0.3]
    15, 30, 50; % F16, p=[0.2, 0.2, 0.3, 0.3]
    20, 30, 50; % F17, p=[0.1, 0.2, 0.2, 0.2, 0.3]
    15, 35, 50; % F18, p=[0.2, 0.2, 0.2, 0.2, 0.2]
    15, 25, 50; % F19, p=[0.2, 0.2, 0.2, 0.2, 0.2]
    15, 35, 50; % F20, p=[0.1, 0.1, 0.2, 0.2, 0.2, 0.2]
    
    % Type 3
    15, 30, 50; % F21
    15, 30, 50; % F22
    20, 35, 50; % F23
    20, 35, 50; % F24
    10, 20, 50; % F25
    10, 20, 50; % F26
    30, 40, 50; % F27
    30, 40, 50; % F28
    20, 30, 50; % F29
    10, 40, 50; % F30
];

dt = Dt(func_num, t);

end

