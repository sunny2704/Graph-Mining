function PageRank_pow_iter
%implementation of pagerank using power iteration method
dbstop if error; clear; clc; close all;

df = 0.85;

adj_mat = [
1 1 1 1 1 1 1 1 1 1 1; % node 1
0 0 1 0 0 0 0 0 0 0 0; % node 2
0 1 0 0 0 0 0 0 0 0 0; % node 3
1 1 0 0 0 0 0 0 0 0 0; % node 4
0 1 0 1 0 1 0 0 0 0 0; % node 5
0 1 0 0 1 0 0 0 0 0 0; % node 6
0 1 0 0 1 0 0 0 0 0 0; % node 7
0 1 0 0 1 0 0 0 0 0 0; % node 8
0 1 0 0 1 0 0 0 0 0 0; % node 9
0 0 0 0 1 0 0 0 0 0 0; % node 10
0 0 0 0 1 0 0 0 0 0 0; % node 11
];

num_node = size(adj_mat,1);
degree = sum(adj_mat,2);
deg_matrix = diag(degree);
deg_mat_inv = pinv(deg_matrix);
prob_mat = deg_mat_inv * adj_mat;
pagerank_pi = [];
vec = ones(num_node,1)/ num_node;
pagerank_pi_old = vec;
while true
    pagerank_pi_new = df * transpose(prob_mat) * pagerank_pi_old + (1-df)/num_node; 
    if norm(pagerank_pi_new - pagerank_pi_old) < 10^(-6)
        pagerank_pi = pagerank_pi_new;
        break;
    end
    pagerank_pi_old = pagerank_pi_new;
end
disp("PageRank value using power iteration is :" );
disp(pagerank_pi);