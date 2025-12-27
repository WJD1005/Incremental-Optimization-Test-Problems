# Incremental Optimization Test Problems

## Introduction

This repository provides the test problems in the paper: [waiting for update](). It contains 37 test problems for incremental optimization. F1--F30 are modified from the 50-D CEC2017 benchmark suite [[1]](#CEC2017) (code is from [here](https://github.com/P-N-Suganthan/CEC2017-BoundContrained)), and F31--F37 are proposed by Cheng et al. [[2]](#CBCC) (code is from [here](https://github.com/EMI-Group/Incremental-Optimization)).

## Usage

There are only two functions available for testing purpose: `get_iop_info(func_num)` and `get_iop_func(func_num, stage)`; other functions should not be called by the algorithm.

`get_iop_info(func_num)` returns relevant information about the test problem specified by `func_num` from 1 to 37. The information includes lower and upper bound, the number of stages, and the number of variables of increment and total problem at each stage, respectively.

`get_iop_func(func_num, stage)` returns the objective function handle for evaluation for specified `func_num` (from 1 to 37) and `stage` (from 1 to the corresponding number of stages). The input of objective function is the population with size `pop_size*problem_size`, and the size of returned fitness is `1*pop_size`.

Here is a simple example:

```matlab
% population size
NP = 100;

% problem
func_num = 1;
stage = 1;
IOP_info = get_iop_info(func_num);
objfun = get_iop_func(func_num, stage);

% population
pop = IOP_info.lb + rand(NP, IOP_info.dim(stage)) * (IOP_info.ub - IOP_info.lb);

% evaluation
fitness = objfun(pop);
```

If random number generator needs to be set, it is recommended to use `rng()` instead of `rand()` to avoid unexpected problems.

## Citation

Welcome to use these test problems in your research. Please cite our paper, and also [[1]](#CEC2017) (for F1--F30) [[2]](#CBCC) (for F31--F37).

```bibtex
@article{AUCBCC,
    waiting for update
}
```

## Reference

<span id="CEC2017"></span>
[1]	N. H. Awad, M. Z. Ali, J. J. Liang, B. Y. Qu, and P. N. Suganthan, Problem definitions and evaluation criteria for the CEC 2017 special session and competition on single objective real-parameter numerical optimization, Nanyang Technological University, 2016.

<span id="CBCC"></span>
[2]	[R. Cheng, M. N. Omidvar, A. H. Gandomi, B. Sendhoff, S. Menzel, and X. Yao, Solving Incremental Optimization Problems via Cooperative Coevolution, IEEE Transactions on Evolutionary Computation, vol. 23, no. 5, pp. 762-775, 2019.](https://dx.doi.org/10.1109/tevc.2018.2883599)