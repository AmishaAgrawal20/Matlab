close all; clear; clc;

% Setup optimization options
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');

% Define guess values
xy_guess = [0,0];

% Call optimization algorithm
[xy_opt,fval] = fminunc(@rosenbrock_func,xy_guess,options)

% Objective function
function f = rosenbrock_func(in)
    % Unpack inputs
    x1 = in(1);
    x2 = in(2);
    
    % The Rosenbrock function in 2D
    f =  100*(x2 - x1^2)^2 + (1 - x1)^2;

end
